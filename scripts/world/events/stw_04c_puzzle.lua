local Steamworks04CPuzzle, super = Class(Event)

function Steamworks04CPuzzle:init(data)
	super.init(self, data)
	self.liquid_tex = Assets.getFrames("world/maps/steamworks/small_objects/04b_liquid")
	self.liquid_image_index = 0
	self.needle_tex = Assets.getTexture("world/maps/steamworks/small_objects/04c_puzzle_needle")
end

function Steamworks04CPuzzle:update()
	super.update(self)
	self.liquid_image_index = self.liquid_image_index + 0.25 * DTMULT
	if self.liquid_image_index >= 3 then
		self.liquid_image_index = 0.25 * DTMULT
	end
end

function Steamworks04CPuzzle:draw()
	super.draw(self)
	local lava_color = {1, 136/255, 204/255}
	Draw.setColor(lava_color)
	local base_height = 20
	local max_height = 80
	local max_height_2 = 70
	local xx = 168
	local yy = 158
	local ydistance1 = -base_height - (max_height * 0)
    love.graphics.rectangle("fill", xx, yy, 25, ydistance1 + 1)
	Draw.setColor(1,1,1,1)
	Draw.draw(self.liquid_tex[math.floor(MathUtils.wrap(self.liquid_image_index, 0, 3)) + 1], xx, yy + ydistance1, 0, 2, 2, 0, 4)
	Draw.setColor(lava_color)
	local xx2 = 230
	local yy2 = 286
	local ydistance2 = -base_height - (max_height * 0.72)
    love.graphics.rectangle("fill", xx2, yy2, 25, ydistance2 + 1)
	Draw.setColor(1,1,1,1)
	Draw.draw(self.liquid_tex[math.floor(MathUtils.wrap(self.liquid_image_index, 0, 3)) + 1], xx2, yy2 + ydistance2, 0, 2, 2, 0, 4)
	Draw.setColor(lava_color)
	local xx3 = 292
	local yy3 = 158
	local ydistance3 = -base_height - (max_height * 0.42)
    love.graphics.rectangle("fill", xx3, yy3, 25, ydistance3 + 1)
	Draw.setColor(1,1,1,1)
	Draw.draw(self.liquid_tex[math.floor(MathUtils.wrap(self.liquid_image_index, 0, 3)) + 1], xx3, yy3 + ydistance3, 0, 2, 2, 0, 4) 
	Draw.setColor(lava_color)
	local xx4 = 22
	local yy4 = 172
	local ydistance4 = -base_height - (max_height_2 * 0.95)
    love.graphics.rectangle("fill", xx4, yy4, 97, ydistance4 + 1)
	local xx_needle = 72
	local yy_needle = 128
	Draw.setColor(1,1,1,1)
	Draw.draw(self.needle_tex, xx_needle, yy_needle, -math.rad(180 * -0.95), 2, 2, 11, 2) 
end

return Steamworks04CPuzzle