local TickOBar, super = Class(Sprite)

function TickOBar:init(x, y)
  super.init(self, "battle/lightenemies/axis/tick_o_bar", x, y)
  self:setOriginExact(0, 2)
  self.current = 0
  self.pulse_alpha = 0
  self.full = false
  self.move_up = false
  self.alpha_inc = 0.1
end

function TickOBar:addCharge()
  -- yeahhh no idea how to do it
end

function TickOBar:update()
  super.update(self)

  if self.move_up then
    self.y = MathUtils.lerp(self.y, -80, 0.2*DTMULT)
  else
    self.y = MathUtils.lerp(self.y, 20, 0.2*DTMULT)
  end

  self.current = MathUtils.lerp(self.current, Game.battle.encounter.trash_meter, 0.2*DTMULT)

  if self.current > 99.99 then
    self.current = 100
    if self.full == false then
      Assets.playSound("axis_trash_meter_full")
      self.pulse_alpha = 1
      self.alpha_inc = -0.1
      self.full = true
    end
  else
    self.full = false
  end
  if self.current < 0.01 then
    self.current = 0
  end

  if self.full then
    self.pulse_alpha = self.pulse_alpha + self.alpha_inc * DTMULT
    if self.pulse_alpha >= 1 or self.pulse_alpha <= 0 then
      self.alpha_inc = self.alpha_inc * (-1 ^ DTMULT)
    end
  end
end

function TickOBar:draw()
  local w = 62 * (self.current / 100)
  local h = 32
  Draw.setColor(1, 160/255, 64/255)
  love.graphics.rectangle("fill", 0, 2, w + 1, h + 1)
  Draw.setColor(1, 0, 0, self.pulse_alpha)
  love.graphics.rectangle("fill", 0, 2, w + 1, h + 1)

  super.draw(self)
end

return TickOBar