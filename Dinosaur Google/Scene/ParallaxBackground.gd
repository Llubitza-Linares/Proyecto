extends ParallaxBackground

var start = false


func _process(delta):
	if !start:
		if Input.is_action_just_pressed("saltar"):
			start=true
			$Dinosaur.start = true
			$ParallaxBackGround.playing = true
