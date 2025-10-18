# scripts/player.gd  (Godot 4.x)
extends CharacterBody2D

@export var move_speed: float = 120.0
@export var jump_speed: float = 260.0
@export var gravity: float = 900.0
@export var max_fall_speed: float = 800.0
@export var coyote_time: float = 0.08       # 落地后容错时间
@export var jump_buffer: float = 0.10       # 提前按跳的缓冲

var _coyote_timer := 0.0
var _jump_buffer_timer := 0.0

func _physics_process(delta: float) -> void:
	# 水平移动
	var dir := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = dir * move_speed

	# 重力与最大下落
	if not is_on_floor():
		velocity.y = min(velocity.y + gravity * delta, max_fall_speed)
		_coyote_timer = max(_coyote_timer - delta, 0.0)
	else:
		_coyote_timer = coyote_time
		if absf(velocity.y) > 0.0:
			velocity.y = 0.0

	# 跳跃输入缓冲
	if Input.is_action_just_pressed("jump"):
		_jump_buffer_timer = jump_buffer
	else:
		_jump_buffer_timer = max(_jump_buffer_timer - delta, 0.0)

	# 满足条件就起跳
	if _jump_buffer_timer > 0.0 and _coyote_timer > 0.0:
		velocity.y = -jump_speed
		_jump_buffer_timer = 0.0
		_coyote_timer = 0.0

	move_and_slide()
