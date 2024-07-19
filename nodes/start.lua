-- Constants
local ID = "start"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Uma Nova Aventura"
node.description = [[
Você é um aventureiro em um navio. 
A tripulação do navio está em um dilema de para onde ir. 
Os votos foram contados, só falta o seu. 
A escolha está em suas mãos, para onde quer ir? ]]
node.header= [[%{green}
░▒█▀▀▀█░░▀░░█▀▄▀█░█░▒█░█░░█▀▀▄░█▀▄░▄▀▀▄░█▀▀▄░░░█▀▄░█▀▀░░░█▀▀▄░▄░░░▄░█▀▀░█▀▀▄░▀█▀░█░▒█░█▀▀▄░█▀▀▄
░░▀▀▀▄▄░░█▀░█░▀░█░█░▒█░█░░█▄▄█░█░█░█░░█░█▄▄▀░░░█░█░█▀▀░░░█▄▄█░░█▄█░░█▀▀░█░▒█░░█░░█░▒█░█▄▄▀░█▄▄█
░▒█▄▄▄█░▀▀▀░▀░░▒▀░░▀▀▀░▀▀░▀░░▀░▀▀░░░▀▀░░▀░▀▀░░░▀▀░░▀▀▀░░░▀░░▀░░░▀░░░▀▀▀░▀░░▀░░▀░░░▀▀▀░▀░▀▀░▀░░▀
]]

-- Create choices
table.insert(node.choices, Choice:new(
    "cerverom.start",
    "Para as planices dezertas da Ilha de Cerverom"
))
table.insert(node.choices, Choice:new(
    "iceMeteor.start",
    "Para as montanhas congelada da Ilha Ice Meteor"
))

return node