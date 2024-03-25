--Dependencies
local Gamedata = require ("game_data")
local Engine = require("engine")
local nodeLoader = require("node_loader")
local utils = require("utils")

-- Enable warnings
warn("@on")

-- Enable UTF-8
utils.enableUtf8()

-- Create Gamedata
local gameData = Gamedata:new() ---@type GameData
_G.game = gameData

--Load nodes
nodeLoader.loadNodes()
game.activeNode = nodeLoader.getinitialNOde()

-- Check for erros in NodeLoader
if nodeLoader.hasErrors() then
    print("Encontrado errors no NodeLoader, Abortando execução!")
    os.exit()
end
-- Strat Engine
local engine = Engine:new() ---type Engine
engine:runMainLoop()
