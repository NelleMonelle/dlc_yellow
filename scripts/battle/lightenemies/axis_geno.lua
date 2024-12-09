local Axis, super = Class(LightEnemyBattler)

function Axis:init()
    super:init(self)

    self.name = "Axis"
    self:setActor("axisboss_g")

    self.max_health = 800
    self.health = 800
    self.attack = 19
    self.defense = 15
    self.money = 0
    self.experience = 200
    self.spare_percentage = 0

    self.progress = 0

    self.display_damage_on_miss = true

    self.dialogue_bubble = "ut_wide"
    self.dialogue_offset = {-30, 10}

    self.waves = {
        "axis/axis_g_first"
    }

    --[[self.dialogue = {
        "[wave:3][speed:0.5]....."
    }]]

    self.check = "ATK 19 DEF 15"

    self.text = {
        "* Can't hold out forever.",
        "* In your way.",
        "* Outlast his efforts.",
        "* One is all it will take. Keep\ngoing.",
        "* Finish what you started.",
        "* They are responsible.",
        "* A road ahead.",
        "* . . ."
    }

    self.spareable_text = "* Axis has cooled off."

    self:registerAct("Push")
    self:registerAct("Taunt")
    self:registerAct("Toughen")

    self.gauge_size = {250, 18}

    self.damage_offset = {0, 42}
end

function Axis:onTurnStart()
    if self.progress == 1 then
        Game.battle:setState("ENEMYDIALOGUE")
        Game.battle:startCutscene("axis_geno", "death_laser")
    end
end

function Axis:onTurnEnd()
    self.progress = self.progress + 1
end

function Axis:onDefeat(damage, battler)
    if Game.battle.battle_ui.attacking then
        Game.battle.battle_ui:endAttack()
    end
    Game.battle:setState("NONE")
    Game.battle:startCutscene("axis_geno", "death")
end

function Axis:getAttackDamage(damage, battler, points)
    return 0
end

function Axis:onAct(battler, name)
    if name == "Push" then
        return "* You pressure Axis' defense but\nhe stands firm."
    elseif name == "Taunt" then
        return {
            "* You tell Axis that his time is\nup.",
            "* He chooses not to respond."
        }
    elseif name == "Toughen" then
        return {
            "* You grip your sidearm with\nenmity...",
            "* Something stirs inside."
        }
    elseif name == "Standard" then
        return "* But there was nothing to say."
    end

    return super:onAct(self, battler, name)
end

return Axis