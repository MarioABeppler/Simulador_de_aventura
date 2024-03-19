local nodeloader = {}

local nodeDictionary = {} ---@type table<string,Node>
local initialNode = nil ---@type Node

local function loadNode(path)
    local success, nodeOrErr = pcall(function ()
        return require(path)
    end)
    if not success then
        warn("falha ao carregar o node " .. path .. ". O Arquivo não foi encontrado.")
        return
    end
    local node = nodeOrErr ---@type Node
    if nodeDictionary[node.id] ~= nil then
        warn("falha ao carregar o node " .. path .. ". O ID " .. node.id .. " já está registrado.")
        return
    end
    nodeDictionary[node.id] = node
end

--- Carregar todos os Nodes internamente.
function nodeloader.loadNodes()
    nodeDictionary = {}

    ---Load initial node
    initialNode = require("nodes.start")
    nodeDictionary[initialNode.id] = initialNode

    -- Load other nodes
    loadNode("nodes.cerverom.start")
    loadNode("nodes.ice_meteor.start")
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

return  nodeloader