--Dependencies
local Gamedata = require ("game_data")
local nodeLoader = require("node_loader")

-- Enable warnings
warn("@on")

-- Create Gamedata
local gameData = Gamedata:new() ---@type GameData
_G.game = gameData

--Load nodes
nodeLoader.loadNodes()
for id, node in pairs(nodeLoader.getNodes()) do
    print(id ..": " .. node.title)
end

--[[

    Pseudo Código


    -- Motor do Simulador (enginer)
    mainloop
        Caso a gente tenho um node ativo (propriedade do Gamedata)
        print do node
        mostras escolhas
        perguntar qual escolha o usuario quer tomar
        avançar pro proximo node
        condição de vitoria e derrota
    end


]]