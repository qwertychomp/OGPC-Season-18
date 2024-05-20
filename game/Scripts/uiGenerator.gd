extends Node2D

var keybindConfig:JSON
#this variable controls the distance between each entry in the keybind menu
var keybindEntryPadding = 20
#this variable controls the distance between each element in an entry
var keybindEntryElementPadding 
func _ready():
	#read the json file and parse it into a tree
	var jsonFile = FileAccess.open("res://defaultUserData/keybinds.json",FileAccess.READ)
	keybindConfig.parse(jsonFile.get_as_text())
func generateUIElements():
	for x in keybindConfig["keybinds"].size():
		var newText
func _process(delta):
	pass
