-- Constants
local ID = "cerverom.start"

--Dependencies
local Node = require("node")
local Choice = require("choice")

-- Create node
local node = Node:new(ID) ---@type Node
node.title = "Ilha Cerverom"
node.description = [[
   Os desertos de Cerverom têm uma temperatura escaldante, todos descem do navio e contemplam a visão de uma linda vila chamada Nifriron. 
   Você gostaria de ir à Vila Nifriron? 
   Ou reclama do calor e dá a ideia de irem para Ice Meteor?
]]
node.header= [[
    .    %{green}_%{white}    +     .  ______   .          .
 (      %{green}/|\%{white}      .    |      \      .   +
     . %{green}|||||%{white}     _    | |   | | ||         .
.      %{green}|||||%{white}    | |  _| | | | |_||    .
%{green}   /\  |||||%{white} .  | | |   | |      |       .
__%{green}||||_|||||%{white}____| |_|_____________\__________
. %{green}|||| |||||  /\%{white}   _____      _____  .   .
%{green}  |||| ||||| ||||%{white}   .   .  .         ________
 . %{green}\|`-'|||| ||||%{white}    __________       .    .
 %{green}   \__ |||| ||||%{white}      .          .     .
 __    %{green}||||`-'|||%{white}  .       .    __________
.    . %{green}|||| ___/%{white}  ___________             .
   . _ %{green}|||||%{white} . _               .   _________
_   ___%{green}|||||%{white}__  _ \\--//    .          _
     _ %{green}`---'%{white}    .)=\oo|=(.   _   .   .    .
_  ^      .  -    . \.|
]]

-- Create choices
table.insert(node.choices, Choice:new(
    "cerverom.vila",
    "Ir para linda Vila Nifriron"
))
table.insert(node.choices, Choice:new(
    "iceMeteor.start",
    "Para as montanhas congelada da Ilha Ice Meteor"
))

return node