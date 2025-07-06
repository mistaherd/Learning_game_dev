extends Node


@onready var score_label: Label = $Header_ui/Score_label
@onready var time_label: Label = $Header_ui/Time_label
@onready var camera_2d_2: Camera2D = $"../Camera2D2"

func Update_Score():
	# maybe we add from some where
	Main.Update_score(1.1)
	
	score_label.text="Score: %s" %Main.score 
func Update_Time():
	time_label.text="Time: %.2f" %Main.time
func _ready() -> void:
	Update_Score()
func _process(delta: float) -> void:
	
	Update_Time()
