extends Node2D

@onready var score:float = 0.0
@onready var time:float = 0.0
@onready var PROCEDURAL_LEVEL_GEN:Produce_world = preload("res://scences/procedural_level_gen.tscn").instantiate()
func Update_score(amount:float):#
	score+=amount

	#wwwwew

	#did this work

func _process(delta: float) -> void:
	time +=delta 
func _ready() -> void:
	add_child(PROCEDURAL_LEVEL_GEN)
	PROCEDURAL_LEVEL_GEN.generate_world()
	pass
