return {
    TEST = function(cutscene)
        Assets.playSound("ceroba_boom")
        cutscene:wait(0.5)
        Game:getQuest("a_special_delivery"):unlock()
        Game:getQuest("testquest"):unlock()
        cutscene:wait(0.5)
    end
}