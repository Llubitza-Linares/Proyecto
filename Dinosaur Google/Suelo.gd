extends Node2D

const VELOCIDAD:float = 250.0

onready var partes:Array =  [$Suelo, $Suelo2]
var anchura_sprite:float 

func _ready():
	anchura_sprite = partes[0].texture.get_size().x * partes[0].scale.x

func _process(delta:float) -> void:
	for parte in partes:
		parte.position.x -= VELOCIDAD * delta
		reset(parte)
		
func reset(parte:Sprite) -> void:
	if parte.position.x < -anchura_sprite:
		parte.position.x += 2 * anchura_sprite
		
