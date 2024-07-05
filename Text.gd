extends Node2D

@export var dialogueFile: Resource

@export var charSpeed = 0.03
@export var pauseSpeed = 0.2
@export var chunkLimit = 240

# Dialogue is a list of data items
var dialogueIndex = 0

# Data item text may be split to avoid overflow in text box
var segmentIndex = 0

# Chars animate into box
var charIndex = 0

# True if dialogue is in progress 
var dialogueInProgress = false

# True if characters are animating into text box
var charAnimationInProgress = false

# Stores the current dialogue
var full_dialogue = null
var currentText = null

# Time value since last event
var timer = 0

var textBox = null
var box = null
var textLabel = null

var punctuation = ".,?!:"

func _ready():
	# Get References
	textBox = get_parent()
	box = textBox.get_node("Box")
	textLabel = textBox.get_node("Box/RichTextLabel")
	
	# Set initial visibility
	box.visible = false

func _process(delta):
	if dialogueInProgress:
		if charAnimationInProgress:
			# On action key press, complete current line of dialogue immediatly
			if Input.is_action_just_pressed("action"):
				setVisibleCharacters(currentText.length())
				charAnimationInProgress = false

			else: # Advance the timer by one frame
				timer += delta

				var prevIndex = 0 if charIndex == 0 else charIndex - 1
				var timeLimit = pauseSpeed if punctuation.contains(currentText[prevIndex]) else charSpeed

				# On time limit, add a character, and maybe reach the end of this segment
				if timer >= timeLimit:
					timer = 0
					setVisibleCharacters(charIndex + 1)
					
					if charIndex == currentText.length():
						charAnimationInProgress = false
						print("charAnimationInProgress = false")
		else:
			# We get here when dialogue is in progress and characters are not animating
			# Thus an action key press should advance to the next segment or dialogue index
			pass

func reset():
	dialogueIndex = 0
	segmentIndex = 0
	charIndex = 0

func beginDialogue():
	dialogueInProgress = true
	reset()
	
	# Load JSON
	full_dialogue = dialogueFile.data
	
	# Display first data item
	displayData(full_dialogue[dialogueIndex])

func displayData(data):
	var text = chunkText(data["text"])
	currentText = text[segmentIndex]
	
	# Configure text to be 0 chars showing
	setVisibleCharacters(0)
	
	# Place text in box
	textLabel.set_text(currentText)
	
	# Show box
	box.visible = true
	
	# Begin displaying characters
	charAnimationInProgress = true

func chunkText(text):
	if text.length() <= chunkLimit:
		return [text]
	else:
		var words = text.split(" ")
		for word in words:
			print(word)

func setVisibleCharacters(value):
	charIndex = value
	textLabel.set_visible_characters(value)

func _on_body_entered(body):
	beginDialogue()
