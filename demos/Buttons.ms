import "engine"

Button = engine.Button

//Buttons are elements the user can click and have something happen as a result
//This is another element that provides special functionality and needs to be in UILoop

myButton = new Button

//This will be called should our button be pressed
myButton.onClick = function
	print "I was clicked"
end function

myButton.text = "Click me" //Button text
myButton.textcolor = color.black //Button text color

myButton.color = color.orange //Button background color

myButton.width = 300
myButton.height = 30

//Button positioning
myButton.x = 960/2
myButton.y = 640/2

//Draw it onto the screen
myButton.draw

engine.UILoop [myButton]

