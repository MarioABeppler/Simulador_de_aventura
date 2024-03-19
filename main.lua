--Dependencies
local Gamedata = require ("game_data")

-- Create Gamedata
local gameData = Gamedata:new() ---@type GameData
_G.game = gameData

--[[

    Pseudo Código

    --Criate / Load Nodes
    createNode()
    loadNode() -- Lista com todods os nodes do simulador
    getinitialNOde() -- Node (um item só)

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