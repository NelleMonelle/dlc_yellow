local BallChaseAttack, super = Class(LightEncounter)

function BallChaseAttack:init()
    super.init(self)

    self.music = nil

    self.event = true
    self.event_waves = {"chase_attack"}

    self.fast_transition = true

    self.background_color = {238/255, 71/255, 122/255}

end

return BallChaseAttack