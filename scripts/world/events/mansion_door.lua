local MansionDoor, super = Class(Event)

function MansionDoor:init(data)
    super.init(self, data)

    properties = data.properties or {}

    self.target = {
        map = properties.map,
        x = properties.x,
        y = properties.y,
        marker = properties.marker,
        facing = properties.facing,
    }

    self:setSprite("world/events/dunes/mansion_door_1")
    self:setOrigin(0, 0)

    self.solid = true

    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
end

function MansionDoor:onInteract(chara, dir)
    Game.world:startCutscene(function(cutscene)
        Assets.playSound("mansion_slidedoor_open")
        self.sprite:setSprite("world/events/dunes/mansion_door")
        self.sprite:play(1/30, false)
        cutscene:wait(2)
        cutscene:mapTransition(self.target.map, self.target.marker)
    end)
    return true
end

return MansionDoor