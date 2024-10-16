extends CharacterBody2D

@export var player: Player;

@export var SPEED: int = 350;
@export var idleTimerTime: float = 4;

@export var litersOfSpookiness: float = 10; 

var state: STATE;

@export var waypoints: Array[Marker2D] = [];
@onready var idleTimer: Timer = $IdleTimer;

enum STATE {
	IDLE,
	FLEEING,
}

func _physics_process(delta):
	match state:
		STATE.IDLE:
			idle()
		STATE.FLEEING:
			fleeing()
			
	move_and_slide()
	
func _on_flee_area_body_entered(body):
	if body is Player:
		state = STATE.FLEEING

func _on_flee_area_body_exited(body):
	if body is Player:
		idleTimer.start(idleTimerTime)
		
func _on_timer_timeout():
	state = STATE.IDLE
	position = waypoints.pick_random().position 
	
func idle():
	velocity = Vector2.ZERO
	
	
func fleeing():
	velocity = player.position.direction_to(position) * SPEED
