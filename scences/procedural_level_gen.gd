extends Node2D

@export var noise_height_text:NoiseTexture2D
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

var noise:Noise
var width:int=100
var height:int=100
enum Tile_sets_SourceID {Desert_A1,Desert_A2,Desert_A5,Desert_Treerock}
# added enum for visalbe layers feel free to add more  depend on how we want to implment it 
enum Visable_layer {Visable_l0,Visable_L1}
@onready var source_id :Tile_sets_SourceID=Tile_sets_SourceID.Desert_A1:set=set_source_id
var water_atlas =Vector2(16,3)
var land_atlas=Vector2(0,0)
func _ready() -> void:
	noise =noise_height_text.noise
	generate_world()
func generate_world():
	for x in range(width):
		for y in range(height):
			var noise_val:float=noise.get_noise_2d(x,y)
			if noise_val>=0.0:
				#place land 
				source_id=Tile_sets_SourceID.Desert_A2
				tile_map_layer.set_cell(Vector2(x,y),source_id,0)
				pass
			elif  noise_val<0.0:
				#place water
				source_id=Tile_sets_SourceID.Desert_A1
				
				pass
## we want this for items 
func set_source_id(state:Tile_sets_SourceID):
	match state:
		Tile_sets_SourceID.Desert_A1:
			pass
		Tile_sets_SourceID.Desert_A2:
			pass
		Tile_sets_SourceID.Desert_A5:
			pass
		Tile_sets_SourceID.Desert_Treerock:
			pass
	pass
