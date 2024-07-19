-- Constants
local ID = "cerverom.planicies"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "planices"
node.description = [[
    
]]

table.insert(node.choices, Choice:new(
    "cerverom.caverna.cavernap1",
    "Explorar a Caverna"
))

return node