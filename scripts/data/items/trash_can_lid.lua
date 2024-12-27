local item, super = Class(Item, "trash_can_lid")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Trash Can Lid"

    -- Item type (item, key, weapon, armor)
    self.type = "key"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "A lid from some trash can."

    -- Light world check text
    self.check = "* (A lid from some trash can.[wait:5] Could be used as a shield...?)"

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
end

function item:onCheck()
    Game.world:showText(self:getCheck())
end

function item:onWorldUse()
    Game.world:showText("* You couldn't think of a use for this.")
    return false
end

function item:onToss()
    Game.world:showText("* You felt like you should keep it.")
    return false
end

return item