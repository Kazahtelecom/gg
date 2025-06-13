extends Timer
@export var Audio_stream_player_2B: AudioStreamPlayer2D

func _on_timeout() -> void:
	Audio_stream_player_2B.play()
