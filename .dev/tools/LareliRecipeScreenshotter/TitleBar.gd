extends Control

var dragging = false
var drag_offset = Vector2()


func _ready():

    connect("gui_input", Callable(self, "_on_gui_input"))

func _on_gui_input(event):
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT:
            if event.pressed:
                dragging = true
                drag_offset = event.position
            else:
                dragging = false

    if event is InputEventMouseMotion and dragging:

        var new_position = Vector2i(get_window().position) + Vector2i(event.position) - Vector2i(drag_offset)
        var screen_size = DisplayServer.window_get_size(get_window().get_window_id())
        var taskbar_height = 10
        new_position.y = clamp(new_position.y, 0, screen_size.y - taskbar_height)
        get_window().position = new_position
