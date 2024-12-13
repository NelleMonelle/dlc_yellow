local MantaArrows, super = Class(Object)

function MantaArrows:init(x, y)
    super.init(self, x, y)
	self.arrow_frame = 0
	self.arrow_frames = Assets.getFrames("world/npcs/steamworks/manta/arrow")
	self.arrow_dock_frames = Assets.getFrames("world/npcs/steamworks/manta/arrow_dock")
	self.arrow_scales = {1,1,1,1}
	self.arrow_colors = {}
	self.arrow_colors[1] = {1,1,1}
	self.arrow_colors[2] = {1,1,1}
	self.arrow_colors[3] = {1,1,1}
	self.arrow_colors[4] = {1,1,1}
	self.arrow_alpha = 0
	self.up_free = false
	self.down_free = false
	self.left_free = false
	self.right_free = false
	self.can_dock = nil
	self.display_arrows = false
	self.can_move = false
end

function MantaArrows:setProperties(up, down, left, right, dock_dir)
	self.up_free = up or false
	self.down_free = down or false
	self.left_free = left or false
	self.right_free = right or false
	self.can_dock = dock_dir or nil
end

function MantaArrows:onAdd(parent)
    super.onAdd(self,parent)
    self:setParallax(1,1)
    self:setLayer(WORLD_LAYERS["ui"])
end

function MantaArrows:update()
	super.update(self)
	if self.display_arrows then
		if self.arrow_alpha < 1 then
			self.arrow_alpha = self.arrow_alpha + 0.25*DTMULT
			if self.arrow_alpha > 0.35 then
				self.can_move = true
			end
		end
	else
		self.can_move = false
		if self.arrow_alpha > 0 then
			self.arrow_alpha = self.arrow_alpha - 0.3*DTMULT
		end
	end
	for i = 1, 4 do
		if self.arrow_scales[i] > 1 then
			self.arrow_scales[i] = self.arrow_scales[i] - 0.05*DTMULT
		end
		local colormult = (self.arrow_scales[i]-1)/0.5
		self.arrow_colors[i] = {1,1,1-colormult}
	end
	self.arrow_frame = self.arrow_frame + 0.25*DTMULT
	if self.arrow_frame >= 5 then
		self.arrow_frame = 0
	end
end

function MantaArrows:canMove()
   return self.can_move
end

function MantaArrows:displayArrows(display)
    self.display_arrows = display
end

function MantaArrows:selectArrow(arrow)
    self.arrow_scales[arrow] = 1.5
end

function MantaArrows:draw()
	super.draw(self)
	local x, y = 0, 0
	Draw.setColor(self.arrow_colors[1], self.arrow_alpha)
	if self.can_dock == "up" then
		Draw.draw(self.arrow_dock_frames[math.floor(self.arrow_frame+1)], x, y-56, math.rad(270), self.arrow_scales[1]*2, self.arrow_scales[1]*2, 10, 9)
	elseif self.up_free then
		Draw.draw(self.arrow_frames[math.floor(self.arrow_frame+1)], x, y-56, math.rad(270), self.arrow_scales[1]*2, self.arrow_scales[1]*2, 10, 9)
	end
	Draw.setColor(self.arrow_colors[2], self.arrow_alpha)
	if self.can_dock == "down" then
		Draw.draw(self.arrow_dock_frames[math.floor(self.arrow_frame+1)], x, y+56, math.rad(90), self.arrow_scales[2]*2, self.arrow_scales[2]*2, 10, 9)
	elseif self.down_free then
		Draw.draw(self.arrow_frames[math.floor(self.arrow_frame+1)], x, y+56, math.rad(90), self.arrow_scales[2]*2, self.arrow_scales[2]*2, 10, 9)
	end
	Draw.setColor(self.arrow_colors[3], self.arrow_alpha)
	if self.can_dock == "left" then
		Draw.draw(self.arrow_dock_frames[math.floor(self.arrow_frame+1)], x-56, y, math.rad(180), self.arrow_scales[3]*2, self.arrow_scales[3]*2, 10, 9)
	elseif self.left_free then
		Draw.draw(self.arrow_frames[math.floor(self.arrow_frame+1)], x-56, y, math.rad(180), self.arrow_scales[3]*2, self.arrow_scales[3]*2, 10, 9)
	end
	Draw.setColor(self.arrow_colors[4], self.arrow_alpha)
	if self.can_dock == "right" then
		Draw.draw(self.arrow_dock_frames[math.floor(self.arrow_frame+1)], x+56, y, 0, self.arrow_scales[4]*2, self.arrow_scales[4]*2, 10, 9)
	elseif self.right_free then
		Draw.draw(self.arrow_frames[math.floor(self.arrow_frame+1)], x+56, y, 0, self.arrow_scales[4]*2, self.arrow_scales[4]*2, 10, 9)
	end
end

return MantaArrows