extends Solid

onready var tween := $Tween
onready var start := global_position
onready var follow := global_position
onready var interaction_box := $InteractionBox

export var offset := Vector2.ZERO
export var time := 2.0
export var delay := 1.0



func _ready() -> void:
	init_tween()


func init_tween():
	tween.interpolate_property(self, "follow", start, start + offset, time, Tween.TRANS_QUAD, Tween.EASE_IN_OUT, delay)
	tween.interpolate_property(self, "follow", start + offset, start, time, Tween.TRANS_QUAD, Tween.EASE_IN_OUT, time + 2*delay)
	tween.repeat = true
	tween.connect("tween_step", self, "on_tween_step")


func on_tween_step(object, key, elapsed, value):
	move_x(follow.x - (global_position.x + remainder.x))
	move_y(follow.y - (global_position.y + remainder.y))






