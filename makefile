
turtle: lex.yy.c pyturtle.tab.c
	gcc pyturtle.tab.c lex.yy.c -lfl -ly -o turtle

lex.yy.c: turtle.l
	flex  turtle.l

pyturtle.tab.c: pyturtle.y
	bison -dv pyturtle.y

clean:
	rm -f lex.yy.c
	rm -f pyturtle.output
	rm -f turtle.tab.h
	rm -f pyturtle.tab.c
	rm -f turtle
