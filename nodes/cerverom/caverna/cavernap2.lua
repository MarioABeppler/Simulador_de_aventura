-- Constants
local ID = "cerverom.caverna.cavernap2"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Caverna Piso 2"
node.description = [[
    
]]

table.insert(node.choices, Choice:new(
    "cerverom.caverna.cavernap3",
    "Ir para o proximo piso"
))
return node