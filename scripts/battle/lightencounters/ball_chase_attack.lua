local BallChaseAttack, super = Class(LightEncounter)

function BallChaseAttack:init()
    super:init(self)

    self.text = "* "

    self.music = nil

    self:addEnemy("placeholder_enemy", 320, -300)

    self.story = true

    self.fast_transition = true

    self.background_color = {238/255, 71/255, 122/255}

    self.can_flee = false

end

function BallChaseAttack:setBattleState()
    Game.battle:setState("ENEMYDIALOGUE")
end

function BallChaseAttack:beforeStateChange(old, new)
    if old == "DEFENDING" and new ~= "DEFENDING" then
        Game.battle:setState("TRANSITIONOUT")
    end
end

function BallChaseAttack:getNextWaves()
    local waves = {}
    for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
        local wave = enemy:selectWave()
        if wave then
            table.insert(waves, wave)
        end
    end
    return waves
end

return BallChaseAttack