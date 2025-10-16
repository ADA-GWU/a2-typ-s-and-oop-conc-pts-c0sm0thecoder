# Task 1: Comparison of Static, Stack, and Heap Allocation in C++

To compare the time taken to allocate memory for arrays of the same size (1000000 elements) declared statically, on the stack, and on the heap I created three functions called allocateStatically(), allocateOnStack(), and allocateOnHeap(). In order to prevent the compiler from ignoring the arrays as they are not used for the sake of optimizing the compilation, I assigned the value of 1 to the first element of each of these arrays. The code was compiled using C++17 with the following command:

```
clang++ --std=c++17 task1/main.cpp -o task1/out
```

. The results came out as follows:

![C++ output](/task1/media/out.png)

## Static declaration
It was the fastest one. In static declaration the variable is created only once in the compilation time rather than creating a new one in every run. Because of that it took the least time to among the three types of memory allocation. All this function did was writing to the first element of the array in every iteration.

## Declaration on the stack
When we declare the variable on the stack, the stack pointer moves to allocate memory for that variable. And when the function returns, the stack pointer simple moves back, deallocating the space occupied by the same variable. This process happens every time the program is run. However, because this process is a single CPU instruction, it is quite fast, though it is around ~30% slower than static allocation.

## Declaration on the heap
When we want to create the variable on the heap, we should take care of allocation and deallocation manually. When we call the ```new``` keyword in C++ it uses system calls to go and find a large enough free spot in the memory that can hold the declared variable. Then, it returns back the pointer to that memory. And when we are done with the memory, we should manually free the space for our variable, which again goes and finds the block of memory and marks it as free. Because of this complexity, heap allocation takes around 700 times more time than static and stack allocation.
