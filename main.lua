math.randomseed( os.time() )

local SIZE = display.contentWidth/4
local rects = {}

local group = display.newGroup( )



local function onTouch(event)

	local r = event.target

	if event.phase == "began" then
		print(r.isWhite)

		if r.isWhite then

			r.alpha = 1
		end
	end
end


for i = 1, 4 do

	local y = (i - 1) * SIZE

	for j = 1, 4 do

		local x = (j - 1) * SIZE

		local r = display.newRect(group, x, y, SIZE, SIZE )

		r:setFillColor(1, 0, 0)
		r.strokeWidth = 1
		r.anchorX = 0
		r.anchorY = 0

		r.isWhite = false

		r:addEventListener( "touch", onTouch )

		function r:enterFrame()
			local speed = 0.03

			self:setFillColor(1, self.g, self.b)

			self.g = self.g - speed
			self.b = self.b - speed

			if self.g <= 0 then

				self:removeEventListener( "enterFrame", onEnterFrame )
			end
		end

		if math.random() > 0.9 then
			r:setFillColor( 1 )
			r.isWhite = true

			r.g = 1
			r.b = 1

			Runtime:addEventListener( "enterFrame", r )

		end

	end
end



group.y = 0.5* (display.contentHeight - group.width)