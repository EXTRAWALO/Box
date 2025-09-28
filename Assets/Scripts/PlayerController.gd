extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -40.0
var direction = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event):
	# Handle jump.
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:           
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	# Apply movement
	move_and_slide()

	# 🔹 Kill player if Y is too low (fell off the level)
	if position.y > 700: # adjust this number to your level size
		die()

func die():
	print("Player died!")  # Debug
	get_tree().reload_current_scene() # Restart the level


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Rigidbody"):
		body.collision_layer=1
		body.collision_mask=1

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Rigidbody"):
		body.collision_layer=2
		body.collision_mask=2
