-- Constants
local ID = "cerverom.caverna.cavernap1"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Caverna Piso 1"
node.description = [[
    
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