local TransitionManta, super = Class(Event)

function TransitionManta:init(data)
    super.init(self, data)

    properties = data.properties or {}

    self.target = {
        map = properties.map,
        x = properties.x,
        y = properties.y,
        marker = properties.marker,
        facing = properties.facing,
    }
    self.sound = properties.sound or nil
    self.pitch = properties.pitch or 1

    self.exit_delay = properties.exit_delay or 0
    self.exit_sound = properties.exit_sound or nil
    self.exit_pitch = properties.exit_pitch or 1
	
	self.transitioning = false
end

function TransitionManta:getDebugInfo()
    local info = super.getDebugInfo(self)
    if self.target.map then table.insert(info, "Map: " .. self.target.map) end
    if self.target.x then table.insert(info, "X: " .. self.target.x) end
    if self.target.y then table.insert(info, "Y: " .. self.target.y) end
    if self.target.marker then table.insert(info, "Marker: " .. self.target.marker) end
    if self.target.facing then table.insert(info, "Facing: " .. self.target.facing) end
    return info
end

function TransitionManta:doTransition()
	if not self.transitioning then
		local x, y = self.target.x, self.target.y
		local facing = self.target.facing
		local marker = self.target.marker
			
		Game:setFlag("manta_marker", marker)
		Game:setFlag("manta_tx", x)
		Game:setFlag("manta_ty", y)

		if self.sound then
			Assets.playSound(self.sound, 1, self.pitch)
		end
		
		if self.target.map then
			local callback = function(map)
				if self.exit_sound then
					Assets.playSound(self.exit_sound, 1, self.exit_pitch)
				end
				Game.world.door_delay = self.exit_delay
			end

			if marker then
				self.world:mapTransition(self.target.map, marker, facing or "up", callback)
			else
				self.world:mapTransition(self.target.map, x, y, facing or "up", callback)
			end
		end
		self.transitioning = true
	end
end

return TransitionManta