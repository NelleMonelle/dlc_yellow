---@class StarloBGTumble : Object
---@overload fun(x?: number, y?:number)
local StarloBGTumble, super = Class(Sprite)

function StarloBGTumble:init(sprite,x,y)
    super.init(self,sprite,x,y)
	self:setScale(1,1)
	self:setOrigin(0.5,0.5)
	self.sin_timer = 0.03
	self.xspeed = 2
	self.rotation_speed = 1
	self.rotation = math.rad(180)
	self.alpha = 0.8
end

function StarloBGTumble:update()
    super.update(self)
	self.rotation = self.rotation - math.rad((57.2957836029062 * self.rotation_speed) / 30 / self.sin_timer)*DTMULT
	self.y = self.y - math.sin(Kristal.getTime() / self.sin_timer)*DTMULT
	self.scale_y = ((1 + math.abs(math.sin(Kristal.getTime() / 2 / self.sin_timer))) * 0.3) + 0.4
	self.x = self.x - (((DTMULT + math.abs(math.sin(Kristal.getTime() / 2 / self.sin_timer))) * 0.5) + (self.xspeed*DTMULT))
	if self.x < -30 then
		self:remove()
	end
end

return StarloBGTumble