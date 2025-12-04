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



func _process(_delta):
	pass


func _on_leave_button_pressed():
	get_tree().quit()


func _on_file_dialog_file_selected(path):
	var image = Image.new()
	image.load(path)
	var texture = ImageTexture.new()
	texture.set_image(image)
	if button_dialog_for == 1:
		$Input.texture_normal = texture
	elif button_dialog_for == 2:
		$Modifier.texture_normal = texture
	elif button_dialog_for == 3:
		$Output.texture_normal = texture

func _on_button_1_pressed():
	button_dialog_for = 1
	$FileDialog.visible = true

func _on_button_2_pressed():
	button_dialog_for = 2
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
	$Input.hide()
	$Modifier.hide()
	$Output.hide()
	$BlockButton.hide()
	var ins = cube.instantiate()
	var image = Image.new()
	image.load(blockImagePath)
	image.resize(16, 16, 4 as Image.Interpolation)
	var texture = ImageTexture.new()
	texture.set_image(image)
	for i in ins.get_children():
		i.texture = texture
	add_child(ins)
	await RenderingServer.frame_post_draw
	var region = Rect2(0, 0, 184, 144)
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image().get_region(region)
	img.resize_to_po2(true, 4 as Image.Interpolation)
	img.save_png(path)
	print("Image saved")
	$LeaveButton.show()
	$ShootButton.show()
	$MusicButton.show()
	$CraftingGrid.show()
	$Input.show()
	$Modifier.show()
	$Output.show()
	$BlockButton.show()
	ins.queue_free()

func _on_shoot_button_pressed():
	sv_dlog.visible = true


func _on_button_1_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				$Input.texture_normal = null
			MOUSE_BUTTON_MIDDLE:
				if $Input.material != null:
					$Input.set_material(null)
				else:
					$Input.set_material(enchant)
func _on_button_2_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				$Modifier.texture_normal = null
			MOUSE_BUTTON_MIDDLE:
				if $Modifier.material != null:
					$Modifier.set_material(null)
				else:
					$Modifier.set_material(enchant)
func _on_button_10_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				$Output.texture_normal = null
			MOUSE_BUTTON_MIDDLE:
				if $Output.material != null:
					$Output.set_material(null)
				else:
					$Output.set_material(enchant)



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
