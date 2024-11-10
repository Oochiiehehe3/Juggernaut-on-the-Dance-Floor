extends Node2D

@export var up_detector: Area2D
@export var down_detector: Area2D
@export var left_detector: Area2D
@export var right_detector: Area2D

var up_blocked = false
var down_blocked = false
var left_blocked = false
var right_blocked = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print("up ", up_blocked, ", down ", down_blocked, ", left ", left_blocked, ", right ", right_blocked)
	pass


func _on_up_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	up_blocked = true


func _on_down_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	down_blocked = true

func _on_left_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	left_blocked = true


func _on_right_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	right_blocked = true


func _on_up_body_shape_exited(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	up_blocked = false


func _on_down_body_shape_exited(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	down_blocked = false


func _on_left_body_shape_exited(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	left_blocked = false


func _on_right_body_shape_exited(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	right_blocked = false
