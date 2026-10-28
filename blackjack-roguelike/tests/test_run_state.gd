extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RunState.hp_changed.connect(on_hp_changed)
	RunState.take_damage(30)
	RunState.take_damage(500)
	RunState.flags.append("mystery_drink")
	print("has flag: ", RunState.has_flag("mystery_drink"))
	print("doesn't have flag: ", RunState.has_flag("nope"))
	RunState.reset_run()
	print("hp after reset: ", RunState.hp, " || flags: ", RunState.flags)
	

func on_hp_changed(hp, max_hp) -> void:
	print("hp changed: ", hp, "/", max_hp)
