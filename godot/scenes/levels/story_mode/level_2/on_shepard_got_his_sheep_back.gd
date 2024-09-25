extends Node2D


func _on_shepard_traded_successfully():
	$"../StolenSheepBackToShepard".visible = true
