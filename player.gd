extends CharacterBody2D


@export var speed: float = 500.0

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = $Direction/ActionableFinder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
			

func movement():
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("forwards", "backwards")

	if direction_x:
		velocity.x = direction_x * speed
		if direction_x > 0:
			$AnimationPlayer.play("walk_right")
		elif direction_x < 0:
			$AnimationPlayer.play("walk_left")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if direction_y:
		velocity.y = direction_y * speed
		if direction_y > 0:
			$AnimationPlayer.play("walk_down")
		elif direction_y < 0:
			$AnimationPlayer.play("walk_up")
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
	

func _physics_process(delta):
	movement()
