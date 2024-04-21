local InputSystem = Concord.system({
    pool = { 'control' }
})

function InputSystem:keypressed(key)
    if key == 'space' or love.mouse.isDown(1) then
        for _, e in ipairs(self.pool) do
            e.control.isThrusting = true
        end
    end

    if key == 'escape' then
        love.event.quit()
    end
end

function InputSystem:keyreleased(key)
    if key == 'space' then
        for _, e in ipairs(self.pool) do
            e.control.isThrusting = false
        end
    end
end

return InputSystem
