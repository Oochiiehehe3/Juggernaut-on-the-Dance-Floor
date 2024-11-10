extends AudioStreamPlayer

@export var beats: RhythmNotifier

enum Songs {BEATDOWN, EXONE, EXTWO}
var current_song: Songs = Songs.BEATDOWN
var bpms = [130, 100, 240]

# Called when the node enters the scene tree for the first time.
func _ready():
	beats.bpm = bpms[current_song]
	print(beats.bpm)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_rhythm_notifier_beat(current_beat: int) -> void:
	pass # Replace with function body.
