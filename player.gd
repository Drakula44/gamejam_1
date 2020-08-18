extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentDimension = 0

func set_physics_layer(index, value):
	set_collision_layer_bit(index, value)
	set_collision_mask_bit(index, value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var vel : Vector2 = Vector2()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vel.y += 800*delta
	vel = move_and_slide(vel, Vector2.UP)
	
	if Input.is_action_just_pressed("change_dimension"):
		currentDimension = (currentDimension+1)%3
		set_physics_layer(0, false)
		set_physics_layer(1, false)
		set_physics_layer(2, false)
		set_physics_layer(currentDimension, true)
		
		
		
	
