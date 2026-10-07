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
        if Game.world.map.id == "dunes/34" then
            cutscene:text("* Honestly,[wait:5] I hope this thing works as advertised.", "look_left", "jamm")
            cutscene:text("* Hm?[wait:10]\n* What'd I wish for?", "neutral", "jamm")
            cutscene:text("* I can't tell you,[wait:5] or it won't come true.", "worried", "jamm")
			if Game:getFlag("future_variable") then
				cutscene:text("* Or...[wait:10]\n* Maybe it already did.", "relief", "jamm")
			else
				cutscene:text("* Or at least,[wait:5] that's the myth...", "nervous_left", "jamm")
			end
        elseif Game.world.map.id == "dunes/30" then
            cutscene:text("* Psychics,[wait:5] huh?[wait:10]\n* What a scam.", "stern", "jamm")
            cutscene:text("* ...What about you,[wait:5] " .. Game.party[1]:getName() .. "?[wait:10]\n* Do you believe in psychics?", "look_left", "jamm")
			local p_believe = false
			if (false) then		-- character checks for if any character themself has an opinion
			else
				if cutscene:choicer({"Yes", "No"}) == 1 then
					p_believe = true
				end
			end
            if p_believe then
				cutscene:text("* Really?[wait:10] Well...", "nervous", "jamm")
				cutscene:text("* I guess you're free to believe if you want.", "nervous_left", "jamm")
			else
				cutscene:text("* Figured you'd agree with me.", "smirk", "jamm")
				cutscene:text("* After all,[wait:5] who can just look into a ball and tell the future?", "smirk", "jamm")
			end
        elseif Game.world.map.id == "dunes/37" then
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
        elseif Game.world.map.id == "steamworks/15" then
            cutscene:text("* That \"Axis\" person doesn't know when to quit,[wait:5] huh?", "stern", "jamm")
            cutscene:text("* I mean,[wait:5] we've dealt with worse,[wait:5] but still...", "stern", "jamm")
        elseif Game.world.map.id == "steamworks/19" then
            cutscene:text("* ...You think these Jandroids would get mad if I started cleaning?", "troll", "jamm")
        elseif Game.world.map.id == "steamworks/23" then
            cutscene:text("* ...Who were these tables made for,[wait:5] little kids?", "stern", "jamm")
        elseif Game.world.map.id == "steamworks/chem/03" then
            cutscene:text("* ...You know,[wait:5] I'm almost afraid of turning this one on.", "nervous", "jamm")
            cutscene:text("* I mean,[wait:5] seeing that other sink and all...", "nervous_left", "jamm")
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
