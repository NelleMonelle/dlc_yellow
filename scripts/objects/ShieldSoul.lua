local ShieldSoul, super = Class(Soul)

function ShieldSoul:init(x, y, color)
    super:init(self, x, y)

    self.color = color or {1, 0, 0}

	-- internal stuff
	self.tween = nil

	self.shield = ShieldSoulShield((-self.width * 1.5) + 12, (-self.height * 1.5) + 2)

	self:addChild(self.shield)

end

function ShieldSoul:doMovement()
	local speed = self.speed

    -- Do speed calculations here if required.

    if self.allow_focus then
        if Input.down("cancel") then speed = speed / 2 end -- Focus mode.
    end

    local move_x = 0

    -- Keyboard input:
    if Input.down("left")  then move_x = move_x - 1 end
    if Input.down("right") then move_x = move_x + 1 end

    self.moving_x = move_x

    if move_x ~= 0 then
        if not self:move(move_x, 0, speed * DTMULT) then
            self.moving_x = 0
        end
    end
end

return ShieldSoul