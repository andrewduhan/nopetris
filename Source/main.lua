import "CoreLibs/graphics"
import 'tetromino'

gfx = playdate.graphics
geom = playdate.geometry

function normalizeAngle(a)
  if a >= 360 then a = a - 360 end
  if a < 0 then a = a + 360 end
  return math.floor(a + 0.5)
end

local tets = {}
local currtet 
local angle = 0

function newtet()
	tet = Tetromino:new(math.random(5))
	tet:moveTo(200, 20)
	tet:setScale(5)
	tet:setStrokeColor(gfx.kColorBlack)
	tet:setVelocity(0,2)
	tet:addSprite()
	table.insert(tets, tet)
	return tet
end

currtet = newtet()

function playdate.update()
  local change = playdate.getCrankChange()
	
  if change ~= 0 then
	  angle += change
	  angle = normalizeAngle(angle)
	  currtet.angle = angle
	  currtet:updateBounds()
  end
  
  if playdate.buttonIsPressed("left") then currtet.x = currtet.x - 5 end
  if playdate.buttonIsPressed("right") then currtet.x = currtet.x + 5 end
  
  if currtet.y > 220 then
	  currtet:setVelocity(0,0)
	  currtet = newtet()
  end
  gfx.sprite.update()
end
