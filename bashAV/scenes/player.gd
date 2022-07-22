extends KinematicBody

export(NodePath) var player
export(int) var _speed = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_leftStick_playerMove(dir):
	dir += Vector3.DOWN * _speed
	move_and_slide(dir)
	pass # Replace with function body.


func _on_rightStick_playerMove(dir):
	
	pass # Replace with function body.
