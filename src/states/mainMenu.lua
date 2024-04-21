local Gamestate = require 'libs.hump.gamestate'
local game = require 'states.game'

local mainMenu = {}

local function startGame()
    Gamestate.switch(game)
end

local function quit()
    love.event.quit()
end

local function createButton(text, x, y, callback)
    local font = love.graphics.newFont(32)
    local width = font:getWidth(text)
    local height = font:getHeight()
    local button = {
        text = text,
        x = x,
        y = y,
        width = width,
        height = height,
        font = font,
        callback = callback
    }
    return button
end

function mainMenu:enter()
    self.elements = {
        createButton("Start", 400, 300, startGame),
        createButton("Options", 400, 400, function() print('Options not implemented') end),
        createButton("Quit", 400, 500, quit)
    }
end

function mainMenu:update()
    local mouseX, mouseY = love.mouse.getPosition()
    for i, element in ipairs(self.elements) do
        if mouseX >= element.x and mouseX <= element.x + element.width and
            mouseY >= element.y and mouseY <= element.y + element.height then
            self.selectedIndex = i

            if love.mouse.isDown(1) then
                element.callback()
            end
        end
    end
end

local function drawElement(element)
    love.graphics.rectangle("line", element.x, element.y, element.width, element.height)
    love.graphics.setFont(element.font)
    love.graphics.print(element.text, element.x + element.width / 2 - element.font:getWidth(element.text) / 2, element.y)
end

function mainMenu:draw()
    for _, element in ipairs(self.elements) do
        drawElement(element)
    end
end

return mainMenu
