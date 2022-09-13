extends Spatial

export(PackedScene) var fish_scene
export(PackedScene) var worm_scene
export(PackedScene) var apple_scene
var textures = [load("res://phishing howtostop sara.png"), load("res://phishing test sara.png"), load("res://The phishing cycle sara.jpg")]
var malwaretextures = [load("res://definitionsmalware.png"), load("res://howmalwareworks.jpg"), load("res://typesofmalware.jpeg")]

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
				fish.transform.origin = Vector3(-18,1,33)
			elif i ==2:
				get_node("./@fish@2/Sprite3D").set_texture(textures[1])
				fish.transform.origin = Vector3(-19,1,33)
			else :
				get_node("./@fish@3/Sprite3D").set_texture(textures[2])
				fish.transform.origin = Vector3(-18,1,32)
		
		for i in range(1,4):
			var worm = worm_scene.instance()
			add_child(worm)
			if i == 1:
				#get_node("./worm/Sprite3D")
				worm.transform.origin = Vector3(13,0, 15)
			elif i ==2:
				#get_node("./@worm@2/Sprite3D")
				worm.transform.origin = Vector3(13,0, 15)
			else :
				#get_node("./@worm@3/Sprite3D")
				worm.transform.origin = Vector3(13,0, 15)
				
		for i in range(1,4):
			var apple = apple_scene.instance()
			add_child(apple)
			print (apple.name)
			if i == 1:
				get_node("./apple/texture").set_texture(malwaretextures[0])
				apple.transform.origin = Vector3(13,0, 15)
			elif i ==2:
				get_node("./@apple@6/texture").set_texture(malwaretextures[1])
				apple.transform.origin = Vector3(13,0, 15)
			else :
				get_node("./@apple@7/texture").set_texture(malwaretextures[2])
				apple.transform.origin = Vector3(13,0, 15)
				
func _on_ScamArea_body_entered(body):
	print("This is incorrect because...")

func _on_ScamArea2_body_entered(body):
	print("This is incorrect because...")

func _on_NotScamArea_body_entered(body): 
	get_node("./ARVROrigin").transform.origin = Vector3(16,0.5,10)

func _on_StartButton_body_entered(body):
	get_node("./ARVROrigin").transform.origin = Vector3(-15,1,30)
