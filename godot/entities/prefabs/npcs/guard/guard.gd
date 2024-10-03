@tool
class_name Guard extends NPC

@export var item_i_need: Item.Type
@export var amount_i_need: int
@export var direction_i_move_to: Direction
@export_multiline var request_item_line: String = "No podes pasar hasta que me des: "
@export_multiline var thank_you_line: String = "Gracias, me corro del camino"

var has_it_already_moved_out_of_the_way: bool = false

enum Direction {
	Up,
	Down,
	Left,
	Right
}

func interact_with(player):
	if(has_it_already_moved_out_of_the_way):
		await Dialogue.say_line(npc_name, "Adelante")
	else:
		await Dialogue.say_line(
			npc_name,
			request_item_line
		)
		if(not Inventory.is_empty()):
			var chosen_item = await Inventory.choose_item()
			if(chosen_item == item_i_need):
				if(Inventory.amount_of(chosen_item) >= amount_i_need):
					has_it_already_moved_out_of_the_way = true
					for i in range(0, amount_i_need):
						Inventory.remove_item(chosen_item)
					
					await Dialogue.say_line(
						npc_name,
						thank_you_line
					)
					var animation_player = $AnimationPlayer
					match direction_i_move_to:
						Direction.Up:
							animation_player.play("move_up")
						Direction.Down:
							animation_player.play("move_down")
						Direction.Left:
							animation_player.play("move_left")
						Direction.Right:
							animation_player.play("move_right")
				else:
					await Dialogue.say_line(
						npc_name,
						"Eso no es %s, es %s" % [
							Item.english_name_of(item_i_need),
							Item.english_name_of(chosen_item)
						]
					)
