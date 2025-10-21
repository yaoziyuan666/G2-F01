# scripts/Globals.gd  (Godot 4)
extends Node

# 统一版本号（后续项目递增）
const VERSION := "v0.0.1-F01"

# 构建时间（Day 6 会改为严格从 build.txt 读取；现在先占位）
var build_time: String = ""

signal coin_collected(amount: int)

var coins: int = 0

func _ready() -> void:
	# 若存在 build.txt（res://build.txt），优先读取其文本作为构建信息
	if FileAccess.file_exists("res://build.txt"):
		var f := FileAccess.open("res://build.txt", FileAccess.READ)
		build_time = f.get_as_text().strip_edges()
		f.close()
	else:
		# 占位：运行时系统时间
		build_time = Time.get_datetime_string_from_system()

	# 可选：把版本写入 ProjectSettings 以便其它地方读取
	ProjectSettings.set_setting("application/config/version", VERSION)
	
func add_coins(n: int = 1) -> void:
	coins += n
	emit_signal("coin_collected", n)
