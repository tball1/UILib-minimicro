import "engine"

Textbox = engine.Textbox

//Textboxes are fields where the user can click, enter some text, and press enter to finish.
//Textboxes are an element that requires special logic to function, this is where UILoop comes in.

//"UILoop" is the function responsible for handling elements that provide fancy features such as a button
//See the GitHub README as it explains what all needs to be in there

myField = new Textbox


myField.x = 960/2
myField.y = 640/2

myField.text = "Banana" //This is default text (by default empty!)

myField.textcolor = color.white
myField.color = color.orange

myField.width = 300
myField.height = 30

//remember to call .draw!
//otherwise you won't see it
myField.draw

engine.UILoop [myField]