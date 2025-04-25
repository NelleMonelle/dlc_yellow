local TickOBar, super = Class(Object)

function TickOBar:init()
  super.init(self)
  self.sprite = Sprite("battle/lightenemies/axis/tick_o_bar")
  self.sprite.layer = LIGHT_BATTLE_LAYERS["above_battlers"]
  self:addChild(self.sprite)
end

function TickOBar:addCharge()
  -- yeahhh no idea how to do it
end

return TickOBar