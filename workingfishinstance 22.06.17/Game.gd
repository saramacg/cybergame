extends Spatial

export(PackedScene) var fish_scene
var textures = [load("res://phishing howtostop sara.png"), load("res://phishing test sara.png"), load("res://The phishing cycle sara.jpg")]

func _ready():
	var VR = ARVRServer.find_interface("OpenVR")
	if VR and VR.initialize():
		get_viewport().arvr = true
		get_viewport().hdr = false

		OS.vsync_enabled = false
		Engine.target_fps = 90
		# Also, the physics FPS in the project settings is also 90 FPS. This makes the physics
		# run at the same frame rate as the display, which makes things look smoother in VR!
		
		for i in range(1,4):
			var fish = fish_scene.instance()
			add_child(fish)
			if i == 1:
				get_node("./fish/Sprite3D").set_texture(textures[0])
			elif i ==2:
				print (fish.name)
				get_node("./@fish@2/Sprite3D").set_texture(textures[1])
			else :
				get_node("./@fish@3/Sprite3D").set_texture(textures[2])
		
