math.randomseed( os.time() )

local SIZE = display.contentWidth/4
local rects = {}

local group = display.newGroup( )



local function onTouch(event)

	local r = event.target

	if event.phase == "began" then

		if r.whiteR then

			r.whiteR.alpha = 1
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


		if math.random() > 0.9 then
			local whiteR = display.newRect( group, x, y, SIZE, SIZE )
			whiteR.anchorX = 0
			whiteR.anchorY = 0

			transition.to( whiteR, {time = 2000, alpha = 0} )

			r.whiteR = whiteR
		end
	end
end



group.y = 0.5* (display.contentHeight - group.width)