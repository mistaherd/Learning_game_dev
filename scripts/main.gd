extends Node2D

@onready var score:float = 0.0
@onready var time:float = 0.0

func Update_score(amount:float):#
	score+=amount
<<<<<<< HEAD
	#wwwwew
=======
	#did this work
>>>>>>> 1ef5faef72dfe2e828519846857317cea1dde045
func _process(delta: float) -> void:
	time +=delta 
	
