import turtle
window = turtle.Screen()

def lineoftriangles(currentTurtle):
     currentTurtle.forward(15)
     currentTurtle.rt(90)
     for x in range(0, 5):
          currentTurtle.color('red')
          currentTurtle.lt(120)
          currentTurtle.forward(30)
          currentTurtle.color('blue')
          currentTurtle.lt(120)
          currentTurtle.forward(30)
          currentTurtle.color('yellow')
          currentTurtle.lt(120)
          currentTurtle.forward(30)
          currentTurtle.color('pink')
          currentTurtle.lt(180)
          currentTurtle.forward(15)
          currentTurtle.rt(90)
          currentTurtle.penup()
          currentTurtle.forward(26)
          currentTurtle.pendown()
          currentTurtle.forward(14)
          currentTurtle.rt(90)
          currentTurtle.forward(15)
def square(currentTurtle):
     currentTurtle.forward(20)
     currentTurtle.forward(20)
     currentTurtle.rt(90)
     currentTurtle.forward(20)
     currentTurtle.rt(90)
     currentTurtle.forward(20)
     currentTurtle.rt(90)
     currentTurtle.forward(20)
     currentTurtle.rt(90)

alex=turtle.Turtle()
alex.shape('turtle')
alex.color('green')
bill=turtle.Turtle()
bill.shape('turtle')
bill.color('green')

alex.pendown()
bill.pendown()
square( bill );
for x in range(0, 2):
     lineoftriangles( alex );
     bill.forward(10)
     bill.lt(90)
     bill.lt(-30)
     for x in range(0, 2):
          bill.rt(90)
          bill.forward(30)
     lineoftriangles( bill );

alex.lt(180)
alex.forward(50)
lineoftriangles( alex );
for x in range(0, 5):
     alex.lt(20)
     alex.forward(10)


window.mainloop()
