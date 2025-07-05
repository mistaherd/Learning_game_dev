class_name Player extends CharacterBody2D
const speed=800
func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("Player_walk_left","Player_walk_right")
	if direction!=0:
		velocity.x=direction*speed
	else:
		velocity.x=move_toward(velocity.x,0,speed)
	move_and_slide()
