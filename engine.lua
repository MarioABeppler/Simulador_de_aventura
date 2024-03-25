local class = require("libs.middleclass")
local ansicolorsx = require("libs.ansicolors")
local  nodeLoader = require("node_loader")
local utils = require("utils")

---@class Engine
local Engine = class("Engine")

function Engine:initialize()
    
end

local function print(...)
    _G.print(ansicolorsx(...))
end

local function iowrite(...)
    io.write(ansicolorsx(...))
end

function Engine:runMainLoop()
    
    -- Loop Principal
    while not game.isOver do

        -- Get active node
        local node = game.activeNode

        -- Limpar o terminal
        utils.clearScreen()

        -- Print do node
        self:printNode(node)

        -- Processar fim do jogo
        if node.gameOver then
            print()
            print("%{red}===== Game Over =====")
            print()
            os.exit()
        elseif node.gameWon then
            print()
            print("%{green}===== Você venceu o Jogo! =====")
            print()
            os.exit()
        end

        -- Obter escolhas Validas
        local validChoices = self:getValidChoices(node)
        if #validChoices == 0 then
            warn("Nenhuma escolha válida para o node" .. node.id)
            os.exit()
        end

        -- Mostras escolhas
        self:showChoices(validChoices)

        -- Perguntar o usuario
        local choiceIndex = self:askForImput(#validChoices)
        local choice = validChoices[choiceIndex]

        -- Executar rotina da escolha
        choice:runRoutine()

        -- Avança proximo Node
        local destinationId = choice.destination
        local destinatonNode = nodeLoader.getNode(destinationId)
        game.activeNode = destinatonNode

        -- TODO

        --TODO condição de vitoria e derrota
        -- game.isOver = true -- Debug Aqui a gente incerra o jogo
    end
end

---@param title  string|nil
---@return string
local function createSeparator(title)
    local width = 50
    local result = "%{white}-----"
    local length = 5
    if title then
        result = string.format( "%s[%%{yellow}%s%%{white}]", result, title:upper())
        length = length + 2 + title:len()
    end
    for i = length, width, 1 do
        result = result .. "-"
    end
    return result
end

---@param Node Node
function Engine:printNode(node)
    if node.header then
        print(node.header)
    elseif node.gameOver then
        print(utils.getGenericGameOverHeader())
    end
    print(createSeparator(node.title))
    print(node.description)
    print(createSeparator())
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
         print(string.format("%%{white}%d) %%{yellow}%s", i, choice.description))
    end
end

---@param amount number
---@return number
function Engine:askForImput(amount)
    while true do
        iowrite("> ")
        local answerString = io.read()
        local answer = tonumber(answerString)
        local isAnswerValid = answer ~= nil and answer >= 1 and answer <= amount
        if isAnswerValid then
            return answer
        end
        print("%{red} Resposta Invalida, Tente novamente.")
    end
end

return Engine