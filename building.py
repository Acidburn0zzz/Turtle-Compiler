import turtle
window = turtle.Screen()

def startSpot(currentTurtle):
     currentTurtle.penup()
     currentTurtle.rt(90)
     currentTurtle.forward(250)
     currentTurtle.rt(90)
     currentTurtle.forward(50)
     currentTurtle.lt(180)
     currentTurtle.pendown()
def border(currentTurtle):
     currentTurtle.color('blue')
     currentTurtle.forward(100)
     currentTurtle.lt(90)
     currentTurtle.forward(400)
     currentTurtle.lt(90)
     currentTurtle.forward(100)
     currentTurtle.lt(90)
     currentTurtle.forward(400)
     currentTurtle.lt(90)
def windowLeft(currentTurtle):
     currentTurtle.penup()
     currentTurtle.color('purple')
     currentTurtle.forward(40)
     currentTurtle.rt(90)
     currentTurtle.forward(15)
     currentTurtle.pendown()
     currentTurtle.forward(10)
     currentTurtle.lt(90)
     currentTurtle.forward(20)
     currentTurtle.lt(90)
     currentTurtle.forward(10)
     currentTurtle.lt(90)
     currentTurtle.forward(20)
     currentTurtle.lt(90)
     for x in range(0, 3):
          otherWindows( currentTurtle );
     currentTurtle.lt(180)
     currentTurtle.penup()
     currentTurtle.forward(75)
     currentTurtle.rt(90)
def otherWindows(currentTurtle):
     currentTurtle.penup()
     currentTurtle.forward(20)
     currentTurtle.pendown()
     currentTurtle.forward(10)
     currentTurtle.lt(90)
     currentTurtle.forward(20)
     currentTurtle.lt(90)
     currentTurtle.forward(10)
     currentTurtle.lt(90)
     currentTurtle.forward(20)
     currentTurtle.lt(90)
def door(currentTurtle):
     currentTurtle.penup()
     currentTurtle.color('black')
     currentTurtle.forward(30)
     currentTurtle.pendown()
     currentTurtle.lt(90)
     currentTurtle.forward(30)
     currentTurtle.rt(90)
     currentTurtle.forward(20)
     currentTurtle.rt(90)
     currentTurtle.forward(30)
     currentTurtle.lt(90)
     currentTurtle.penup()
     currentTurtle.forward(20)
     currentTurtle.pendown()
     currentTurtle.lt(90)
     currentTurtle.forward(30)
     currentTurtle.lt(90)
     currentTurtle.forward(20)
     currentTurtle.lt(90)
     currentTurtle.forward(30)
     currentTurtle.rt(90)
     currentTurtle.penup()
     currentTurtle.forward(50)
     currentTurtle.lt(180)
def spire(currentTurtle):
     currentTurtle.forward(40)
     currentTurtle.rt(90)
     currentTurtle.forward(22)
     currentTurtle.pendown()
     currentTurtle.lt(90)
     currentTurtle.color('orange')
     for x in range(0, 9):
          slightTurns( currentTurtle );
     currentTurtle.lt(85)
     currentTurtle.forward(70)
     currentTurtle.lt(180)
     currentTurtle.lt(10)
     currentTurtle.forward(70)
     currentTurtle.lt(85)
     for x in range(0, 10):
          slightTurnsDown( currentTurtle );
     currentTurtle.penup()
     currentTurtle.lt(90)
     currentTurtle.forward(100)
def slightTurns(currentTurtle):
     currentTurtle.forward(4)
     currentTurtle.lt(350)
def slightTurnsDown(currentTurtle):
     currentTurtle.forward(4)
     currentTurtle.lt(350)

anna=turtle.Turtle()
anna.shape('turtle')
anna.color('green')

anna.pendown()
startSpot( anna );
border( anna );
door( anna );
anna.lt(90)
for x in range(0, 9):
     windowLeft( anna );
spire( anna );
anna.lt(90)
anna.penup()
anna.forward(1500)


window.mainloop()
