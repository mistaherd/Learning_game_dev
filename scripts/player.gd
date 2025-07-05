class_name Player extends CharacterBody2D
const speed=800
func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("Player_walk_left","Player_walk_right")
	var direction_y:=Input.get_axis("Player_walk_up","Player_walk_down")
	
	var Input_direction=Vector2(direction_x,direction_y)
	if Input_direction.length()>0:
		velocity=Input_direction.normalized()*speed
		
	else:
		velocity.x=move_toward(velocity.x,0,speed)
		velocity.y=move_toward(velocity.y,0,speed)
	# enables collsions	
	move_and_slide()
