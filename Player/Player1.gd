extends RigidBody2D

#Consts
const SPEED = 175
@export var JUMP_VEL = 4
@export var GRAVITY = 6

#Vars
var is_on_floor = false
#var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if $floorCheck.body_entered:
		is_on_floor = true
	if $floorCheck.body_exited:
		is_on_floor = false
	print(is_on_floor)
	
	if Input.is_action_pressed("1right") and is_on_floor:
		apply_central_impulse(Vector2(SPEED, 0))
	if Input.is_action_pressed("1left") and is_on_floor:
		apply_central_impulse(Vector2(-SPEED, 0))
	
	
