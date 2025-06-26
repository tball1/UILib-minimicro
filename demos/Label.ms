import "engine"

Label = engine.Label

//Labels are kind of like StaticFrames, but theres text on them.
//Because labels provide nothing special they don't need to be un UILoop

myLabel = new Label
myLabel.text = "Hello, world!"

myLabel.x = 960/2
myLabel.y = 640/2

myLabel.color = color.orange
myLabel.textcolor = color.black

myLabel.width = 300
myLabel.height = 30

myLabel.draw
