extends Node2D

var speed = Vector2(2,0)
var end_spot = Vector2(574,440)

var health = 10

var hittin = false

var damage = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    global_position += speed.rotated(global_position.angle_to_point(end_spot))
    if end_spot.x > global_position.x:
        $Sprite2D.flip_h = true
    if hittin:
        print("oof")
        health -= damage
    if health < 0:
        queue_free()


func _on_area_2d_area_entered(area):
    if area.get_parent().type == "beam":  
        hittin = true
        damage = area.get_parent().damage
    else:
        health -= area.get_parent().damage
    pass # Replace with function body.


func _on_area_2d_area_exited(area):
    hittin = false
    pass # Replace with function body.
