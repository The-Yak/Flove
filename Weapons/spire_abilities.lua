local Zap = Weapon:New{
	alwaysVisible = true,
	areaofeffect = 500,
	avoidfeature = false,
	burst = 3,
	burstrate = 0.1,
	craterboost = 0,
	cratermult = 0,
	collidefriendly = false,
	collidefeature = false,
	collideneutral = false,
	collideground = true,
	explosiongenerator = "custom:love_impact",
	explosionScar = false,
	firestarter = 100,
	impulseboost = 0,
	impulsefactor = 0,
	intensity = 0.7,
	noselfdamage = true,
	nogap = true,
	projectiles = 1,
	range = 1800,
	reloadtime = 0.7,
	separation = 0.1,
	size = 80,
-- 	soundstart = "shotgun1.wav",
	sprayangle = 0,
	tolerance = 50,
	texture1                = [[largelove]],
	turret = true,
	weapontimer = 0.1,
	weapontype = "Cannon",
	weaponvelocity = 1900,
	damage = {
		default = 300,
	},
}

local FlowerShot = Weapon:New{
	alwaysVisible = true,
	--areaofeffect = 8,
	avoidfeature = false,
	burst = 3,
	burstrate = 0.1,
	cegTag = [[grass_trail]],
	craterboost = 0,
	cratermult = 0,
	collidefriendly = false,
	collidefeature = false,
	collideneutral = false,
	collideground = true,
	explosiongenerator = "custom:grassfield",
	firestarter = 100,
	impulseboost = 0,
	impulsefactor = 0,
	intensity = 0.7,
	noselfdamage = true,
	projectiles = 1,
	range = 1800,
	reloadtime = 0.31000000238419,
	rgbcolor = "0.25 0.95 0.2",
	size = 57.5,
-- 	soundstart = "shotgun1.wav",
	sprayangle = 20,
	tolerance = 50,
	turret = true,
	weapontimer = 0.1,
	weapontype = "Cannon",
	weaponvelocity = 3000,
	damage = {
		default = 0,
	},
}

local UpgradeShot = Weapon:New{
	alwaysVisible = true,
	--areaofeffect = 8,
	avoidfeature = false,
	burst = 3,
	burstrate = 0.1,
	cegTag = [[love_golden]],
	craterboost = 0,
	cratermult = 0,
	collidefriendly = true,
	collidefeature = false,
	collideneutral = false,
	collideground = true,
	explosiongenerator = "custom:love_happy",
	flighttime = 9999,
	impulseboost = 0,
	impulsefactor = 0,
	intensity = 0.7,
	noselfdamage = true,
	projectiles = 1,
	range = 1800,
	reloadtime = 0.31000000238419,
	rgbcolor = "0 0 1",
	size = 57.5,
	sprayangle = 20,
	tolerance = 50,
	tracks = true,
	turret = true,
	turnrate                = 200000,
    weaponAcceleration      = 5000,
    weaponTimer             = 1,
	weapontype = "MissileLauncher",
	weaponvelocity = 3000,
	damage = {
		default = 0,
	},
}

return lowerkeys{
	Zap = Zap,
	FlowerShot = FlowerShot,
	UpgradeShot = UpgradeShot,
}
