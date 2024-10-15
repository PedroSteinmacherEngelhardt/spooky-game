extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var camera : Camera2D = $Camera2D


func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))
	
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED / 5)

	move_and_slide()
	var mouse_dist = Vector2.ZERO.distance_to(get_global_mouse_position())
	
	var mouse_dir = global_position.direction_to(get_global_mouse_position())
	rotation = mouse_dir.angle()
	
	if Input.is_action_pressed("click"):
		$Lantern.enabled = true
		camera.offset = camera.offset.move_toward(mouse_dir * 700,2500*delta)
	else:
		$Lantern.enabled = false
		camera.offset = camera.offset.move_toward(Vector2.ZERO ,2500*delta)
