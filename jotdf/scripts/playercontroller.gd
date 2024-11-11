extends CharacterBody2D

@export var move_detection: Node2D

enum States {PEACE, COMBAT}
enum CombatTypes {INTERACTION, EVASION, PUZZLE}
@export var current_state: States
var current_combat_type: CombatTypes = CombatTypes.INTERACTION

var music_player: AudioStreamPlayer

const SPEED = 125.0
var can_move = true

func ready():
	pass

func _physics_process(delta):
	
	velocity = Vector2.ZERO
	
	if current_state == States.COMBAT and can_move: #If there are enemies nearby, use tile-based movement
		if current_combat_type != CombatTypes.PUZZLE:
			if Input.is_action_pressed("Left"):
				#move can_move set out here in order to block holding down the keys
				if move_detection.left_blocked == false and check_beat() == true:
					can_move = false
					position.x -= 64
			elif Input.is_action_pressed("Right"):
				if move_detection.right_blocked == false and check_beat() == true:
					can_move = false
					position.x += 64
			elif Input.is_action_pressed("Up"):
				if move_detection.up_blocked == false and check_beat() == true:
					can_move = false
					position.y -= 64
			elif Input.is_action_pressed("Down"):
				if move_detection.down_blocked == false and check_beat() == true:
					can_move = false
					position.y += 64
			
	elif current_state == States.PEACE: #If there are no enemies around, switch to smooth movement
		if Input.is_action_pressed("Up"):
			velocity.y -= 1
		if Input.is_action_pressed("Down"):
			velocity.y += 1
		if Input.is_action_pressed("Left"):
			velocity.x -= 1
		if Input.is_action_pressed("Right"):
			velocity.x += 1
		
		if velocity.length() > 0:
			
			velocity = velocity.normalized() * SPEED # This makes velocity normalized and prevents from making diagonals twice as fast as walking in a main cardinal direction
		position += velocity * delta
		
		# input directions and walking
		var _input_direction = Vector2(
			Input.get_action_strength("Right") - Input.get_action_strength("Left"),
			Input.get_action_strength("Down") - Input.get_action_strength("Up"))
		
		move_and_slide()
		
func check_beat():
	if music_player.time_since_beat > music_player.beats.beat_length*0.75:
		#print("on beat")
		return true
	else:
		#print("bad timing")
		return false
		
func beat_reset():
	can_move = true