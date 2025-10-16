#include <iostream>
#include <vector>
#include <chrono>

const int ARRAY_SIZE = 1000000;
const int ITERATIONS = 200000;

void allocateStatically() {
    static int staticArray[ARRAY_SIZE];
    staticArray[0] = 1;
}

void allocateOnStack() {
    int stackArray[ARRAY_SIZE];
    stackArray[0] = 1;
}

void allocateOnHeap() {
    int* heapArray = new int[ARRAY_SIZE];
    heapArray[0] = 1;
    delete[] heapArray;
}

int main() {
    auto start_static = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERATIONS; ++i) {
        allocateStatically();
    }
    auto end_static = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> static_duration = end_static - start_static;

    auto start_stack = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERATIONS; ++i) {
        allocateOnStack();
    }
    auto end_stack = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> stack_duration = end_stack - start_stack;

    auto start_heap = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERATIONS; ++i) {
        allocateOnHeap();
    }
    auto end_heap = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> heap_duration = end_heap - start_heap;

    std::cout << "Static allocation time: " << static_duration.count() << " ms" << std::endl;
    std::cout << "Stack allocation time:  " << stack_duration.count() << " ms" << std::endl;
    std::cout << "Heap allocation time:   " << heap_duration.count() << " ms" << std::endl;

    return 0;
}
