extends Node

# thanks to Ombarus - https://www.youtube.com/watch?v=EmQBLxxPV3E

# Input handler for both left and right thumbsticks - one controller to rule them all
# ?? use a signal to connect input to other scripts? is this a good idea?

#axis handling breaks the looseness of this function, should be able to update
# the constants for JOY_AXIS_x...

signal playerMove
signal playerMoveAxis

export(String) var input_up = "move_forward"
export(String) var input_down = "move_backward"
export(String) var input_left = "move_left"
export(String) var input_right = "move_right"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	var axisUD = -Input.get_action_strength(input_up) + Input.get_action_strength(input_down)
	var axisLR = -Input.get_action_strength(input_left) + Input.get_action_strength(input_right)

	emit_signal("playerMove", Vector2( axisLR, axisUD))
	
	var xAxisRL = Input.get_joy_axis(0, JOY_AXIS_2)
	var yAxisUD = Input.get_joy_axis(0, JOY_AXIS_3)
	
	emit_signal("playerMoveAxis", Vector2(-xAxisRL, yAxisUD))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

