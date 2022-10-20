extends KinematicBody2D

var velocity=Vector2.ZERO
var jump=Vector2.UP * 600
var gravity=Vector2.DOWN * 2000
var down=Vector2.DOWN * 6000
signal points_change(points)
var points=0
var start=false
var die=false
onready var state_machine = $AnimationTree.get("parameters/playback")

func _process(delta):
	if is_on_floor() and Input.is_action_just_pressed("saltar"):
		$AudioStreamPlayer.play(1.26)
		points+=5
		emit_signal("points_change",points)
		velocity = jump
	if is_on_floor():
		if Input.is_action_just_pressed("ui_down"):
			velocity += down * delta
			points+=5
			emit_signal("points_change",points)
	else:
			velocity += gravity * delta
	if start:
		if !is_on_floor() and !Input.is_action_just_pressed("ui_down"):
			state_machine.travel("walk")
		if is_on_floor() and Input.is_action_just_pressed("ui_down"):
			state_machine.travel("down")

	else:
		state_machine.travel("idle")
		points=0
		emit_signal("points_change",points)
	if die:
		$AudioStreamPlayer.playing=false
		state_machine.travel("die")
		
		
	move_and_slide(velocity,Vector2.UP)


