return {
    steamworks_gate = function(cutscene, event)
        cutscene:wait(1)
        cutscene:detachCamera()
        cutscene:wait(cutscene:panTo(440, 320))
        cutscene:wait(1)
        if cutscene:getCharacter("susie_lw") then
            cutscene:text("* Huh.", "neutral_side", "susie")
            cutscene:text("* Seems like there's a new area up ahead.", "neutral_side", "susie")
        else
            cutscene:wait(1)
        end
        cutscene:attachCamera()
        cutscene:wait(2)
    end,
}
