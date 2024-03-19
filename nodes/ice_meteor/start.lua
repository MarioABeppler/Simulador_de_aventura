-- Constants
local ID = "iceMeteor.start"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Ilha Congelada Ice Meteor"
node.description = "Está frio, a neve está por todo o lugar e o silêncio é ensurdecedor. Para melhorar a situação, você percebeu que seu barco está sem suprimentos alimentares, somente alguns pães mofados restaram no depósito do barco. "
node.header= [[
    _    .  ,   .           .
    *  / \_ *  / \_      _  *        *   /\'__        *
      /    \  /    \,             .    _/  /  \  *'.
 .   /\/\  /\/ :' __ \_  `          _^/  ^/    `--.
    /    \/  \  _/  \-'\      *    /.' ^_   \_   .'\  *
  /\  .-   `. \/     \ /==~=-=~=-=-;.  _/ \ -. `_/   \
 /  `-.__ ^   / .-'.--\ =-=~_=-=~=^/  _ `--./ .-'  `-
/        `.  / /       `.~-^=-=~=^=.-'      '-._ `._
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