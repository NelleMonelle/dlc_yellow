local SteamworksMantaCheckpoint, super = Class(Event)

function SteamworksMantaCheckpoint:init(data)
    super.init(self, data.x, data.y, data.width, data.height)
	
	properties = data.properties or {}
	
	self.spawn_id = properties["spawn_id"] or nil
	self.spawn_dir = properties["spawn_dir"] or "up"
	self.up_free = properties["up"] or false
	self.down_free = properties["down"] or false
	self.left_free = properties["left"] or false
	self.right_free = properties["right"] or false
	self.up_flagvalue = properties["up_flagval"] or nil
	self.down_flagvalue = properties["down_flagval"] or nil
	self.left_flagvalue = properties["left_flagval"] or nil
	self.right_flagvalue = properties["right_flagval"] or nil
	self.can_dock = properties["dock_dir"] or nil
	self.dock_x = properties["dock_x"] or self.x
	self.dock_y = properties["dock_y"] or self.y
	self.active = false
	
	self:setOrigin(0.5,0.5)
end

function SteamworksMantaCheckpoint:onLoad(parent)
	super.onLoad(self)
	if type(self.up_free) == "string" then
        local inverted, flag = Utils.startsWith(self.up_free, "!")

        local result = Game.flags[uid..":"..flag] or Game.flags[flag]
        local value = self.up_flagvalue
        local is_true
        if value ~= nil then
            is_true = result == value
        elseif type(result) == "number" then
            is_true = result > 0
        else
            is_true = result
        end

        if is_true then
            self.up_free = inverted
        else
            self.up_free = not inverted
        end
	end
	if type(self.down_free) == "string" then
        local inverted, flag = Utils.startsWith(self.down_free, "!")

        local result = Game.flags[uid..":"..flag] or Game.flags[flag]
        local value = self.down_flagvalue
        local is_true
        if value ~= nil then
            is_true = result == value
        elseif type(result) == "number" then
            is_true = result > 0
        else
            is_true = result
        end

        if is_true then
            self.down_free = inverted
        else
            self.down_free = not inverted
        end
	end
	if type(self.left_free) == "string" then
        local inverted, flag = Utils.startsWith(self.left_free, "!")

        local result = Game.flags[uid..":"..flag] or Game.flags[flag]
        local value = self.left_flagvalue
        local is_true
        if value ~= nil then
            is_true = result == value
        elseif type(result) == "number" then
            is_true = result > 0
        else
            is_true = result
        end

        if is_true then
            self.left_free = inverted
        else
            self.left_free = not inverted
        end
	end
	if type(self.right_free) == "string" then
        local inverted, flag = Utils.startsWith(self.right_free, "!")

        local result = Game.flags[uid..":"..flag] or Game.flags[flag]
        local value = self.right_flagvalue
        local is_true
        if value ~= nil then
            is_true = result == value
        elseif type(result) == "number" then
            is_true = result > 0
        else
            is_true = result
        end

        if is_true then
            self.right_free = inverted
        else
            self.right_free = not inverted
        end
	end
end

return SteamworksMantaCheckpoint