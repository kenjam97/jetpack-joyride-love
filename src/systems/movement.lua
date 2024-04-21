local MovementSystem = Concord.system({
    pool = { 'position', 'velocity' }
})

function MovementSystem:update(dt)
    for _, e in ipairs(self.pool) do
        e.position.x = e.position.x + e.velocity.vx * dt
        e.position.y = e.position.y + e.velocity.vy * dt
    end
end

return MovementSystem
