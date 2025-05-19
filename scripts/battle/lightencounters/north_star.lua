local Starlo, super = Class(LightEncounter)

function Starlo:init()
    super:init(self)

    self.text = "* The enemy engages the battle."

    self.music = "GHOST_TOWN"

    self:addEnemy("starlo")

    self.background = false

    self.offset = 0

    self.can_flee = false

    self.intro_finished = false

end

function Starlo:setBattleState()
    Game.battle.music:play(self.music)
    Game.battle:setState("ENEMYDIALOGUE")
    Game.battle.soul.can_move = true
    --self:onBattleStart()
    Game.battle:startCutscene("starlo", "intro")
end

function Starlo:drawBackground()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(Assets.getTexture("battle/starlo_bg"), -20, 10)
end

--[[function Starlo:beforeStateChange(old, new)
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
end]]

return Starlo