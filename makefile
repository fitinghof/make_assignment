OUTNAME = book_generator.exe
SOURCE = $(wildcard *.cpp)
OBJECT = $(SOURCE:.cpp=.o)
CC = g++
FLAGS = -Wall -O2

OSNAME = $(shell uname -s)

ifeq ($(UNAME_S), Linux)
	OSMSG =	"Compiling for Linux"
	FLAGS += -DLINUX
	OUTNAME = book_generator.exe
else ifeq ($(UNAME_S), Darwin)
	OSMSG =	"Compiling for Mac"
	FLAGS += -DMAC
    OUTNAME = book_generator.dmg
else
	OSMSG =	"Compiling for Windows"
	FLAGS += -DWINDOWS
    OUTNAME = book_generator.exe
endif

default: program
	./$(OUTNAME)

program: $(OBJECT)
	@echo $(OSMSG)
	$(CC) $(FLAGS) -o $(OUTNAME) $(OBJECT)

%.o: %.cpp
	$(CC) $(FLAGS) -c $< -o $@

book:
	$(MAKE) -f ./makefile.book

clean:
	rm *.exe *.adoc *.md *.o

