extends Node3D


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.pressed:
		print("Botón tocado")
		get_tree().change_scene_to_file("res://escenas/casa interior.tscn")
	if event is InputEventMouseButton and event.pressed:
		print("hola")
		get_tree().change_scene_to_file("res://escenas/casa interior.tscn")
		

func _on_cruce_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://escenas/Interior_cruce.tscn")

func _on_escuela_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://escenas/escuela_interior.tscn")

func _on_edificio_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://escenas/edificio_interior.tscn")
