local class = require("libs.middleclass")
local  nodeLoader = require("node_loader")

---@class Engine
local Engine = class("Engine")

function Engine:initialize()
    
end

function Engine:runMainLoop()
    local node = game.activeNode
    
    -- Loop Principal
    while not game.isOver do
        -- Limpar o terminal
        -- TODO

        -- print do node
        self:printNode(node)
        -- TODO

        -- Obter escolhas Validas
        local validChoices = self:getValidChoices(node)

        -- mostras escolhas
        self:showChoices(validChoices)
        -- TODO

        -- Perguntar o usuario
        -- TODO

        -- Avança proximo Node
        -- TODO

        --TODO condição de vitoria e derrota
        game.isOver = true -- Debug Aqui a gente incerra o jogo
    end
end

---@param Node Node
function Engine:printNode(node)
    if node.header then
        print(node.header)
    end
    print("==== " .. node.title)
    print(node.description)
    print("============================================================")  
end

---@param node Node
---@return Choice[]
function Engine:getValidChoices(node)
    local result = {} ---@type Choice[]
    for _, choice in pairs(node.choices) do
        if not (choice:hasCondition()) or (choice:hasCondition() and choice:runCondition()) then
                table.insert(result, choice)
        end
    end
    return result
end

---@param choices Choice[]
function Engine:showChoices(choices)
    for i, choice in pairs(choices) do
         print(string.format("%d) %s", i, choice.description))
    end
end

return Engine