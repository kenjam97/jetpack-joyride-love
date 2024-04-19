local Gamestate = require 'libs.hump.gamestate'

love.window.setMode(800, 600)
love.graphics.setDefaultFilter('nearest', 'nearest')

love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";src/?.lua")

Class = require 'libs.hump.class'

local mainMenu = require 'states.mainMenu'

Gamestate.registerEvents()
Gamestate.switch(mainMenu)


