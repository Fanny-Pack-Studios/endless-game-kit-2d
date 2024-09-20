@tool
class_name Guard extends NPC

@export var npc_name: String = "Guard"
@export var item_i_need: Item.Type
@export var direction_i_move_to: Direction

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
			"No podes pasar hasta que me des un %s" % Item.name_of(item_i_need)
		)
		if(Inventory.has(item_i_need)):
			var chosen_item = await Inventory.choose_item()
			if(chosen_item == item_i_need):
				has_it_already_moved_out_of_the_way = true
				Inventory.remove_item(chosen_item)
				
				await Dialogue.say_line(
					npc_name,
					"Gracias, me corro del camino"
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
