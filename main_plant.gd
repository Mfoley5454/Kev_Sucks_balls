extends Node2D

var shot_speed = Vector2(20,0)
var time = 0

var bullets = 20
var charge = 100

var charge_start = false

# Called when the node enters the scene tree for the first time.
func _ready():
    $Level.text = str(Global.level)
    time = 0
    bullets = Global.previous_bullets + Global.gems_gotten
    charge = min(100,Global.previous_charge + 10*Global.batteries_gotten)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    time += delta
    $Label.text = str(floor(time))
    $Bullets2.text = str(bullets)
    if charge_start:
        charge -= 0.1
    $ProgressBar.value = charge
    if Input.is_action_just_pressed("Mb_Left") and bullets > 0:
        bullets -= 1
        $Shooter.create_shot($Flower.rotation,shot_speed,$Flower.global_position)
        
    if Input.is_action_just_pressed("Mb_Right") and charge > 0:
        charge_start = true
        $Shooter.create_beam($Flower.global_position,$Flower.rotation)
        
    if Input.is_action_just_released("Mb_Right"):
        charge_start = false
        
    if time >= 10+5*Global.level:
        Global.previous_bullets = bullets
        Global.previous_charge = charge
        get_tree().change_scene_to_file("res://main.tscn")
        


func _on_area_2d_area_entered(area):
    get_tree().change_scene_to_file("res://game_over.tscn")
    pass # Replace with function body.
