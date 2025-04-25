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
    self.battery_meter = Game.battle:addChild(AxisBatteryMeter())
    self.battery_meter.sprite:setPosition(20, -60)
    self.tick_o_bar = Game.battle:addChild(AxisTickOBar())
    self.tick_o_bar.sprite:setPosition(557, -60)
	self.bg = Game.battle:addChild(AxisBattleBackground())
	self.bg:setLayer(LIGHT_BATTLE_LAYERS["below_battlers"])
end

function Axis:onReturnToWorld(events)
	Game:setFlag("axis_done", true)
end

function Axis:beforeStateChange(old, new)
    if old ~= "DEFENDING" and new == "DEFENDING" then
		self.battery_meter:slideTo(self.battery_meter.x, 70, 0.5)
        self.tick_o_bar:slideTo(self.tick_o_bar.x, 70, 0.5)
    elseif old == "DEFENDING" and new ~= "DEFENDING" then
		self.battery_meter:slideTo(self.battery_meter.x, -50, 0.5)
        self.tick_o_bar:slideTo(self.tick_o_bar.x, -50, 0.5)
    end
end

function Axis:getVictoryMoney(money)
	return 0
end

return Axis