extends RigidBody2D

#Consts
const SPEED = 175
const JUMP_VEL = -1000
#const GRAVITY = 6

#Vars
var is_on_floor = false
var can_double_jump = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	#print(jump_count)
	if Input.is_action_pressed("2right") and is_on_floor:
		apply_central_impulse(Vector2(SPEED, 0))
	if Input.is_action_pressed("2left") and is_on_floor:
		apply_central_impulse(Vector2(-SPEED, 0))
	
	if Input.is_action_pressed("2up") and is_on_floor == true:
		apply_central_impulse(Vector2(linear_velocity.y, JUMP_VEL))
	elif Input.is_action_pressed("2up") and can_double_jump == true:
		apply_central_impulse(Vector2(linear_velocity.y, JUMP_VEL))
		can_double_jump == false


func _on_floor_check_body_entered(body):
	can_double_jump
	is_on_floor = true


func _on_floor_check_body_exited(body):
	is_on_floor = false


