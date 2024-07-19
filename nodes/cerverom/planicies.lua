-- Constants
local ID = "cerverom.planicies"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Planícies"
node.description = [[
    Você anda pelas grandes e belas planícies de Cerverom após algum tempo de caminhada.
    É possível visualizar uma caverna. Deve-se explorar essa caverna ou retornar à vila para sua segurança?
]]

table.insert(node.choices, Choice:new(
    "cerverom.caverna.cavernap1",
    "Explorar a Caverna"
))

table.insert(node.choices, Choice:new(
    "cerverom.vila",
    "Retornar a vila"
))
return node