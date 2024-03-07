extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumps = 0
var max_jumps = 2 # Set the maximum number of jumps.

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

		
	else:
		jumps = 0 

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jumps < max_jumps:
		velocity.y = JUMP_VELOCITY
		jumps += 1
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		if is_on_floor():
			$PlayerSprite.play("run")
			
		velocity.x = direction * SPEED
		$PlayerSprite.flip_h = direction < 0
	else:
		if is_on_floor():
			$PlayerSprite.play("idle")

		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.y < 0:
			if (jumps == 2):
					$PlayerSprite.play("double_jump")
			else:
				$PlayerSprite.play("jump_up")
	elif velocity.y > 0:
			$PlayerSprite.play("jump_down")
			
	move_and_slide()
