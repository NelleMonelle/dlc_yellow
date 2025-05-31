---@class LightMaskFX : FXBase
---@overload fun(...) : LightMaskFX
local LightMaskFX, super = Class(FXBase)

function LightMaskFX:init(amount, priority)
    super.init(self, priority or 0)

    self.amount = amount or 1
end

function LightMaskFX:isActive()
    return super.isActive(self) and self.amount > 0
end

function LightMaskFX:draw(texture)
    Draw.drawCanvas(texture)
	love.graphics.setBlendMode("add")
	Draw.setColor(1,1,1,self.amount)
    Draw.draw(texture)
	love.graphics.setBlendMode("alpha")
	Draw.setColor(1,1,1,1)
end

return LightMaskFX