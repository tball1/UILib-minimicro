import "engine"

//StaticFrames are just that.. a static frame with no special features

StaticFrame = engine.StaticFrame

myFrame = new StaticFrame

//position of our frame
myFrame.x = 960/2
myFrame.y = 640/2

//size of our frame
myFrame.width = 300
myFrame.height = 300

myFrame.color = color.orange //background color
myFrame.textcolor = color.white //text color

//you must call draw on your elements!
//this goes for everything in the library
myFrame.draw
