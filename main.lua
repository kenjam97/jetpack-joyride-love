local Gamestate = require 'libs.hump.gamestate'

require 'libs.batteries':export()

love.window.setMode(800, 600)
love.graphics.setDefaultFilter('nearest', 'nearest')

love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";src/?.lua")

Class = require 'libs.hump.class'
Concord = require 'libs.Concord.concord'

local assemblageUtil = require 'utils.assemblage'

ECS = {
  c = Concord.components,
  a = assemblageUtil.createAssemblageHierarchy("src/assemblages"),
  s = {}
}

Concord.utils.loadNamespace("src/components")
Concord.utils.loadNamespace("src/systems", ECS.s)

local mainMenu = require 'states.mainMenu'

Gamestate.registerEvents()
Gamestate.switch(mainMenu)
