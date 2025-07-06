extends Node2D

@onready var score:float = 0.0
@onready var time:float = 0.0

func Update_score(amount:float):#
	score+=amount
	#did this work
func _process(delta: float) -> void:
	time +=delta 
	
