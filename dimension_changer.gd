extends Node2D

var currentDimension : int = 0

onready var normal = get_node("Normal")
onready var monochrome = get_node("Monochrome")
onready var inverted = get_node("Inverted")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("change_dimension"):
		currentDimension+=1
		currentDimension=currentDimension%3
		
	normal.hide()
	monochrome.hide()
	inverted.hide()
	
	if(currentDimension == 0):
		normal.show()
	elif(currentDimension == 1):
		monochrome.show()
	else:
		inverted.show()
	
	normal.set_process(currentDimension == 0)
	monochrome.set_process(currentDimension == 1)
	inverted.set_process(currentDimension == 2)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

