-- Constants
local ID = "start"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Uma Nova Aventura"
node.description = "Após vários dias de bebedeira com seus amigos, vocês decidem se aventurar no mar como Grandes Piratas. Mas diga-me, para onde vocês vão primeiro? "
node.header= [[
,---.o          |             |                  |     
`---..,-.-..   .|    ,---.,---|,---.,---.    ,---|,---.
    ||| | ||   ||    ,---||   ||   ||        |   ||---'
`---'`` ' '`---'`---'`---^`---'`---'`        `---'`---'
                                                       
                                         
,---.                |                   
|---|.    ,,---.,---.|--- .   .,---.,---.
|   | \  / |---'|   ||    |   ||    ,---|
`   '  `'  `---'`   '`---'`---'`    `---^
]]

-- Create choices
table.insert(node.choices, Choice:new(
    "cerverom.start",
    "Para a Ilha de Cerverom"
))
table.insert(node.choices, Choice:new(
    "iceMeteor.start",
    "Para a Ilha congelada de Ice Meteor"
))

return node