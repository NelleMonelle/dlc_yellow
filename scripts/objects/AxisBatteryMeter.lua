local AxisBatteryMeter, super = Class(Object)

function AxisBatteryMeter:init()
  super.init(self)
  self.sprite = Sprite("battle/lightenemies/axis/battery_meter")
  self.sprite.layer = LIGHT_BATTLE_LAYERS["above_battlers"]
  self:addChild(self.sprite)
  self.charge = 8
end

function AxisBatteryMeter:drainCharge()
  -- god help me I don't know how to do it
end

function AxisBatteryMeter:update()
  super.update(self)
end

function AxisBatteryMeter:draw()
  Draw.setColor(0, 1, 0)
  love.graphics.rectangle("fill", self.sprite.x + 4, self.sprite.y + 4, 48, 30)
  super.draw(self)
end

return AxisBatteryMeter