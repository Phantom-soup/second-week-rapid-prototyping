extends CharacterBody2D

signal hit
@export var speed = 300.0
@export var gravity = 100


func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("flip"):
		gravity *= -1
	position += velocity * speed * delta
	if !is_on_floor() or !is_on_ceiling():
		position.y += gravity * delta
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name.begins_with("kill"):
		hide()
