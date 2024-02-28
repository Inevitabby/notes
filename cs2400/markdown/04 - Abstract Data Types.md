# Data Organization in Real Life

**A lot of things in real life can be implemented with certain data structures.**

- Standing in a line
	* e.g., Everyone gets served in order
	* *Queue data type*
- Stack of books
	* e.g., Last book you put on the stack will be the first you can take out
	* *Stack data type*
- To-do list
	* e.g., You can delete items from the to-do list
	* *List data type*
- Dictionary
	* e.g., Searching for definition (value) associated with words (key)
	* *Dictionary data type*
- Folders
	* e.g., Directory trees
	* *Tree data type*
- Road map
	* e.g., Cities connected by roads
	* *Graph data type*

# Computer Data Organization

**Abstract Data Type**: 
- *Specification* of a data set and the operations on that data
	* Doesn't indicate how to store the data or implement operations.
- *Independent* of any programming language.

$$
\text{EDT in Java} = \text{Interface} + \text{Class}
$$

**Data Structure**: 

**Collection**: 

> **Examples**: Containers
> - Bag
> - List
> - Stack
> - Queue
> - Dictionary
> - Tree
> - Graph

# Bag Abstract Data Type

**Definition**:
- Finite collection of objects
- No particular order
- Can contain duplicates

**Operations**:
- Count number of items
- Check for empty
- Add/remove items

> **Metaphor**: Bag of groceries

## CRC (Class-Responsibility-Collaboration) Card

**Responsibilities**:
- Get the number of items in the bag
- See whether bag is empty
- Add given object
- Remove unspecified object
- Remove particular object
- Remove all objects from bag
- Count number of times a certain object occurs in the bag
- Test whether bag contains a particular object
- Look at all objects in the bag

**Collaboration**:
- TODO

## Specifying a Bag

Options we can take when we can't complete a task:
1. Do nothing
2. Signal the client
	- e.g., throw an exception

## Interface UML

@startuml
interface Bag{
getCurrentSize
isEmpty
add
remove
clear
getFrequencyOf
contains
toArray
}
@enduml

# Iterator

**Iterator**
- Object that traverses a collection of data
- Each item considered one.
