import "engine"

DraggableFrame = engine.DraggableFrame
Label = engine.Label // see label.ms

//DraggableFrames are frames that can be dragged by the user
//DraggableFrames provide extra functionality and needs to be in UILogic


myFrame = new DraggableFrame

myLabel = new Label
myLabel.text = "Hi" //label text

myLabel.color = color.aqua //label background color
myLabel.textcolor = color.black //label text color

//label width and height
myLabel.width = 50
myLabel.height = 30

//'paint' is a special function that's called after the window is redrawn
//you might want this so you can attach buttons and other elements onto the frame
myFrame.paint = function()
	//'self' being our frame
	myLabel.x = self.x+(self.width/2)
	myLabel.y = self.y+(self.height/2)
	myLabel.draw
	yield //will be glitchy otherwise!
end function

myFrame.color = color.orange //frame background color

//frame positioning
myFrame.x = 960/2
myFrame.y = 640/2

//frame width and height
myFrame.width = 300
myFrame.height = 300


//draw the frame initially
//UILoop will redraw it should the user move it
myFrame.draw

//draw any potential attached elements onto the frame initially
//if you did not define a paint function you don't need this
myFrame.paint

engine.UILoop [myFrame]