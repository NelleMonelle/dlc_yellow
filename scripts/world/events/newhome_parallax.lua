local NewHomeParallax, super = Class(Event)

function NewHomeParallax:init(data)
	super.init(self, data.x, data.y, data.width, data.height)
    --self:setSprite("world/maps/newhome/parallax_2")
    self:setOrigin(0.5, 1)
	self.parallax_bg = Assets.getFrames("world/maps/newhome/parallax")
	self.px = {self.x, self.x, self.x}
	self.py = {self.y, self.y, self.y}
	self.parallax_xmult = {0.05, 0.07142857142857142, 0.1}
	self.parallax_ymult = {0.2, 0.1, 0.0}
	self.parallax_xoff = {8, 12, 16}
	self.parallax_yoff = {-14, 24, 0}
end

function NewHomeParallax:update()
	super.update(self)
	local cx, cy = Game.world.camera:getPosition()
	local dist_cam_x = self.x - (cx + 160)
	local dist_cam_y = self.y - (cy + 120)
	for i = 1, 3 do
		self.px[i] = (dist_cam_x * self.parallax_xmult[i]) + self.parallax_xoff[i]
	end
	self.py[1] = (dist_cam_y * self.parallax_ymult[1]) + self.parallax_yoff[1]
	self.py[2] = (self.parallax_ymult[2] * 120) + (dist_cam_y * self.parallax_ymult[2]) + self.parallax_yoff[2]
	self.py[3] = (self.parallax_ymult[3] * 60) + (dist_cam_y * self.parallax_ymult[3]) + self.parallax_yoff[3]
end

function NewHomeParallax:draw()
	super.draw(self)
	for i = 1, 3 do
		local layer_width = self.parallax_bg[4-i]:getWidth()
		local layer_height = self.parallax_bg[4-i]:getHeight()
		for j = -3*(layer_width*2),5*(layer_width*2),(layer_width*2) do
			Draw.draw(self.parallax_bg[4-i], self.px[i]+j-layer_width, self.py[i]-layer_height*2, 0, 2, 2)
		end
	end
end

return NewHomeParallax