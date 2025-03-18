-- DO NOT RENAME THIS RESOURCE

---------------------------------

--FLAGS TO USE ON Flags = {}

--Debris = 1
--Grass = 2
--Bush = 4
--Weed = 8
--Flower = 16
--Sapling = 32
--Tree = 64
--Rock = 128
--LongGrass = 256 

-- if you want only to remove some Bush you use only Flags ={4}... if you want to remove Debris and Grass you will use {1, 2} and so on...

---------------------------------

--TYPE

--VMT_Cull = 1 // THIS IS THE RECOMMENDED TYPE TO USE BUT YOU CAN TEST OTHER TYPES
--VMT_Flatten = 2
--VMT_FlattenDeepSurface = 4
--VMT_Explode = 8
--VMT_Push = 16
--VMT_Decal = 32

---------------------------------


Config = {}

Config.VegZones = {


	{
		coords = vector3(0.0, 0.0, 0.0), 
		rangeDetect = 150.0, --range to see
		radius = 10.0, --range active
		Flags = {1, 2, 4, 8, 16, 32, 64, 128, 256},
		TypeModifier = 1, 
	},

	
}



