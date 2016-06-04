import turtle
window = turtle.Screen()

def pentagon(currentTurtle):
     currentTurtle.color('red')
     currentTurtle.forward(50)
     currentTurtle.lt(72)
     currentTurtle.color('green')
     currentTurtle.forward(50)
     currentTurtle.lt(72)
     currentTurtle.color('blue')
     currentTurtle.forward(50)
     currentTurtle.lt(72)
     currentTurtle.color('pink')
     currentTurtle.forward(50)
     currentTurtle.lt(72)
     currentTurtle.color('orange')
     currentTurtle.forward(50)
     currentTurtle.rt(90)
     currentTurtle.penup()
     currentTurtle.forward(40)
     currentTurtle.pendown()

alen=turtle.Turtle()
alen.shape('turtle')
alen.color('green')

alen.pendown()
for x in range(0, 9):
     pentagon( alen );


window.mainloop()
