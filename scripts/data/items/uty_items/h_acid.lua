local item, super = Class(HealItem, "uty_items/h_acid")

function item:init(inventory)
    super.init(self)

    -- How this item is used on you (ate, drank, eat, etc.)
    self.use_method = "drink"
    -- Display name
    self.name = "H. Acid"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    self.heal_amount = 0

    -- Default shop sell price
    self.sell_price = 0
    -- Whether the item can be sold
    self.can_sell = false

    -- Item description text (unused by light items outside of debug menu)
    self.description = "(An extremely dangerous compound. Handle with caution.)"

    -- Light world check text
    self.check = "* (An extremely dangerous\ncompound.[wait:5] Handle with caution.)"

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false
    
end

function item:onCheck()
    Game.world:showText(self:getCheck())
end

function item:onWorldUse(target)
    Game.world:startCutscene(function(cutscene)
        local opinion = cutscene:textChoicer("* (Are you sure you want to\ndrink the acid?)", {"Yes", "    No"})
        if opinion == 1 then
            Assets.playSound("hurt")
            Game:gameOver(320, 240)
            return true
        else
            return false
        end
    end)
end

function item:onLightBattleUse(target)
    Assets.playSound("hurt")
    Game:gameOver(320, 240)
    return true
end

return item