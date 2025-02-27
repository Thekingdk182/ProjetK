class_name State_Attack extends State

var attacking: bool = false
@export_range(1,20,0.5) var decelerate_speed: float = 5.0
@export var attack_sound : AudioStream
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var walk: State_Walk = $"../Walk"
@onready var idle: State_Idle = $"../Idle"
@onready var attack_anim: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@onready var hurt_box: HurtBox = %AttackHurtBox


func init() -> void:
	pass
func enter() -> void:
	player.update_animation("attack")
	attack_anim.play("attack_"+ player.anim_direction())
	animation_player.animation_finished.connect(end_attack)
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.7,1.4)
	audio.play()
		
	attacking = true
	
	await get_tree().create_timer(0.075).timeout
	
	hurt_box.monitoring = true
	pass
## What happens when the player exits  this state
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	
	hurt_box.monitoring = false
	pass
## What happens during the _process update in this state
func process(_delta:float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking ==false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
## What happens during the _physics process in this state
func physics( _delta:float)-> State:
	return null
## What happens whit input events in this state	
func handle_input( _event: InputEvent) -> State:
	return null
	
func end_attack(_newAnimName: String) -> void:
	attacking = false
