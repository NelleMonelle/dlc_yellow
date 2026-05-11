local LightBattleUI, super = Class("LightBattleUI", true)

function LightBattleUI:drawState()
	super.drawState(self)
    local state = Game.battle.state

    if state == "SOUSBORG" then
        for _,text in ipairs(self.menu_text) do
			text:setText("")
		end
		self.page_text:setText("")
		for _,text in ipairs(self.enemies_text) do
			text:setText("")
		end
		for _,text in ipairs(self.enemies_special_text) do
			if state ~= "ENEMYSELECT" then
				text:setText("")
				text.enemy = nil
				text.enemy_name = nil
			end
		end
		for _,text in ipairs(self.comment_text) do
			text:setText("")
		end
		for _,text in ipairs(self.xact_text) do
			text:setText("")
		end
		for _,text in ipairs(self.party_text) do
			text:setText("")
		end
		self.flee_text:setText("")
		
        local page = Game.battle:isPagerMenu() and math.ceil(Game.battle.current_menu_x / Game.battle.current_menu_columns) - 1 or math.ceil(Game.battle.current_menu_y / Game.battle.current_menu_rows) - 1
        local max_page = math.ceil(#Game.battle.menu_items / (Game.battle.current_menu_columns * Game.battle.current_menu_rows)) - 1

        local x = 0
        local y = 0

        local menu_offsets = { -- {soul, text}
            ["ACT"] = {12, 16},
            ["ITEM"] = {0, 0},
            ["SPELL"] = {12, 16},
            ["MERCY"] = {0, 0},
        }

        for lib_id,_ in Kristal.iterLibraries() do
            menu_offsets = Kristal.libCall(lib_id, "getLightBattleMenuOffsets", menu_offsets) or menu_offsets
        end
        menu_offsets = Kristal.modCall("getLightBattleMenuOffsets", menu_offsets) or menu_offsets

        local extra_offset
        for name, offset in pairs(menu_offsets) do
            if name == Game.battle.state_reason then
                extra_offset = offset
            end
        end

        if Game.battle:isPagerMenu() then
            Game.battle.soul:setPosition(72 + ((Game.battle.current_menu_x - 1 - (page * 2)) * (248 + extra_offset[1])), 255 + ((Game.battle.current_menu_y) * 31.5))
        else
            Game.battle.soul:setPosition(72 + ((Game.battle.current_menu_x - 1) * (248 + extra_offset[1])), 255 + ((Game.battle.current_menu_y - (page * Game.battle.current_menu_rows)) * 31.5))
        end

        local font = Assets.getFont("main_mono")
        love.graphics.setFont(font, 32)

        local col = Game.battle.current_menu_columns
        local row = Game.battle.current_menu_rows
        local draw_amount = col * row

        local page_offset = page * draw_amount
        
        for i = page_offset + 1, math.min(page_offset + draw_amount, #Game.battle.menu_items) do
            local item = Game.battle.menu_items[i]

            Draw.setColor(1, 1, 1, 1)
            
            local text_offset = 0
            local able = Game.battle:canSelectMenuItem(item)
            
            -- Head counter
            local heads = 0
            if item.party then
                for index, party_id in ipairs(item.party) do
                    local chara = Game:getPartyMember(party_id)
                    if Game.battle:getPartyIndex(party_id) ~= Game.battle.current_selecting then
                        heads = heads + 1
                    end
                end
                if not able then
                    Draw.setColor(COLORS.gray)
                end

                if heads <= 1 then
                    for index, party_id in ipairs(item.party) do
                        local chara = Game:getPartyMember(party_id)

                        if Game.battle:getPartyIndex(party_id) ~= Game.battle.current_selecting then
                            local ox, oy = chara:getHeadIconOffset()
                            Draw.draw(Assets.getTexture(chara:getHeadIcons() .. "/head"), text_offset + 92 + (x * (240 + extra_offset[2])) + ox, 5 + (y * 32) + oy)
                            text_offset = text_offset + 37
                        end
                    end
                else
                    for index, party_id in ipairs(item.party) do
                        local chara = Game:getPartyMember(party_id)
                        -- Draw head only if it isn't the currently selected character
                        if Game.battle:getPartyIndex(party_id) ~= Game.battle.current_selecting then
                            local ox, oy = chara:getHeadIconOffset()
                            local party = 0
                            if heads > 2 then
                                party = heads - 2
                            end
                            Draw.draw(Assets.getTexture(chara:getHeadIcons() .. "/head"), text_offset + 92 + (x * (240 + extra_offset[2])) + ox, 5 + (y * 32) + oy + (party ~= 0 and (0 + party * 1.9) or 0), 0, 1 / (1 + party * 0.35))
                            text_offset = text_offset + (30 / (1 + party * 0.5))
                        end
                    end
                end
            end

            local icons_at_beginning = nil
            if item.icons then
                if not able then
                    Draw.setColor(COLORS.gray)
                end

                icons_at_beginning = false
                for _, icon in ipairs(item.icons) do
                    if type(icon) == "string" then
                        icon = {icon, false, 0, 0, nil}
                    end
                    if not icon[2] then
                        local texture = Assets.getTexture(icon[1])
                        Draw.draw(texture, text_offset + 95 + (x * (240 + extra_offset[2])) + (icon[3] or 0), (y * 32) + (icon[4] or 0))
                        text_offset = text_offset + (icon[5] or texture:getWidth())
                    else
                        icons_at_beginning = true
                    end
                end
            end
            
            local menu_text = self.menu_text[i - page_offset]

            if able then
                menu_text:setColor(item.color or {1, 1, 1, 1})
            else
                menu_text:setColor(COLORS.gray)
            end

            for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
                if enemy:canSpare() and item.special == "spare" then
                    menu_text:setColor(MagicalGlassLib.spare_color)
                end
            end

            local name = item.name
            if item.seriousname and MagicalGlassLib.serious_mode then
                name = item.seriousname
            elseif item.shortname then
                name = item.shortname
            end

            if heads > 0 or icons_at_beginning == false then
                menu_text:setPosition(text_offset + 57 + (x * (240 + extra_offset[2])), 15 + (y * 32))
                menu_text:setText("[shake:"..MagicalGlassLib.light_battle_shake_text.."]" .. name)
                text_offset = text_offset + font:getWidth(name)
            else
                menu_text:setPosition(text_offset + 62 + (x * (240 + extra_offset[2])), 15 + (y * 32))
                menu_text:setText("[shake:"..MagicalGlassLib.light_battle_shake_text.."]" .. "* " .. name)
                text_offset = text_offset + font:getWidth("* " .. name) + 5
            end

            if item.icons then
                if able then
                    Draw.setColor(1, 1, 1)
                else
                    Draw.setColor(COLORS.gray)
                end

                for _, icon in ipairs(item.icons) do
                    if type(icon) == "string" then
                        icon = {icon, false, 0, 0, nil}
                    end
                    if icon[2] then
                        local texture = Assets.getTexture(icon[1])
                        Draw.draw(texture, text_offset + 95 + (x * (240 + extra_offset[2])) + (icon[3] or 0), (y * 32) + (icon[4] or 0))
                        text_offset = text_offset + (icon[5] or texture:getWidth())
                    end
                end
            end

            if Game.battle.current_menu_columns == 1 then
                if x == 0 then
                    y = y + 1
                end
            else
                if x == 0 then
                    x = 1
                else
                    x = 0
                    y = y + 1
                end
            end

        end

        local tp_offset = 0
        local current_item = Game.battle.menu_items[Game.battle:getItemIndex()] or Game.battle.menu_items[1] -- crash prevention in case of an invalid option
        if current_item.description then
            self.help_window:setDescription(current_item.description)
        end

        if current_item.tp and current_item.tp ~= 0 then
            self.help_window:setTension(current_item.tp)
            Game:setTensionPreview(current_item.tp)
        else
            self.help_window:setTension(0)
            Game:setTensionPreview(0)
        end

        Draw.setColor(1, 1, 1, 1)

        if Game.battle:isPagerMenu() then
            self.page_text:setText("[shake:"..MagicalGlassLib.light_battle_shake_text.."]" .. "PAGE " .. page + 1)
        else
            if page < max_page then
                Draw.draw(self.arrow_sprite, 45, 90 + (math.sin(Kristal.getTime()*6) * 2))
            end
            if page > 0 then
                Draw.draw(self.arrow_sprite, 45, 10 - (math.sin(Kristal.getTime()*6) * 2), 0, 1, -1)
            end
        end
    end
end

return LightBattleUI