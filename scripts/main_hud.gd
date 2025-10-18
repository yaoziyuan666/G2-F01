# scripts/hud.gd
extends CanvasLayer

@onready var fps_label: Label = $MarginContainer/HBoxContainer/FPS
@onready var ver_label: Label = $MarginContainer/HBoxContainer/Version

func _ready() -> void:
	# 从全局单例读取
	ver_label.text = "%s | %s" % [Globals.VERSION, Globals.build_time]

func _process(_delta: float) -> void:
	fps_label.text = "FPS: %d" % int(Engine.get_frames_per_second())
