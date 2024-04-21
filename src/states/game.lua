local game = {}

function game:enter()
    self.world = Concord.world()
    self.world:addSystems(
        ECS.s.draw,
        ECS.s.movement,
        ECS.s.input,
        ECS.s.jetpack,
        ECS.s.gravity
    )

    local player = Concord.entity(self.world)
    :give("position", 200, 200)
    :give("velocity", 10, 0)
    :give("sprite", love.graphics.newImage("assets/player.png"))
    :give("control", false)
    :give("gravity")


    local test = Concord.entity(self.world)
    :give("position", 100, 50)
    :give("velocity", 20, 0)
    :give("sprite", love.graphics.newImage("assets/test.png"))
    :give("gravity")
end

function game:update(dt)
    self.world:emit("update", dt)
end

function game:draw()
    self.world:emit("draw")
end

function game:keypressed(key, scancode, isrepeat)
    self.world:emit("keypressed", key, scancode, isrepeat)
end

function game:keyreleased(key, scancode)
    self.world:emit("keyreleased", key, scancode)
end

return game
