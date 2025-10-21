# scripts/coin.gd — Godot 4.5
extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var sfx: AudioStreamPlayer2D = $SFX
@onready var burst := $Burst
@onready var shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	anim.play("idle")
	monitoring = true
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player" or body.is_in_group("player") or body is CharacterBody2D:
		# 计数
		Globals.add_coins(1)
		# 视觉/听觉反馈
		anim.visible = false
		if shape: shape.disabled = true
		if burst: burst.emitting = true
		if sfx: sfx.play()
		# 等一小会儿再删除（优先等待音效结束，如无则等 0.25s）
		if sfx and sfx.stream:
			await sfx.finished
		else:
			await get_tree().create_timer(0.25).timeout
		queue_free()
