local Ceroba, super = Class(LightEncounter)

function Ceroba:init()
    super:init(self)

    self.text = "* The atmosphere chills with\nire."

    self.music = "trial_by_fury"

    self:addEnemy("ceroba_geno")

    self.background = true

    self.offset = 0

    self.can_flee = false

    self.intro_finished = false

end

function Ceroba:setBattleState()
    local ceroba = Game.battle:getEnemyBattler("ceroba_geno")
    ceroba:toggleOverlay(true)
    ceroba:getActiveSprite():setSprite("animations/intro_1")
    Game.battle.music:play(self.music)
    Game.battle:setState("ENEMYDIALOGUE")
end

function Ceroba:drawBackground()
    for i = 1, 1 do
        Draw.setColor(73/255, 24/255, 31/255)
        love.graphics.rectangle("fill", 0, 230, 640, 106)
    end
    for i = 1, 1 do
        Draw.setColor(157/255, 23/255, 50/255)
        love.graphics.rectangle("fill", 0, 242, 640, 88)
    end
    for i = 1, 1 do
        Draw.setColor(216/255, 31/255, 68/255)
        love.graphics.rectangle("fill", 0, 268, 640, 56)
    end
    for i = 1, 1 do
        Draw.setColor(228/255, 69/255, 101/255)
        love.graphics.rectangle("fill", 0, 310, 640, 14)
    end
end

function Ceroba:beforeStateChange(old, new)
    local ceroba = Game.battle:getEnemyBattler("ceroba_geno")
    if ceroba then
        if old == "DEFENDINGEND" and new ~= "DEFENDINGEND" and not self.intro_finished then
            self.intro_finished = true
            Game.battle:setState("NONE")
            Game.battle:startCutscene("ceroba_geno", "intro")
        end
        if old == "ENEMYDIALOGUE" and new ~= "ENEMYDIALOGUE" and ceroba.health <= 500 and ceroba.phase == 1 then
            ceroba.phase = 2
            Game.battle:setState("NONE")
            Game.battle:startCutscene("ceroba_geno", "phase_switch")
        end
    end
end

return Ceroba