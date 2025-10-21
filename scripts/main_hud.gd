# scripts/hud.gd
extends CanvasLayer

@onready var fps_label: Label   = $MarginContainer/HBoxContainer/FPS
@onready var ver_label: Label   = $MarginContainer/HBoxContainer/Version
@onready var coins_label: Label = $MarginContainer/HBoxContainer/Coins   # ← 新增

func _ready() -> void:
	# 现有代码…
	ver_label.text = "%s | %s" % [Globals.VERSION, Globals.build_time]
	coins_label.text = "Coins: %d" % Globals.coins                      # ← 初始化
	Globals.coin_collected.connect(_on_coin_collected)                  # ← 监听全局信号

func _process(_delta: float) -> void:
	fps_label.text = "FPS: %d" % int(Engine.get_frames_per_second())

func _on_coin_collected(_amount: int) -> void:                          # ← 新增
	coins_label.text = "Coins: %d" % Globals.coins
