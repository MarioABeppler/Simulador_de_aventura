local nodeloader = {}

local nodeDictionary = {} ---@type table<string,Node>
local initialNode = nil ---@type Node
local hasErrors = false 

---@param path string
---@return Node
local function loadNode(path)
    local success, nodeOrErr = pcall(function ()
        return require(path)
    end)
    if not success then
        warn("falha ao carregar o node " .. path .. ". O Arquivo não foi encontrado.")
        hasErrors = true
        return nil
    end
    local node = nodeOrErr ---@type Node
    if nodeDictionary[node.id] ~= nil then
        warn("falha ao carregar o node " .. path .. ". O ID " .. node.id .. " já está registrado.")
        hasErrors = true
        return nil
    end
    nodeDictionary[node.id] = node
    return node
end

---@param parentNode Node
local function loadNodesFromChoices(parentNode)
    for _, choice in pairs(parentNode.choices) do
        local destinationId = choice.destination
        if not nodeDictionary[destinationId] then
        local childNode = loadNode("nodes." .. destinationId)
            if childNode then
                loadNodesFromChoices(childNode)
            end
        end
    end
end

--- Carregar todos os Nodes internamente.
function nodeloader.loadNodes()
    nodeDictionary = {}

    ---Load initial node
    initialNode = require("nodes.start")
    nodeDictionary[initialNode.id] = initialNode

    -- Load other nodes resursively
    loadNodesFromChoices(initialNode)

    -- Validate destination
    for id, node in pairs(nodeDictionary) do
        for _, choice in pairs(node.choices) do
            local destinationId = choice.destination
            local destinationNode = nodeDictionary[destinationId]
            if destinationNode == nil then
                warn(string.format("Uma das escolhas do node %s tem como destino um node inexistente: %s", node.id, destinationId))
                hasErrors = true
            end
        end
    end

end

---Retorna todos os nodes Criados por esse script.
---@return table<string,Node>
function nodeloader.getNodes()
    return nodeDictionary
end

---Retorna o Nodfe associado com o ID
---@param nodeID string
---@return Node
function nodeloader.getNode(nodeID)
    return nodeDictionary[nodeID]
end


---Retorna o node inicial do simulador.
---@return Node
function nodeloader.getinitialNOde()
    return initialNode
end


---Retorna se esse modulo encontrou erros durante sua execução
---@return boolean
function nodeloader.hasErrors()
    return hasErrors
end

return  nodeloader