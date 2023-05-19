# Paths:
SRC := src/
OBJ := obj/
BIN := bin/
INC := include/

# Define C++ compiler target and flags
CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -pedantic -g -I$(INC)

# Target name
TARGET := $(BIN)program

# All .cpp files and .o files
SRCS := $(wildcard $(SRC)*.cpp)
OBJS := $(patsubst $(SRC)%.cpp, $(OBJ)%.o, $(SRCS))

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJ)%.o: $(SRC)%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(OBJ)*.o $(TARGET)
