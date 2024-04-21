local GravitySystem = Concord.system({
    pool = { 'velocity', 'gravity' }
})

function GravitySystem:update(dt)
    for _, e in ipairs(self.pool) do
        e.velocity.vy = e.velocity.vy + e.gravity.strength * dt
    end
end

return GravitySystem
