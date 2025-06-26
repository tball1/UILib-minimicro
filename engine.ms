Object = {}
Object.x = 0
Object.y = 0
Object.width = 0
Object.lineWidth = 4
Object.height = 0
Object.color = color.white

Object.collides = function(obj2)
	
	colliding = not (self.x + self.width < obj2.x or self.x > obj2.x + obj2.width or self.y + self.height < obj2.y or self.y > obj2.y + obj2.height)
	return colliding
end function

Object.draw = function(filled=1,obj=null)
	if obj then
		self = obj
	end if
	if filled then
		gfx.fillRect(self.x,self.y,self.width,self.height,self.color)
	else
		gfx.drawRect(self.x,self.y,self.width,self.height,self.color, self.lineWidth)
	end if
end function

Button = {"__isa":Object}
Button.visible = true
Button.draw = function(filled=1)
	if self.visible then
		Object.draw(filled,self)
		gfx.print(self.text,self.x,self.y+(self.height/4),self.textcolor)
	end if
end function

Label = {"__isa":Object}
Label.visible = true
Label.draw = function(filled=1)
	if self.visible then
		Object.draw(filled,self)
		gfx.print(self.text,self.x,self.y+(self.height/4),self.textcolor)
	end if
end function

StaticFrame = {"__isa":Object}

DraggableFrame = {"__isa":Object}

Textbox = {"__isa":Object}
Textbox.text = ""
Textbox.visible = true
Textbox.textcolor = color.white

Textbox.draw = function(filled=1)
	if self.visible then
		Object.draw(filled,self)
		gfx.print(self.text,self.x,self.y+(self.height/4),self.textcolor)
	end if
end function

Textbox.focus = function()
	while true
		if key.available then
			k = key.get
			if k.code == 8 then
				self.text = self.text[:self.text.len-1]
				self.draw
				continue
			end if
			
			if k.code == 10 then
				break
			end if
			
			self.text = self.text + k
			self.draw
		end if
	end while
end function




clear

//Mouse object, this is required because the base mouse does not provide width,height.
//The values here are guesses and just what seemed good to me
m = new Object
m.width = 15
m.height = 15
//PART OF LIBRARY DONT REMOVE ^^




globals.breakout = 0
UILoop = function(UIList)
	
	while true
		
		if globals.breakout then
			globals.breakout = 0
		end if
		
		m.x = mouse.x - (m.width/2)
		m.y = mouse.y - (m.height/2)
		//mouse hitbox
		
		if mouse.button(0) then
			
			for uiComponent in UIList
				
				
				if uiComponent isa Button then
					if uiComponent.hasIndex("onClick") and m.collides(uiComponent) then
						uiComponent.onClick
						wait()
						continue
					end if
				end if
				
				if uiComponent isa DraggableFrame then
					
					for elem in UIList
						//print(elem isa Button)
						//print(m.collides(elem))
						if elem isa Button and m.collides(elem) then
							if elem.hasIndex("onClick") and elem.visible then
								elem.onClick
								wait()
								globals.breakout = 1
							end if
						end if
					end for
					
					//if breakout, don't run the paint function
					//need this so we can click buttons on
					//draggable frames without moving the window
					if globals.breakout then
						break
					end if
					
					if m.collides(uiComponent) then
						clear
						uiComponent.x = mouse.x-(uiComponent.width/2)
						uiComponent.y = mouse.y-(uiComponent.height/2)
						uiComponent.draw
						if uiComponent.hasIndex("paint") then
							uiComponent.paint
							continue
						end if
						yield
					end if
					
					
				end if
				
				if uiComponent isa Textbox then
					if m.collides(uiComponent) then
						uiComponent.focus
					end if
				end if
				
				
			end for
			
		end if
		
	end while
end function








