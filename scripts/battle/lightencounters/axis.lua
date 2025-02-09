---@class LightEncounter.Axis : LightEncounter
local Axis, super = Class(LightEncounter)

function Axis:init()
    super:init(self)

    self.text = "* Axis Model 014,[wait:5] ready to\nattack!"

    self.music = "guns_blazing"

    self:addEnemy("axis")

    self.can_flee = false
end

function Axis:setBattleState()
    Game.battle:setState("ENEMYDIALOGUE")
    Game.battle:startCutscene("axis", "floweysave")
end

function Axis:drawBackground() end -- leave it empty to NOT draw the rectangle background

function Axis:onBattleInit()
	self.bg = Game.battle:addChild(AxisBattleBackground())
	self.bg:setLayer(LIGHT_BATTLE_LAYERS["below_battlers"])
end

function Axis:getVictoryMoney(money)
	return 0
end

return Axis