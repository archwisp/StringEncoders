CC=gcc
CPP_FLAGS=-I ./include
SRC_DIR=./src
BUILD_DIR=./build
TEST_DIR=${BUILD_DIR}/tests
MKDIR = mkdir -p

.PHONY: directories all

all: directories tests 

directories: ${BUILD_DIR} ${TEST_DIR}

tests: BinaryStringTest HexStringTest

${BUILD_DIR}:
	${MKDIR} ${BUILD_DIR}

${TEST_DIR}:
	${MKDIR} ${TEST_DIR}

BinaryStringTest: ${SRC_DIR}/BinaryStringTest.cpp
	$(CC) $(CPP_FLAGS) ${SRC_DIR}/BinaryString.cpp ${SRC_DIR}/BinaryStringTest.cpp -o ${TEST_DIR}/BinaryStringTest

HexStringTest: ${SRC_DIR}/HexStringTest.cpp
	$(CC) $(CPP_FLAGS) ${SRC_DIR}/HexString.cpp ${SRC_DIR}/HexStringTest.cpp -o ${TEST_DIR}/HexStringTest

clean:
	rm -rf ./build

run-tests:
	${TEST_DIR}/BinaryStringTest
	${TEST_DIR}/HexStringTest
