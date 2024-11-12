extends CharacterBody2D

func _process(_delta: float) -> void:
	z_index = int(position.y/32)

func _physics_process(_delta: float) -> void:
	pass
