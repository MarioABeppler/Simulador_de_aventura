-- Constants
local ID = "cerverom.start"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Ilha Cerverom"
node.description = "Os desertos de Cerverom têm uma temperatura escaldante, você não vê um pingo de água e nem uma mísera pessoa, sua intuição diz que tem algo de errado."
node.header= [[
    .    _    +     .  ______   .          .
 (      /|\      .    |      \      .   +
     . |||||     _    | |   | | ||         .
.      |||||    | |  _| | | | |_||    .
   /\  ||||| .  | | |   | |      |       .
__||||_|||||____| |_|_____________\__________
. |||| |||||  /\   _____      _____  .   .
  |||| ||||| ||||   .   .  .         ________
 . \|`-'|||| ||||    __________       .    .
    \__ |||| ||||      .          .     .
 __    ||||`-'|||  .       .    __________
.    . |||| ___/  ___________             .
   . _ ||||| . _               .   _________
_   ___|||||__  _ \\--//    .          _
     _ `---'    .)=\oo|=(.   _   .   .    .
_  ^      .  -    . \.|
]]

-- -- Create choices
-- table.insert(node.choices, Choice:new(
--     "cerverom.start",
--     "Para a Ilha de Cerverom"
-- ))
-- table.insert(node.choices, Choice:new(
--     "iceMeteor.start",
--     "Para a Ilha congelada de Ice Meteor"
-- ))

return node