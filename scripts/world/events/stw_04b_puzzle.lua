local Steamworks04BPuzzle, super = Class(Event)

function Steamworks04BPuzzle:init(data)
	super.init(self, data)
	self.liquid_tex = Assets.getFrames("world/maps/steamworks/small_objects/04b_liquid")
	self.liquid_image_index = 0
end

function Steamworks04BPuzzle:update()
	super.update(self)
	self.liquid_image_index = self.liquid_image_index + 0.25 * DTMULT
	if self.liquid_image_index >= 3 then
		self.liquid_image_index = 0.25 * DTMULT
	end
end

function Steamworks04BPuzzle:draw()
	super.draw(self)
	local lava_color = {1, 136/255, 204/255}
	Draw.setColor(lava_color)
	local xx = 12
	local yy = 124
	local base_height = 20
	local ydistance1 = -base_height - (80 * 0.25)
    love.graphics.rectangle("fill", xx, yy, 25, ydistance1 + 1)
	Draw.setColor(1,1,1,1)
	Draw.draw(self.liquid_tex[math.floor(MathUtils.wrap(self.liquid_image_index, 0, 3)) + 1], xx, yy + ydistance1, 0, 2, 2, 0, 4)
	Draw.setColor(lava_color)
	local xx2 = 148
	local yy2 = 240
	local ydistance2 = -base_height - (80 * 0.1)
    love.graphics.rectangle("fill", xx2, yy2, 25, ydistance2 + 1)
	Draw.setColor(1,1,1,1)
	Draw.draw(self.liquid_tex[math.floor(MathUtils.wrap(self.liquid_image_index, 0, 3)) + 1], xx2, yy2 + ydistance2, 0, 2, 2, 0, 4)
	Draw.setColor(lava_color)
	local xx3 = 284
	local yy3 = 124
	local ydistance3 = -base_height - (80 * 0.65)
    love.graphics.rectangle("fill", xx3, yy3, 25, ydistance3 + 1)
	Draw.setColor(1,1,1,1)
	Draw.draw(self.liquid_tex[math.floor(MathUtils.wrap(self.liquid_image_index, 0, 3)) + 1], xx3, yy3 + ydistance3, 0, 2, 2, 0, 4) 
end

return Steamworks04BPuzzle