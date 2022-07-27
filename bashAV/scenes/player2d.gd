extends KinematicBody2D

export(int) var walk_speed = 10

var player_dir = Vector2.ZERO

var velocity = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	move_player(player_dir, delta)


func move_player(dir, delta):
	
	velocity.y = dir.y * walk_speed
	velocity.x = dir.x * walk_speed
	
	velocity = move_and_slide(velocity)


func _on_leftStick_playerMove(dir):
	player_dir = dir
	pass # Replace with function body.


func _on_rightStick_playerMoveAxis(dir):

	pass # Replace with function body.
