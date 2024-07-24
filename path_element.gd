extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
    $Timer.start(0.3)
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_timer_timeout():
    $Area2D/CollisionShape2D.disabled = false
    pass # Replace with function body.
