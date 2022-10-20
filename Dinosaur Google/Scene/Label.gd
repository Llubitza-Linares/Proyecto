extends Label


func _on_Dinosaur_points_change(points):
	print("desde label")
	var p="%05d"%[points]
	var point=str(p)
	text = "Points: "+point
