class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle : State = $"../Idle"
@onready var attack: State = $"../Attack"


func init() -> void:
	pass
func enter() -> void:
	player.update_animation("walk")
	pass
## What happens when the player exits  this state
func exit() -> void:
	pass
## What happens during the _process update in this state
func process(_delta:float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
	
	return null
## What happens during the _physics process in this state
func physics( _delta:float)-> State:
	return null
## What happens whit input events in this state	
func handle_input( _event: InputEvent) -> State:
	if _event.is_action_pressed("Attack"):
		return attack
	return null
