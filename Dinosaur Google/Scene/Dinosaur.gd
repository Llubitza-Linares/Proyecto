extends KinematicBody2D

var velocity=Vector2.ZERO
var jump=Vector2.UP * 600
var gravity=Vector2.DOWN * 2000
var down=Vector2.DOWN * 6000
var start=true
onready var state_machine = $AnimationTree.get("parameters/playback")

func _process(delta):
	if Input.is_action_just_pressed("saltar"):
		velocity = jump
	if is_on_floor():
		if Input.is_action_just_pressed("ui_down"):
			velocity += down * delta
	else:
			velocity += gravity * delta
	if start:
		if !is_on_floor() and !Input.is_action_just_pressed("ui_down"):
			state_machine.travel("walk")
		if is_on_floor() and Input.is_action_just_pressed("ui_down"):
			state_machine.travel("down")
	move_and_slide(velocity,Vector2.UP)

