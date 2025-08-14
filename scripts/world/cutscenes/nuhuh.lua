return function(cutscene, event)
    cutscene:text("[instant]* Nuh uh", nil, nil, {wait=false})
    cutscene:slideTo(Game.world.player, Game.world.player.x + 10, Game.world.player.y, 0.1)
end