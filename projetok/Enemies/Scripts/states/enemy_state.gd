class_name EnemyState extends Node

var enemy : Enemy
var state_machine : EnemyStateMachine

func _init() -> void:
	pass
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func process(_delta) -> EnemyState:
	return null
	
func physics(_delta : float)-> EnemyState:
	return null
