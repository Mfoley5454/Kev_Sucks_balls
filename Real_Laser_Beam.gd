extends Node2D
var start_point = Vector2(0,0)


func inity(rot):
    var end = Vector2(100000,0).rotated(rot)



func _process(delta):
    $RayCast2D.target_position = (get_global_mouse_position()-global_position)*1000
    if $RayCast2D.is_colliding():
        $Line2D.set_point_position(1,$RayCast2D.get_collision_point()-global_position)
        $CPUParticles2D.position = $RayCast2D.get_collision_point()-global_position
        $CPUParticles2D.rotation = $RayCast2D.get_collision_point().angle_to_point(global_position)
    if Input.is_action_just_released("Mb_Right"):
        queue_free()
