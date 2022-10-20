extends Label


func _on_Game_points_change(points):
	print("desde label")
	var point=str(points)
	text = "Points: "+point
