return {
    blueprint = function(cutscene, event)
        ---@param cutscene WorldCutscene
        cutscene:text("* (Rolled-up blueprints lie in\nthe box.)")
        cutscene:text("* (You take a look.)")
        cutscene:after(function()
            Game.world:openMenu(ImageViewer("world/blueprint_overlay"))
        end)
    end
}