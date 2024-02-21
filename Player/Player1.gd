extends RigidBody2D

#Consts
const SPEED = 4
const JUMP_VEL = -4
const GRAVITY = 4

#Vars
var is_on_floor = false
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $RayCast2D.is_colliding():
		is_on_floor = true
	print(is_on_floor)
	
	# Handle Jump
	#if Input.is_action_pressed("1up") and is_on_floor == true:
	#	velocity.y = JUMP_VEL

	#Handle movement
	if is_on_floor == true:
		var direction = Input.get_axis("1left", "1right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	#else:
		#velocity.y += GRAVITY
		
	#move_and_collide(velocity)
