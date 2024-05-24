extends Node2D

var keybindConfig:JSON
#this variable controls the distance between each entry in the keybind menu
var keybindEntryPadding:int = 20
#this variable controls the distance between each element in an entry
var keybindEntryElementPadding:int = 10

var startingLocationUIElements = Vector2(0,0)
#this variable determines whether or not the keybinds.json file has been read and turned into godot actions
var actionsLoaded:bool = false
func _ready():
	#read the json file and parse it into a tree
	var jsonFile = FileAccess.open("res://defaultUserData/keybinds.json",FileAccess.READ)
	keybindConfig.parse(jsonFile.get_as_text())
#generate actions from json file
func loadActions():
	for actionIterator in keybindConfig["keybinds"]:
		InputMap.add_action(keybindConfig["keybinds"][actionIterator]["actionName"])
		for eventIterator in keybindConfig["keybinds"][actionIterator]["key"].size():
			var inputEvent:InputEventKey = InputEventKey.new()
			inputEvent.physical_keycode = keybindConfig["keybinds"][actionIterator]["key"][eventIterator] 
			InputMap.action_add_event(keybindConfig["keybinds"][actionIterator]["actionName"],inputEvent)
func generateUIElements():
	if(!actionsLoaded):
		loadActions()
		actionsLoaded = true
	for actionIterator in keybindConfig["keybinds"].size():
		var newText = RichTextLabel.new()
		newText.text = keybindConfig["keybinds"][actionIterator]
		var newButtons = []
		for eventIterator in keybindConfig["keybinds"][actionIterator]["key"].size():
			newButtons.append(Button.new())
			newButtons[eventIterator].text = keybindConfig["keybinds"][actionIterator]["key"]
func _process(delta):
	pass
