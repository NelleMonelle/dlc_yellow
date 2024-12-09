return {
    ---@param cutscene WorldCutscene
    flowey = function(cutscene, event)
        local flowey = cutscene:getCharacter("flowey")
        flowey:setAnimation("rise")
        cutscene:wait(1)
        Game.world.music:play("flowey", 1, 1)
        cutscene:showNametag("Flowey")
        cutscene:text("* Howdy![wait:10]\n* I'm [color:yellow]Flowey[color:reset]![wait:10]\n* [color:yellow]Flowey[color:reset] the [color:yellow]Flower[color:reset]!", "nice", flowey)
    end
}
