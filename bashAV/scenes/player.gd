extends KinematicBody

export(NodePath) var player
export(int) var _walk_speed = 50
export(int) var _rotate_speed = 0.5
export(int) var _gravity_strength = 1
export(Vector3) var gravity = Vector3.DOWN * _gravity_strength

var _player_delta = 0
var _player_velocity = Vector3.ZERO
var velocity
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.
	
func _physics_process(delta):
	_player_delta = delta
	#always apply gravity i.e Vector3.DOWN
	move_player(Vector3.DOWN)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func move_player(dir):
	
	var local_direction = dir.rotated(Vector3(0,1,0), rotation.y)
	velocity = local_direction * (_walk_speed + _player_delta)
	
	velocity += gravity * _player_delta
	
	move_and_slide(velocity, Vector3.UP)
	
	if not is_on_floor():
		#velocity += Vector3.DOWN * gravity # _player_delta * gravity
		print("not on floor")
	else:
		print("on floor")
		print(get_floor_normal())
		
func _on_leftStick_playerMove(dir):
	move_player(dir)
	pass # Replace with function body.

func _on_rightStick_playerMove(dir):
	rotation -= Vector3(0, dir.x * (_player_delta * _rotate_speed), 0)
	pass # Replace with function body.
