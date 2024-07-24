extends Node2D

var gems = 0
var batteries = 0

var gem = load("res://gem.tscn")
var bat = load("res://battery.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    $Level.text = str(Global.level)
    $Player.connect("hit_path", end_worm)
    generate_gems_n_batteries()
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    $Body.make_part($Player.global_position)
    $Path.make_path($Player.global_position)
    pass
    
func end_worm():
    Global.gems_gotten = gems
    Global.batteries_gotten = batteries
    Global.level +=1
    get_tree().change_scene_to_file("res://main_plant.tscn")

    
func generate_gems_n_batteries():
    for i in range(20):
        var new_gem = gem.instantiate()
        new_gem.global_position = Vector2(randi_range(0,1100),randi_range(175,650))
        add_child(new_gem)
    for i in range(5):
        var new_bat = bat.instantiate()
        new_bat.global_position = Vector2(randi_range(0,1100),randi_range(175,650))
        add_child(new_bat)
    
