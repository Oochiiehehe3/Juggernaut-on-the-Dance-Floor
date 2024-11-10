extends AudioStreamPlayer

@export var beats: RhythmNotifier
@export var beat_timer: Timer
@export var player: CharacterBody2D

enum Songs {BEATDOWN, EXONE, EXTWO}
var current_song: Songs = Songs.BEATDOWN
var bpms = [130, 100, 240]

var time_since_beat = 0
var beat_margin = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	player.music_player = self
	beats.bpm = bpms[current_song]
	beat_timer.wait_time = beats.beat_length
	play()
	beat_timer.start()
	#print(beats.bpm)
	
func change_song(song, stream_path):
	current_song = song
	stream = stream_path
	beats.bpm = bpms[current_song]
	beat_timer.wait_time = beats.beat_length
	time_since_beat = beats.beat_length*0.75
	beat_margin = beats.beat_length*0.75
	play()
	beat_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing:
		time_since_beat += delta


func _on_rhythm_notifier_beat(_current_beat: int) -> void:
	await get_tree().create_timer(beats.beat_length*0.25).timeout
	time_since_beat = 0
	if player != null:
		player.beat_reset()


func _on_timer_timeout() -> void:
	#print(beat_timer.wait_time)
	pass
