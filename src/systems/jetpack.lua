local JetpackSystem = Concord.system({
    pool = { 'velocity', 'control' }
})

function JetpackSystem:update(dt)
    for _, e in ipairs(self.pool) do
        if e.control.isThrusting then
            e.velocity.vy = e.velocity.vy - 200 * dt
        end
    end
end

return JetpackSystem
