FLAGS := $(shell pkg-config --cflags gtk+-3.0)
LIBS := $(shell pkg-config --libs gtk+-3.0)

all: a.out
a.out: main.cpp
	g++ -std=c++11 $(FLAGS) main.cpp $(LIBS)
run: a.out
	./$<
