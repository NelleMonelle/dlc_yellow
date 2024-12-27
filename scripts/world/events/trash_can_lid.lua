local TrashCanLid, super = Class(Event)

function TrashCanLid:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/cutscenes/lid")
    self.solid = true

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

function TrashCanLid:onInteract(chara, dir)
    Game.world:startCutscene(function(cutscene)
        Assets.playSound("success")
        cutscene:text("* You got the trash can lid!")
        self:remove()
        Game.inventory:addItem("trash_can_lid")
        Game:setFlag("got_lid", true)
    end)
    return true
end

return TrashCanLid