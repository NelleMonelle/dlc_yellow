local Ceroba, super = Class(LightEncounter)

function Ceroba:init()
    super.init(self)

    self.text = "* The atmosphere chills with\nire."

    self.music = "trial_by_fury"

    self.ceroba = self:addEnemy("ceroba_geno", 305, 236)

    self.background = true

    self.offset = 0

    self.can_flee = false

    self.intro_cutscene_done = false

	self.is_ceroba = true
	self.arena_damage = false
end

function Ceroba:getNextWaves()
    local waves = {}
	if Game.battle:getEnemyBattler("ceroba_geno").phase == 2 then
		table.insert(waves, "ceroba/arena_damage")
	end
    for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
        local wave = enemy:selectWave()
        if wave then
            table.insert(waves, wave)
        end
    end
    return waves
end

function Ceroba:onBattleInit()
	MagicalGlassLib.serious_mode = true
end

function Ceroba:onBattleStart()
    self.arena_start_color = Game.battle.arena.color
    Game.battle:setState("ENEMYDIALOGUE")
end

function Ceroba:onTurnEnd()
    if not self.intro_cutscene_done then
        Game.battle:startCutscene("ceroba_geno", "intro", self.ceroba, self)
        return true
    end
end

function Ceroba:getInitialEncounterText()
    return TableUtils.pick(self.ceroba.text)
end

function Ceroba:getDialogueCutscene()
    if self.ceroba.health > 0 and self.ceroba.health <= (self.ceroba.max_health * 0.5) and self.ceroba.phase == 1 then
        return "ceroba_geno", "phase_switch", self.ceroba
    end
end

function Ceroba:update()
    super.update(self)
	if Game.battle.arena and self.arena_damage == true then
		local ceroba_part = Game.battle.enemies[1].actor:getLightBattlerPart("body")
		local cur_ceroba_col = 200 - (((ceroba_part.stretch - 1) / 0.1) * 200)
		local ceroba_color = {1, cur_ceroba_col/255, cur_ceroba_col/255, 1}
		Game.battle.arena.color = ceroba_color
	end
end

function Ceroba:createBackground()
    local background = CerobaBattleBackground()
    return Game.battle:addChild(background)
end

function Ceroba:getVictoryMoney(money)
	return 0
end

return Ceroba