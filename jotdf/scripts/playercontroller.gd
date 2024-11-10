extends CharacterBody2D

enum States {PEACE, COMBAT}
enum CombatTypes {INTERACTION, EVASION, PUZZLE}
var current_state: States
var current_combat_type: CombatTypes

const SPEED = 300.0

func _physics_process(_delta):
	pass
