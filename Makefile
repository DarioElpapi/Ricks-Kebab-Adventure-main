CC = gcc
CFLAGS = -Wall -Wextra -std=c99
INCDIR = include
SRCDIR = src
OBJDIR = obj

# Pfad zu den Bibliotheken
LIBDIR = /usr/local/lib

# Linkerflags
LDFLAGS = -L$(LIBDIR) -lGL -lglut -lGLU -lGLEW -lglfw -lm

SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SOURCES))
HEADERS = $(wildcard $(INCDIR)/*.h)

TARGET = opengl_project

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $^ -o $@ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEADERS)
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -I$(INCDIR) -c $< -o $@

clean:
	rm -f $(OBJDIR)/*.o $(TARGET)
