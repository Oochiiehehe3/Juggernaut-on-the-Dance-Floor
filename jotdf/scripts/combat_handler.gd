extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_detection_area_area_entered(area: Area2D) -> void:
	#print("detecting ", area)
	if area.owner == SaveData.player:
		SaveData.player.change_state(area.owner.States.COMBAT)
		#print("entering combat")

func _on_combat_area_area_exited(area: Area2D) -> void:
	if area.owner == SaveData.player:
		SaveData.player.change_state(area.owner.States.PEACE)
		#print("exiting combat")
