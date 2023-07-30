Config = {}

Config.Teleporters = {
	['musiker'] = {
		jobs = {enable = false, jobs = {'none'}},
		enter = { 
			coords = vec3(-595.31, 530.13, 107.75),
			heading = 199.47,
			information = {enable = true, text = '~g~[E]~s~ - Pool', size = 0.5}
		},
		exit = {
			coords = vec3(-609.14, 540.8, 111.32),
			heading = 17.48,
			information = {enable = true, text = '~g~[E]~s~ - Haustür', size = 0.5}
		},
		marker = {enable = true, distance = 7.5, type = 27, size = {a = 1.0, b = 1.0, c = 1.0}, color = {a = 255, b = 255, c = 255}}
	},
}