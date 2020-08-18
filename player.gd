extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentDimension = 0

var vel : Vector2 = Vector2()
var gravity = 800
var speed = 300
var jump_force = 400
var direction = 0

var fallMultiplier = 1.5
var lowJumpMultiplier = 10

func set_physics_layer(index, value):
	set_collision_layer_bit(index, value)
	set_collision_mask_bit(index, value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	
	if Input.is_action_just_pressed("change_dimension"):
		currentDimension = (currentDimension+1)%3
		set_physics_layer(0, false)
		set_physics_layer(1, false)
		set_physics_layer(2, false)
		set_physics_layer(currentDimension, true)
		
	var right = Input.is_action_pressed("move_right")
	var left = Input.is_action_pressed("move_left")
	
	if right:
		direction = 1
		get_node("Sprite").set_flip_h(false)
	if left:
		direction = -1
		get_node("Sprite").set_flip_h(true)
	if (not left and not right) or (left and right):
		direction = 0
	
	vel.x = speed*direction
	
	vel.y += gravity*delta
	
	if vel.y > 0:
		vel.y += gravity * delta * fallMultiplier
	elif vel.y < 0 and Input.is_action_just_released("jump"):
		vel.y += gravity * delta * lowJumpMultiplier
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jump_force
	
	vel = move_and_slide(vel, Vector2.UP)
		
	
