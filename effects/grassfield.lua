return {
  ["grassfield"] = {
    groundflash = {
      air                = true,
      alwaysvisible      = true,
      circlealpha        = 0.6,
      circlegrowth       = 12,
      flashalpha         = 0.5,
      flashsize          = 150,
      ground             = true,
      ttl                = 20,
      water              = true, 
	  underwater         = true,
      color = {
        [1]  = 0,
        [2]  = 1,
        [3]  = 0.2,
      },
    },
	explosionwave = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true, 
	  underwater         = true,
      properties = {
        airdrag            = 0.87,
        alwaysvisible      = true,
        colormap           = [[0 0 1 0.05	0 0 0 0.0]], -- same as groundflash colors
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 0, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = [[20]], -- same as groundflash ttl
        particlelifespread = 0,
        particlesize       = 2, -- groundflash flashsize 25 = 1, so if flashsize is 200, particlesize here would be 8
        particlesizespread = 1,
        particlespeed      = [[8]],
        particlespeedspread = 6,
        pos                = [[0, 1, 0]],
        sizegrowth         = 3, -- same as groundflash circlegrowth
        sizemod            = 1.0,
        texture            = [[explosionwave]],
      },
    },
    centerflare = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true, 
	  underwater         = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.3,
        maxheat            = 20,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 1,
        sizegrowth         = 5,
        speed              = [[0, 1 0, 0]],
        texture            = [[largelove]],
      },
    },
  },
  ["grassfield_aura"] = {
    groundflash = {
      air                = true,
      alwaysvisible      = true,
      circlealpha        = 0.6,
      circlegrowth       = 12,
      flashalpha         = 0.5,
      flashsize          = 150,
      ground             = true,
      ttl                = 40,
      water              = true, 
	  underwater         = true,
      color = {
        [1]  = 0,
        [2]  = 1,
        [3]  = 0.2,
      },
    },
   },
  ["grass_trail"] = {
    usedefaultexplosions = false,
    glow = {
      air                = true,
      class              = [[explspike]],
      count              = 12,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.125,
        alwaysvisible      = false,
        color              = [[0.2,1,0.2]],
        dir                = [[-4 r8, -4 r8, -4 r8]],
        length             = 4,
        lengthgrowth       = 1,
        width              = 4,
      },
    },
    white = {
      air                = true,
      class              = [[explspike]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.125,
        alwaysvisible      = false,
        color              = [[1,1,1]],
        dir                = [[-2 r4, -2 r4, -2 r4]],
        length             = 1,
        lengthgrowth       = 1,
        width              = 2,
      },
    },
	explosionwave = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true, 
	  underwater         = true,
      properties = {
        airdrag            = 0.8,
        alwaysvisible      = true,
        colormap           = [[0 1 0.1 0.15	0.2 1 0 0.0]], 
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[1, 0, 0]],
        gravity            = [[-1, 0, 0]],
        numparticles       = 5,
        particlelife       = [[20]], -- same as groundflash ttl
        particlelifespread = 0,
        particlesize       = 40, -- groundflash flashsize 25 = 1, so if flashsize is 200, particlesize here would be 8
        particlesizespread = 1,
        particlespeed      = 5,
        particlespeedspread = 10,
        pos                = [[r20 r-20, -50, r20 r-20]],
        sizegrowth         = 5, -- same as groundflash circlegrowth
        sizemod            = 0.95,
        texture            = [[goldlove]],
      },
    },
  },
}
