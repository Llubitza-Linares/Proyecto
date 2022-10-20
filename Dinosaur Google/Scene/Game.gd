extends Node2D

var start = false
var die=false
var score
var time=0

var Tree_scene = preload("res://Scene/Tree.tscn")
var Bird_scene = preload("res://Scene/Bird.tscn")

func _process(delta):
	if !start:
		$Game_over.hide()
		$Instrucciones.show()
		if Input.is_action_just_pressed("saltar"):
			$Instrucciones.hide()
			$AudioStreamPlayer.playing=true
			start=true
			$Dinosaur.start = true
			$ParallaxBackground.playing = true
			$Timer.start()


func _on_Timer_timeout():
	spawn_tree()
	
func spawn_tree():
	var random:int =randi()%2
	match random:
		0:
			var tree = Tree_scene.instance()
			add_child(tree)
			tree.position = Vector2(1034,512)
			tree.start = true
			tree.connect("body_entered", self, "game_over")
			
		1:
			var bird = Bird_scene.instance()
			add_child(bird)
			bird.position = Vector2(948,460)
			bird.start = true
			bird.connect("body_entered", self, "game_over")
			

func game_over(body):
	die=true
	if die:
		$Game_over.show()
		$Game_over._on_Control_gui_input(InputEventMouseButton)
	
	$Timer.stop()
	$AudioStreamPlayer.playing=false
	$ParallaxBackground.playing = false
	$Dinosaur.die = true
	$Dinosaur.start = false
	var trees = get_tree().get_nodes_in_group('tree')
	for tree in trees:
		tree.start = false
	
	var birds = get_tree().get_nodes_in_group('bird')
	for bird in birds:
		bird.start = false
