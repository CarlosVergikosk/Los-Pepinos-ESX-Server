Config                            = {}
Config.DrawDistance               = 100.0
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale = 'en'

Config.AuthorizedVehicles = {

	{ 
		model = 'g65amg',  
		label = 'Carrinha',
	},
	{ 
		model = 'primo',  
		label = 'Carro de negocios'
	}
}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = -109.83, y = -596.17, z = 36.28},
		Size  = {x = 1.5, y = 1.5, z = 0.5},
		Color = {r = 204, g = 204, b = 0},
		Type  = 0
	},

	VehicleSpawnPoint = {
		Pos     = {x = -104.87, y = -609.82, z = 36.07},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1,
		Heading = 225.0
	},

	VehicleDeleter = {
		Pos   = {x = -100.6, y = -597.71, z = 35.07},
		Size  = {x = 3.0, y = 3.0, z = 0.5},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1
	},

	RussianActions = {
		Pos   = {x = -147.63, y = -641.2, z = 168.82},
		Size  = {x = 1.5, y = 1.5, z = 0.5},
		Color = {r = 255, g = 0, b = 0},
		Type  = 0
	},

	Cloakroom = {
		Pos     = {x = -129.96, y = -633.95, z = 168.82},
		Size    = {x = 1.5, y = 1.5, z = 0.5},
		Color   = {r = 255, g = 0, b = 0},
		Type    = 0
	}
}
