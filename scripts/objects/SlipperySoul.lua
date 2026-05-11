local SlipperySoul, super = Class(LightSoul)

function SlipperySoul:init(x, y)
    super.init(self, x, y)
	
	self.slip_move_x = 0
	self.slip_move_y = 0
	self.afterimages = {}
	self.timer = Game.battle.timer:every(3/30, function()
		local afterimage = AfterImage(self, 0.75, 0.08)
		table.insert(self.afterimages, afterimage)
        self:addChild(afterimage)
	end)
end

function SlipperySoul:doMovement()
    local speed = self.speed

    -- Do speed calculations here if required.

    if Input.down("cancel") then speed = speed / 2 end -- Focus mode.

    local move_x, move_y = 0, 0

    -- Keyboard input:
    if Input.down("left")  then move_x = move_x - 1 end
    if Input.down("right") then move_x = move_x + 1 end
    if Input.down("up")    then move_y = move_y - 1 end
    if Input.down("down")  then move_y = move_y + 1 end

	-- Time to be slippery
	local lerp_amt_x = 0.05
	if move_x ~= 0 then
		lerp_amt_x = 0.2
	end
	local lerp_amt_y = 0.05
	if move_y ~= 0 then
		lerp_amt_y = 0.2
	end
	self.slip_move_x = Utils.lerp(self.slip_move_x, move_x, lerp_amt_x)
	self.slip_move_y = Utils.lerp(self.slip_move_y, move_y, lerp_amt_y)

    if self.slip_move_x ~= 0 or self.slip_move_y ~= 0 then
        self:move(self.slip_move_x, self.slip_move_y, speed * DTMULT)
    end

    self.moving_x = self.slip_move_x
    self.moving_y = self.slip_move_y
end

function SlipperySoul:update()
    --[[if not self.transitioning then
        if Input.pressed("menu") then
            self:explode()
        end
    end]]

    super.update(self)
end

return SlipperySoul