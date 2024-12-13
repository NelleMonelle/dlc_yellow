---@class PaletteFX : FXBase

-- This might quite be possibly the worst thing ever.
-- Can't use ShaderFX due to a bug so HERE WE GOOOOOOO
local PaletteFX, super = Class(FXBase)

function PaletteFX:init(shader, base_pal, live_pal, transformed, priority)
    super.init(self, priority or 0)

    if type(shader) == "string" then
        shader = Assets.newShader(shader)
    end

    self.shader = shader
	
	self.base_pal = base_pal
	
	self.live_pal = live_pal

    self.transformed = transformed or false

    self.vars = vars or {}
end

function PaletteFX:draw(texture)
    local last_shader = love.graphics.getShader()
    love.graphics.setShader(self.shader)
	self.shader:send("base_palette", unpack(self.base_pal))
	self.shader:send("live_palette", unpack(self.live_pal))
    Draw.drawCanvas(texture)
    love.graphics.setShader(last_shader)
end

return PaletteFX