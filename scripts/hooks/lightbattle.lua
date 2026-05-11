local LightBattle, super = Class("LightBattle", true)

function LightBattle:onStateChange(old,new)
    super.onStateChange(self, old, new)
	
	if new == "SOUSBORG" then
        self.battle_ui:clearEncounterText()

        if self.menuselect_cursor_memory[self.state_reason] and Utils.containsValue(self:menuSelectMemory(), self.state_reason) then
            self.current_menu_x = self.menuselect_cursor_memory[self.state_reason].x
            self.current_menu_y = self.menuselect_cursor_memory[self.state_reason].y
        else
            self.current_menu_x = 1
            self.current_menu_y = 1
        end

        if not self:isValidMenuLocation() then
            self.current_menu_x = 1
            self.current_menu_y = 1
        end
    end
end

return LightBattle