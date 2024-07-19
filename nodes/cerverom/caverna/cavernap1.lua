-- Constants
local ID = "cerverom.caverna.cavernap1"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Caverna Piso 1"
node.description = [[
    Quando entra na caverna, uma rocha cai na porta, trancando-a. 
    Você fica preso nela. 
    É aí que percebe que não se trata de uma caverna qualquer, mas sim de uma dungeon, onde só há duas opções: esperar que alguém venha desselar a dungeon ou ir 
    para o próximo piso para ver se há algo para te ajudar a fugir. 
    Qual sua escolha? 
]]

table.insert(node.choices, Choice:new(
    "cerverom.caverna.cavernap2",
    "Ir para o proximo piso"
))

table.insert(node.choices, Choice:new(
    "cerverom.caverna.cavehelp",
    "Esperar ajuda"
))

return node