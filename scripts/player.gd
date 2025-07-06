class_name Player extends CharacterBody2D
const speed=800
enum Player_state {Idle,Walk}
enum Player_Facing {North,South,East,West}
@onready var player_state:Player_state=Player_state.Idle:set=_set_player_state
@onready var player_facing:Player_Facing=Player_Facing.South
## movement section
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var direction_x
@onready var direction_y
func _physics_process(delta: float) -> void:
	direction_x = Input.get_axis("Player_walk_left","Player_walk_right")
	direction_y = Input.get_axis("Player_walk_up","Player_walk_down")

	var Input_direction=Vector2(direction_x,direction_y)
	if Input_direction.length()>0:
		player_state=Player_state.Walk
		velocity=Input_direction.normalized()*speed
		
	else:
	
		velocity.x=move_toward(velocity.x,0,speed)
		velocity.y=move_toward(velocity.y,0,speed)
		player_state=Player_state.Idle
	# enables collsions	
	move_and_slide()
	if direction_y==-1 :
		player_facing=Player_Facing.North
	
	elif direction_y==1:
		player_facing=Player_Facing.South
		
	elif direction_x ==-1:
		player_facing=Player_Facing.West
	
	elif direction_x==1:
		player_facing=Player_Facing.East
		
	
### state machine  
### this is for sound and animations 
func _set_player_state(state:Player_state):
	
	
	match state:
		Player_state.Idle:
		
			set_Idle()
		Player_state.Walk:
			set_Move()

func set_Idle():
	
	match player_facing:
		Player_Facing.North:
			
			animated_sprite_2d.play("Idle_north")
		Player_Facing.South:
			
			animated_sprite_2d.play("Idle_south")
		Player_Facing.East:
		
			animated_sprite_2d.play("Idle_east")
		Player_Facing.West:
			
			animated_sprite_2d.play("Idle_west")
		
		
	
func set_Move():
	match player_facing:
		Player_Facing.North:
			
			animated_sprite_2d.play("Walk_north")
		
		Player_Facing.South:
			
			animated_sprite_2d.play("Walk_south")
		
		Player_Facing.East:
			
			animated_sprite_2d.play("Walk_east")
		
		Player_Facing.West:
			
			animated_sprite_2d.play("Walk_west")
