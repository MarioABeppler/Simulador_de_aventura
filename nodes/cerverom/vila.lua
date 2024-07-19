-- Constants
local ID = "cerverom.vila"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Vila Nifriron"
node.description = [[
    A vila Nifriron tem uma bifurcação onde, à sua frente, 
    há uma placa à esquerda (as grandes planícies de Cerverom), 
    à direita (a área comercial da vila), qual direção ir?
]]

-- Create choices
table.insert(node.choices, Choice:new(
    "cerverom.mercado",
    "Um rua mercantiu"
))

table.insert(node.choices, Choice:new(
    "cerverom.planicies",
    "As Grandes Planícies"
))

return node