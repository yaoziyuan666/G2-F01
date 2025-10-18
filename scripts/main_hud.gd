# scripts/hud.gd
extends CanvasLayer

@export var version: String = "v0.0.1-F01"

@onready var fps_label: Label = $MarginContainer/HBoxContainer/FPS
@onready var ver_label: Label = $MarginContainer/HBoxContainer/Version

var build_time: String

func _ready() -> void:
	# 记录一次构建时间（运行时近似值；Day 6 会改为读取 build.txt）
	build_time = Time.get_datetime_string_from_system()
	ver_label.text = "%s | %s" % [version, build_time]

func _process(_delta: float) -> void:
	fps_label.text = "FPS: %d" % int(Engine.get_frames_per_second())
