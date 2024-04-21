local DrawSystem = Concord.system({
    pool = { 'position', 'sprite' }
})

function DrawSystem:draw()
    for _, e in ipairs(self.pool) do
        love.graphics.draw(e.sprite.image, e.position.x, e.position.y, e.sprite.rotation, e.sprite.scaleX,
            e.sprite.scaleY)
    end
end

return DrawSystem
