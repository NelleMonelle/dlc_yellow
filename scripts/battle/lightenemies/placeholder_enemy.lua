local PlaceholderEnemy, super = Class(LightEnemyBattler)

function PlaceholderEnemy:init()
    super:init(self)

    self.name = "Placeholder Enemy"
    self:setActor("axisboss")

    self.max_health = math.huge
    self.health = self.max_health
    self.attack = 10
    self.defense = 0
    self.money = 0
    self.experience = 0
    
    self.dialogue_bubble = "ut_wide"
    self.dialogue_offset = {-30, 10}

    self.waves = {"chase_attack"}

    self.dialogue = {}

    self.check = "ATK 10 DEF 0\n* They're here only for a chase attack."

    self.text = {
        "* "
    }

    --self.gauge_size = {250, 20}

    self.damage_offset = {0, 80}
end

function PlaceholderEnemy:onAct(battler, name)
    if name == "Standard" then
        return "* "
    end

    return super:onAct(self, battler, name)
end

return PlaceholderEnemy