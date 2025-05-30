local Room1, super = Class(Map)

function Room1:load()
    super.load(self)
end

function Room1:onEnter()
    super.onEnter(self)
	
    local mountain_layer1 = Sprite("world/maps/dunes/mansion/mountain_bg2_layer1", 0, -146)
    local mountain_layer2 = Sprite("world/maps/dunes/mansion/mountain_bg2_layer2", 0, 240-146)
    local mountain_layer3 = Sprite("world/maps/dunes/mansion/mountain_bg2_layer3", 0, 236-146)
    local mountain_layer4 = Sprite("world/maps/dunes/mansion/mountain_bg2_layer4", 0, 228-146)
    local mountain_layer5 = Sprite("world/maps/dunes/mansion/mountain_bg_layer7", 0, 136-146)

    mountain_layer1:setScale(2,2)
    mountain_layer1:setParallax(0,1/2.4)
    mountain_layer1.wrap_texture_x = true
    Game.world:addChild(mountain_layer1)
    mountain_layer1:setLayer(Game.world:parseLayer("objects_bg2"))
    mountain_layer2:setScale(2,2)
    mountain_layer2:setParallax(1/2.1,1/2.4)
    mountain_layer2.wrap_texture_x = true
    Game.world:addChild(mountain_layer2)
    mountain_layer2:setLayer(Game.world:parseLayer("objects_bg2")+0.01)
    mountain_layer3:setScale(2,2)
    mountain_layer3:setParallax(1/2.14,1/2.4)
    mountain_layer3.wrap_texture_x = true
    Game.world:addChild(mountain_layer3)
    mountain_layer3:setLayer(Game.world:parseLayer("objects_bg2")+0.02)
    mountain_layer4:setScale(2,2)
    mountain_layer4:setParallax(1/2.2,1/2.4)
    mountain_layer4.wrap_texture_x = true
    Game.world:addChild(mountain_layer4)
    mountain_layer4:setLayer(Game.world:parseLayer("objects_bg2")+0.03)
    mountain_layer5:setScale(2,2)
	mountain_layer5:play(1/10)
    mountain_layer5:setParallax(1/2.2,1/2.4)
    mountain_layer5.wrap_texture_x = true
    Game.world:addChild(mountain_layer5)
    mountain_layer5:setLayer(Game.world:parseLayer("objects_bg2")+0.04)
end

function Room1:onExit()
    super.onExit(self)
end

return Room1