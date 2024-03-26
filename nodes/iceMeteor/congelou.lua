-- Constants
local ID = "iceMeteor.congelou"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Congelou"
node.gameOver = true
node.description = [[%{cyan}O friu foi muito e você não resistiu.]]

return node