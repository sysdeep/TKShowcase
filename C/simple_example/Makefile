
CC=gcc
#CFLAGS=-c -Wall			# error


all:
	$(CC) -o app app.c  -ltcl8.6 -ltk8.6 -I/usr/include/tcl8.6/

clean:
	rm -rf *.o app




# CC=g++
# CFLAGS=-c -Wall
# LDFLAGS=
# SOURCES=main.cpp hello.cpp factorial.cpp
# OBJECTS=$(SOURCES:.cpp=.o)
# EXECUTABLE=hello

# all: $(SOURCES) $(EXECUTABLE)
	
# $(EXECUTABLE): $(OBJECTS) 
# 	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

# .cpp.o:
# 	$(CC) $(CFLAGS) $< -o $@