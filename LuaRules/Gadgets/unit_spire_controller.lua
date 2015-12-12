--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name 	= "Spire",
		desc	= "Spire control gadget.",
		author	= "gajop, Google Frog", -- based on GoogleFrog's shotgun gadget
		date	= "12 December 2015",
		license	= "GNU GPL, v2 or later",
		layer	= 20,
		enabled = true
	}
end


-------------------------------------------------------------------
-- SYNCED
-------------------------------------------------------------------
if gadgetHandler:IsSyncedCode() then
-------------------------------------------------------------------


local spireDefID = UnitDefNames["spire"].id
local spireID = nil
local targetx, targety, targetz
local COB_ANGULAR = 182
-------------------------------------------------------------------
-------------------------------------------------------------------

local function explode(div,str)
	if (div=='') then return 
		false 
	end
	local pos,arr = 0,{}
	-- for each divider found
	for st,sp in function() return string.find(str,div,pos,true) end do
		table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
		pos = sp + 1 -- Jump past current divider
	end
	table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
	return arr
end

-------------------------------------------------------------------
-- Spawning Projectiles
-------------------------------------------------------------------

local function Norm(x, y, z)
	local size = math.sqrt(x * x + y * y + z * z)
	return x / size, y / size, z / size
end

local function SpawnShot(def, spawnx, spawny, spawnz, dx, dy, dz)
	local ex, ey, ez = (math.random() * 2 - 1) * def.sprayAngle, (math.random() * 2 - 1) * def.sprayAngle, (math.random() * 2 - 1) * def.sprayAngle
	local dirx, diry, dirz = Norm(dx + ex, dy + ey, dz + ez)
	local v = def.projectilespeed
	
	local params = {
		pos = {spawnx, spawny, spawnz},
		speed = {dirx * v, diry * v, dirz * v},
		owner  = spireID,
	}
	Spring.SpawnProjectile(def.id, params)
end

local function FireZap(x, y, z)
	if not spireID then
		return
	end
	
	local zapDef = WeaponDefNames.zap
	local flare = Spring.GetUnitPieceMap(spireID).Eye
	local spawnx, spawny, spawnz = Spring.GetUnitPiecePosDir(spireID, flare)
	local dx, dy, dz = Norm(x - spawnx, y - spawny, z - spawnz)
	
	for i = 1, zapDef.projectiles do
		SpawnShot(zapDef, spawnx, spawny, spawnz, dx, dy, dz)
	end
    
    Spring.SpawnCEG("mordor_flowershot", spawnx, spawny, spawnz, 0, 0, 0, 0)
	
	--Spring.SetUnitVelocity(spireID, -dx * 20, -dy * 20, -dz * 20)
	local env = Spring.UnitScript.GetScriptEnv(spireID)
-- 	Spring.UnitScript.CallAsUnit(spireID, env.Fire)
	--Spring.PlaySoundFile("sounds/shotgun1.wav", 20, spawnx, spawny, spawnz)
-- 	Spring.GiveOrderToUnit(spireID, CMD.STOP, {}, {})
-- 	if targetx then
-- 		Spring.GiveOrderToUnit(spireID, CMD.MOVE, {targetx + 100, targety, targetz - 100}, {})
-- 	end
end

local function FireFlowerShot(x, y, z)
	if not spireID then
		return
	end
	
	local flowerShot = WeaponDefNames.flowershot
	local flare = Spring.GetUnitPieceMap(spireID).Eye
	local spawnx, spawny, spawnz = Spring.GetUnitPiecePosDir(spireID, flare)
	local dx, dy, dz = Norm(x - spawnx, y - spawny, z - spawnz)
	
	for i = 1, flowerShot.projectiles do
		SpawnShot(flowerShot, spawnx, spawny, spawnz, dx, dy, dz)
	end
    
    Spring.SpawnCEG("mordor_flowershot", spawnx, spawny, spawnz, 0, 0, 0, 0)
	
	--Spring.SetUnitVelocity(spireID, -dx * 20, -dy * 20, -dz * 20)
	local env = Spring.UnitScript.GetScriptEnv(spireID)
end

-------------------------------------------------------------------
-- Handling unit
-------------------------------------------------------------------

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitDefID == spireDefID then
		spireID = unitID
		Spring.GiveOrderToUnit(unitID, CMD.IDLEMODE, {0}, {}) --no land
	end
end

function gadget:GameStart()
	gameStarted = true
end

function gadget:GameFrame(n)
	if not spireID or not targetx then
		return
	end
	
	local ux, uy, uz = Spring.GetUnitPosition(spireID)
	local dx, dy, dz = targetx - ux, uy - targety, targetz - uz
	local newHeading = math.deg(math.atan2(dx, dz)) * COB_ANGULAR
	local dist = math.sqrt(dx * dx + dz * dz)
	local pitch = math.atan2(dy, dist)
	
	Spring.SetUnitCOBValue(spireID, COB.HEADING, newHeading)
	local env = Spring.UnitScript.GetScriptEnv(spireID)
	Spring.UnitScript.CallAsUnit(spireID, env.SetPitch, pitch)
end

function gadget:Initialize()
	Spring.SetGameRulesParam("mana", 0)
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local unitDefID = Spring.GetUnitDefID(unitID)
		gadget:UnitCreated(unitID, unitDefID)
	end
end

-------------------------------------------------------------------
-- Handling messages
-------------------------------------------------------------------

function HandleLuaMessage(msg)
	local msg_table = explode('|', msg)
	if msg_table[1] == 'zap' then --LMB
		local x = tonumber(msg_table[2])
		local y = tonumber(msg_table[3])
		local z = tonumber(msg_table[4])	
        
		FireZap(x, y, z)        
	elseif msg_table[1] == 'field_of_flowers' then -- RMB
		local x = tonumber(msg_table[2])
		local y = tonumber(msg_table[3])
		local z = tonumber(msg_table[4])
        
		FireFlowerShot(x, y, z)
	end
end

function gadget:RecvLuaMsg(msg)
	HandleLuaMessage(msg)
end



-------------------------------------------------------------------
-- UNSYNCED
-------------------------------------------------------------------
else
-------------------------------------------------------------------

  return

-------------------------------------------------------------------
end

