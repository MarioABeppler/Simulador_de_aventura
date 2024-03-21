local class = require("libs.middleclass")
local  nodeLoader = require("node_loader")

---@class Engine
local Engine = class("Engine")

function Engine:initialize()
    
end

function Engine:runMainLoop()
    
    -- Loop Principal
    while not game.isOver do

        -- Get active node
        local node = game.activeNode

        -- Limpar o terminal
        -- TODO

        -- print do node
        self:printNode(node)

        -- Obter escolhas Validas
        local validChoices = self:getValidChoices(node)

        -- mostras escolhas
        self:showChoices(validChoices)

        -- Perguntar o usuario
        local choiceIndex = self:askForImput(#validChoices)
        local choice = validChoices[choiceIndex]

        -- Avança proximo Node
        local destinationId = choice.destination
        local destinatonNode = nodeLoader.getNode(destinationId)
        game.activeNode = destinatonNode

        -- TODO

        --TODO condição de vitoria e derrota
        -- game.isOver = true -- Debug Aqui a gente incerra o jogo
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

---@param amount number
---@return number
function Engine:askForImput(amount)
    while true do
        io.write("> ")
        local answerString = io.read()
        local answer = tonumber(answerString)
        local isAnswerValid = answer ~= nil and answer >= 1 and answer <= amount
        if isAnswerValid then
            return answer
        end
        print(" Resposta Invalida, Tente novamente.")
    end
end

return Engine