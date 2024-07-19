-- Constants
local ID = "cerverom.caverna.cavehelp"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "A ajuda numca vira"
node.gameOver = true
node.description = [[%{red}Ninguem numca veio Você morreu de fome.]]

return node