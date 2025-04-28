local MansionGate, super = Class(Event)

function MansionGate:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    if Game:getFlag("mansion_gate_open") then
        self:setSprite("world/events/dunes/mansion_gate_2")
    else
        self.solid = true
        self:setSprite("world/events/dunes/mansion_gate_1")
    end

    Game.world.timer:after(1/30, function ()
        self.layer = 0.5
    end)
end

function MansionGate:onInteract(player, dir)
    if not Game:getFlag("mansion_gate_open") then
        Game.world:startCutscene(function(cutscene)
            cutscene:text("* (A large,[wait:5] ornate gate.)")
            cutscene:text("* (Unfortunately,[wait:5] it's locked.)")
        end)
    end
    return true
end

return MansionGate