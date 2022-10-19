extends Node2D

var start = false
var Tree_scene = preload("res://Scene/Tree.tscn")

func _process(delta):
	if !start:
		if Input.is_action_just_pressed("saltar"):
			start=true
			$Dinosaur.start = true
			$ParallaxBackground.playing = true
			$Timer.start()


func _on_Timer_timeout():
	spawn_tree()
	
func spawn_tree():
	var tree = Tree_scene.instance()
	tree.position = Vector2(1034,512)
	tree.start = true
	tree.connect("body_entered", self, "game_over")
	add_child(tree)

func game_over(body):
	$Timer.stop()
	$ParallaxBackground.playing = false
	$Dinosaur.start = false
	var trees = get_tree().get_nodes_in_group('tree')
	for tree in trees:
		tree.start = false
