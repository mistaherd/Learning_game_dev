class_name Produce_world extends Node2D

@export var noise_height_text:NoiseTexture2D
@onready var water: TileMapLayer = $water
@onready var ground_1: TileMapLayer = $ground1
@onready var ground_2: TileMapLayer = $ground2
@onready var clif: TileMapLayer = $Clif
@onready var enviroment: TileMapLayer = $enviroment


var noise:Noise
@export var width:int=100
@export var height:int=100
enum Tile_sets_SourceID {Desert_A1,Desert_A2,Desert_A5,Desert_Treerock}
# added enum for visalbe layers feel free to add more  depend on how we want to implment it 
enum Visable_layer {Invisible,Visable_l0,Visable_L1}
@onready var source_id :Tile_sets_SourceID=Tile_sets_SourceID.Desert_A1
@onready var water_atlas_location =Vector2(18,3)
@onready var sand_atlas_location=Vector2(0,0)
@onready var grass_atlas_location=Vector2(10,3)
@onready var clif_atlas_location=Vector2(0,20)

func _ready() -> void:
	noise =noise_height_text.noise
	#generate_world()
func generate_world():
	for x in range(-width/2,width/2):
		for y in range(-height/2,height/2):
			var noise_val:float=noise.get_noise_2d(x,y)
			#tree noise val here
			if noise_val>=0.0:
				source_id=Tile_sets_SourceID.Desert_A2
				ground_1.set_cell(Vector2(x,y),source_id,sand_atlas_location)
				#place land 
				if noise_val >0.25:
					#if noise_val <0.35 :
					## place clouds/ tress in here in here		
					#print("Source id when placeing land =",source_id
					source_id=Tile_sets_SourceID.Desert_A2
					ground_1.set_cell(Vector2(x,y),source_id,grass_atlas_location)
				
				if noise_val >0.4:
					source_id=Tile_sets_SourceID.Desert_A5
					ground_2.set_cell(Vector2(x,y),source_id,clif_atlas_location)
					pass
		
			#place water
				
			source_id=Tile_sets_SourceID.Desert_A1
			#print("source id when placeing water =",source_id)
			print(Vector2(x,y),source_id,water_atlas_location)
			water.set_cell(Vector2(x,y),source_id,water_atlas_location)
	
