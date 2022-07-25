extends KinematicBody

export(NodePath) var player
export(int) var walk_speed = 20
export(int) var rotate_speed = 0.5
export(int) var gravity_strength = 2
export(Vector3) var gravity = Vector3.DOWN * gravity_strength

var _player_delta = 0
var _player_velocity = Vector3.ZERO
var _player_dir = Vector3.DOWN
var velocity = Vector3.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.
	
func _physics_process(delta):
	_player_delta = delta
	#always apply gravity i.e Vector3.DOWN
	move_player(_player_dir, delta)
	$gun.translation = $gunPosition.translation
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func move_player(dir, delta):
	var local_direction = dir.rotated(Vector3.UP, rotation.y).normalized()
	$adam.translation = local_direction #Vector3(dir.z * -1, 0, dir.x)#dir.rotated(Vector3(0,1,0), rotation.z)
	
	velocity.y = gravity.y * gravity_strength
	velocity.z = local_direction.z * walk_speed
	velocity.x = local_direction.x * walk_speed
	
	velocity = move_and_slide(velocity, Vector3.UP)
			
func _on_leftStick_playerMove(dir):
	#move_player(dir, _player_delta)
	_player_dir = dir
	pass # Replace with function body.

func _on_rightStick_playerMove(dir):
	#rotate the player round using the dir, this rotates round the spring arm
	#probably want to do something with this
	#rotation -= Vector3(0, dir.x * (_player_delta * _rotate_speed), 0)
	#$gun.rotation = dir.rotated(Vector3(0,1,0), rotation.z) #rotation.y #dir.x #- rotation.x #Vector3(0, dir.x, 0)
	var local_direction = dir.rotated(Vector3.UP, rotation.y).normalized()
	$gunPosition.translation = local_direction #Vector3(dir.z * -1, 0, dir.x)#dir.rotated(Vector3(0,1,0), rotation.z)
	
	#$gunPosition.translation = Vector3(dir.z * -1, 0, dir.x)#dir.rotated(Vector3(0,1,0), rotation.z)
	
	pass # Replace with function body.
