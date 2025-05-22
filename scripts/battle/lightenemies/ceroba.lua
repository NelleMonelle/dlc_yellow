local Ceroba, super = Class(LightEnemyBattler)

function Ceroba:init()
    super:init(self)

    self.name = "Ceroba"
    self:setActor("cerobadate")

    self.max_health = 1000
    self.health = 1000
    self.attack = 0
    self.defense = 0
    self.money = 0
    self.experience = 800
    self.spare_percentage = 0

    self.dialogue_bubble = "uty_3"
    self.dialogue_offset = {20, -20}

    self.waves = nil

    self.check = "* First time on a hangout."

    self.text = {
        "* Ceroba smiles nervously.",
        "* Ceroba awkwardly looks left and right.",
        "* Ceroba.",
        "* Ceroba.",
    }

    self.large_dust = true

    self.gauge_size = {250, 18}

    self.damage_offset = {0, 30}
end

function Ceroba:onAct(battler, name)
    if name == "Check" then
        return "* CEROBA"..self.check
    elseif name == "Standard" then
        return "* ..."
    end

    return super:onAct(self, battler, name)
end

return Ceroba