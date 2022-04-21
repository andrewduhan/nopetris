import 'vectorsprite'

Tetromino = {}
Tetromino.__index = Tetromino

local maxspeed = 12

function Tetromino:new(style)
	local styles = {}
	styles[1] = {-1,-4, 1,-4, 1,-2, -1,-2, 1,-2, 1,0, -1,0, 1,0, 1,2, -1,2, 1,2, 1,4, -1,4, -1,-4}
	styles[2] = {-2,-3, 0,-3, 0,-1, -2,-1, 0,-1, 0,1, -2,1, 0,1, 0,3, 0,1, 2,1, 2,3, -2,3, -2,-3}
	styles[3] = {0,-3, 2,-3, 2,3, -2,3, -2,1, 0,1, 0,3, 0,1, 2,1, 0,1, 0,-1, 2,-1, 0,-1, 0,-3}
	styles[4] = {-2,-2, 0,-2, 0,2, 0,-2, 2,-2, 2,0, -2,0, 2,0, 2,2, -2,2, -2,-2}
	styles[5] = {-3,-1, 3,-1, 3,1, -1,1, 1,1, 1,-1, 1,3, -1,3, -1,-1, -1,1, -3,1, -3,-1}
	local self = VectorSprite:new(styles[style])

	self.da = 0
	self.dx = 0
	self.dy = 0
	self.angle = 0
	
	function self:update()
		self:updatePosition()
	end
	
	return self
end
