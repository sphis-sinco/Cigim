extends Node2D

var button_dialog_for = 0

var blockImagePath = "res://testblock.png"

@onready var fl_dlog = $FileDialog
@onready var sv_dlog = $SaveDialog
@onready var bk_dlog = $BlockDialog
@onready var bki_dlog = $BlockImageDialog
@onready var audioFade = $AudioStreamPlayer2D / AnimationPlayer
var enchant = preload("res://enchant.tres")
var cube = preload("res://cube.tscn")
var musicDisc5 = preload("res://music_disc_5.png")
var musicDisc13 = preload("res://music_disc_13.png")
var musicMuted = false

func _ready():
    fl_dlog.current_dir = OS.get_executable_path()
    sv_dlog.current_dir = OS.get_executable_path()
    bk_dlog.current_dir = OS.get_executable_path()
    bki_dlog.current_dir = OS.get_executable_path()
    audioFade.play("start")



func _process(delta):
    pass


func _on_leave_button_pressed():
    get_tree().quit()


func _on_file_dialog_file_selected(path):
    var image = Image.new()
    image.load(path)
    var texture = ImageTexture.new()
    texture.set_image(image)
    if button_dialog_for == 1:
        $Button1.texture_normal = texture
    elif button_dialog_for == 2:
        $Button2.texture_normal = texture
    elif button_dialog_for == 3:
        $Button3.texture_normal = texture
    elif button_dialog_for == 4:
        $Button4.texture_normal = texture
    elif button_dialog_for == 5:
        $Button5.texture_normal = texture
    elif button_dialog_for == 6:
        $Button6.texture_normal = texture
    elif button_dialog_for == 7:
        $Button7.texture_normal = texture
    elif button_dialog_for == 8:
        $Button8.texture_normal = texture
    elif button_dialog_for == 9:
        $Button9.texture_normal = texture
    elif button_dialog_for == 10:
        $Button10.texture_normal = texture




func _on_button_1_pressed():
    button_dialog_for = 1
    $FileDialog.visible = true

func _on_button_2_pressed():
    button_dialog_for = 2
    $FileDialog.visible = true

func _on_button_3_pressed():
    button_dialog_for = 3
    $FileDialog.visible = true

func _on_button_4_pressed():
    button_dialog_for = 4
    $FileDialog.visible = true

func _on_button_5_pressed():
    button_dialog_for = 5
    $FileDialog.visible = true

func _on_button_6_pressed():
    button_dialog_for = 6
    $FileDialog.visible = true

func _on_button_7_pressed():
    button_dialog_for = 7
    $FileDialog.visible = true

func _on_button_8_pressed():
    button_dialog_for = 8
    $FileDialog.visible = true

func _on_button_9_pressed():
    button_dialog_for = 9
    $FileDialog.visible = true

func _on_button_10_pressed():
    button_dialog_for = 10
    $FileDialog.visible = true

func _on_save_dialog_file_selected(path):
    $LeaveButton.hide()
    $ShootButton.hide()
    $BlockButton.hide()
    $MusicButton.hide()
    await RenderingServer.frame_post_draw
    var viewport = get_viewport()
    var img = viewport.get_texture().get_image()
    img.save_png(path)
    print("Image saved")
    $LeaveButton.show()
    $ShootButton.show()
    $BlockButton.show()
    $MusicButton.show()

func _on_block_dialog_file_selected(path):
    $LeaveButton.hide()
    $ShootButton.hide()
    $MusicButton.hide()
    $CraftingGrid.hide()
    $Button1.hide()
    $Button2.hide()
    $Button3.hide()
    $Button4.hide()
    $Button5.hide()
    $Button6.hide()
    $Button7.hide()
    $Button8.hide()
    $Button9.hide()
    $Button10.hide()
    $BlockButton.hide()
    var ins = cube.instantiate()
    var image = Image.new()
    image.load(blockImagePath)
    image.resize(16, 16, 4)
    var texture = ImageTexture.new()
    texture.set_image(image)
    for i in ins.get_children():
        i.texture = texture
    add_child(ins)
    await RenderingServer.frame_post_draw
    var region = Rect2(0, 0, 184, 144)
    var viewport = get_viewport()
    var img = viewport.get_texture().get_image().get_region(region)
    img.resize_to_po2(true, 4)
    img.save_png(path)
    print("Image saved")
    $LeaveButton.show()
    $ShootButton.show()
    $MusicButton.show()
    $CraftingGrid.show()
    $Button1.show()
    $Button2.show()
    $Button3.show()
    $Button4.show()
    $Button5.show()
    $Button6.show()
    $Button7.show()
    $Button8.show()
    $Button9.show()
    $Button10.show()
    $BlockButton.show()
    ins.queue_free()

func _on_shoot_button_pressed():
    sv_dlog.visible = true


func _on_button_1_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button1.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button1.material != null:
                    $Button1.set_material(null)
                else:
                    $Button1.set_material(enchant)
func _on_button_2_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button2.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button2.material != null:
                    $Button2.set_material(null)
                else:
                    $Button2.set_material(enchant)
func _on_button_3_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button3.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button3.material != null:
                    $Button3.set_material(null)
                else:
                    $Button3.set_material(enchant)
func _on_button_4_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button4.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button4.material != null:
                    $Button4.set_material(null)
                else:
                    $Button4.set_material(enchant)
func _on_button_5_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button5.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button5.material != null:
                    $Button5.set_material(null)
                else:
                    $Button5.set_material(enchant)
func _on_button_6_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button6.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button6.material != null:
                    $Button6.set_material(null)
                else:
                    $Button6.set_material(enchant)
func _on_button_7_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button7.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button7.material != null:
                    $Button7.set_material(null)
                else:
                    $Button7.set_material(enchant)
func _on_button_8_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button8.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button8.material != null:
                    $Button8.set_material(null)
                else:
                    $Button8.set_material(enchant)
func _on_button_9_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button9.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button9.material != null:
                    $Button9.set_material(null)
                else:
                    $Button9.set_material(enchant)
func _on_button_10_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            MOUSE_BUTTON_RIGHT:
                $Button10.texture_normal = null
            MOUSE_BUTTON_MIDDLE:
                if $Button10.material != null:
                    $Button10.set_material(null)
                else:
                    $Button10.set_material(enchant)



func _on_block_image_dialog_file_selected(path):
    blockImagePath = path
    $BlockDialog.show()


func _on_block_button_pressed():
    $BlockImageDialog.show()


func _on_music_button_pressed() -> void :
    $AudioStreamPlayer2D.stream_paused = not $AudioStreamPlayer2D.stream_paused
    if musicMuted == true:
        $MusicButton.texture_normal = musicDisc5
    else:
        $MusicButton.texture_normal = musicDisc13
    musicMuted = not musicMuted
