return {
    susie = function(cutscene, event)
        if Game.world.map.id == "dunes/37" then
            cutscene:text("* This place rules.", "surprise_smile", "susie")
            cutscene:text("* Huh?[wait:5] Where did I got the hat?", "nervous_side", "susie")
            cutscene:text("* Found it.[wait:5] Duh.", "smile", "susie")
        elseif Game.world.map.id == "dunes/42" then
            cutscene:text("* Wow.[wait:5] I've NEVER seen so much food before.", "surprise", "susie")
            cutscene:text("* Never tried corn,[wait:5] either...", "annoyed_down_smile", "susie")
            cutscene:text("* Maybe I should take some with me.", "sincere_smile", "susie")
        end
    end,
    jamm = function(cutscene, event)
        if Game.world.map.id == "dunes/37" then
            cutscene:text("* Feels like I'm in one of those old western movies.", "look_left", "jamm")
            cutscene:text("* Like,[wait:5] really.[wait:5] Everything looks JUST like in them.", "nervous", "jamm")
            cutscene:text("* ...Hey,[wait:5] how much longer until High Noon[wait:5] anyways?", "sling_ready", "jamm")
        elseif Game.world.map.id == "dunes/42" then
            cutscene:text("* This is a nice house.", "side_smile", "jamm")
            cutscene:text("* Maybe I'll ask these folks if I can buy some corn from them.", "smile", "jamm")
            cutscene:text("* Who knows?[wait:10]\n* I could cook something great from it.", "drool", "jamm")
        elseif Game.world.map.id == "steamworks/09" then
            cutscene:text("* Jeez,[wait:5] it's pretty hot...", "look_left", "jamm")
            cutscene:text("* Guess they don't call it the Steamworks for nothing,[wait:5] huh?", "nervous", "jamm")
        end
    end,
    ceroba = function(cutscene, event)
        if Game.world.map.id == "dunes/37" then
            cutscene:text("* This place used to be sort of popular...", "smile", "ceroba")
            cutscene:text("* I know,[wait:5] since I lived right in this old house.", "alt", "ceroba")
            cutscene:text("* It was a bit cramped,[wait:5] with Starlo and his Posse...", "nervous_smile_closed", "ceroba")
            cutscene:text("* But,[wait:5] we managed.", "snarky", "ceroba")
        elseif Game.world.map.id == "dunes/42" then
            cutscene:text("* As much as I love Starlo's parents and their farm...", "nervous_smile_closed", "ceroba")
            cutscene:text("* Was there REALLY nothing else to grow here besides corn?", "nervous_smile", "ceroba")
        end
    end
}
