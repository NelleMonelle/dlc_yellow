---@class AxisScanFX : FXBase
---@overload fun(...) : AxisScanFX
local AxisScanFX, super = Class(FXBase)

function AxisScanFX:init(color, height)
    super.init(self, priority)

    self.color = color or {1, 1, 1}
    self.amount = amount or 1
	self.progress = 0
	self.progress_max = height
	self.scanline_active = {}
	self.scanline_alpha = {}
	for i = 1, self.progress_max do
		self.scanline_active[i] = 0
		self.scanline_alpha[i] = 0
	end
end

function AxisScanFX:getColor()
    return self.color[1], self.color[2], self.color[3], self.color[4] or 1
end

function AxisScanFX:getAlpha()
    return self.alpha
end

function AxisScanFX:addScanProgress()
    self.progress = self.progress + 1
	if self.progress < self.progress_max then
		if self.scanline_active[self.progress+1] == 0 then
			self.scanline_active[self.progress+1] = 1
		end
	end
end

function AxisScanFX:update()
	super.update(self)
	for i = 1, self.progress_max do
		if self.scanline_active[i] == 1 then
			if self.scanline_alpha[i] < 1 then
				self.scanline_alpha[i] = self.scanline_alpha[i] + 0.2
			else
				self.scanline_active[i] = 2
			end
		end
		if self.scanline_active[i] == 2 then
			if self.scanline_alpha[i] > 0 then
				self.scanline_alpha[i] = self.scanline_alpha[i] - 0.2
			else
				self.scanline_alpha[i] = 0
				self.scanline_active[i] = 0
			end
		end
	end
end

function AxisScanFX:isActive()
    return super.isActive(self) and (self.progress < self.progress_max or self.scanline_alpha[self.progress_max] > 0)
end

function AxisScanFX:draw(texture)
    local last_shader = love.graphics.getShader()
	Draw.drawCanvas(texture)
	local shader = Kristal.Shaders["AddColor"]
	love.graphics.setShader(shader)
	shader:send("inputcolor", {self:getColor()})
	shader:send("amount", 1)
	local ox, oy, ow, oh = self:getObjectBounds()
	for i = 1, self.progress_max do
		Draw.setColor(1, 1, 1, self.scanline_alpha[i])
		Draw.drawPart(texture, ox, oy+(i-1)*2, ox, oy+(i-1)*2, ow, 2)
	end
    love.graphics.setShader(last_shader)
end

return AxisScanFX