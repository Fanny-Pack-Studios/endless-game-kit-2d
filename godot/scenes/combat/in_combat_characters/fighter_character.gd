class_name FighterCharacter extends Resource

@export var hp: int = 200
@export var attack_power: int = 75
@export_file("*combat_sprite.tscn") var _combat_sprite: String
@export var minigames: Array[MiniGame] = []

func combat_sprite() -> CombatSprite:
	return load(_combat_sprite).instantiate()
