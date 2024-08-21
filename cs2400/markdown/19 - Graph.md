---
title: "Graph"
---

# Graph

**Graphs**: Collection of distinct vertices and distinct edges.
- *Real-World Example: Road map*
- **Subgraph**: Portion of a graph that is itself a graph.

**Directed Graph**: Graph where the edges are arrows.
- *Real-World Example: Map of course pre-requisites*

> **Example**: On Adjacency
> $$
> B \to A
> $$
> - $A$ is adjacent to $B$, but $B$ is not adjacent to $A$

**Three Types of Graphs:**
1. **Connected Graph:** Has a path between every pair of distinct vertices
	*(You can pick any two vertices and find a path between them)*
2. **Complete**: There is a path from every vertex to every other vertex.
3. **Disconnected**: There is at least one pair of vertices with no edge connecting them.

## Paths

**Path**: A path between two vertices is a sequence of edges.
- **Length**: Number of [edges]{.underline} in the path
- **Cycle**: A path that begins and ends at the same vertex.

> **Note**: Directed Path
> - In a directed graph, the edge's direction must also be considered! (**Directed Path**)

> **Note**: Weighted Edges
> - If the edges have weights, the length is equal to the sum of their weights.

# Traversals

1. **Breadth-First (Level Order)**
	- You need a queue to do this.

> **Example**: Breadth-First Algorithm
> ```
> Algorithm getBreadthFirstTraversal(originVertex) {
> 	traversalOrderQueue; // Holds result
> 	vertexQueue; // Holds vertices as they're visited
> 	while(!vertexQeuue.isEmpty()) {
> 		frontVertex = vertexQueue.dequeue();
> 		while (frontVertex has a neighbor) {
> 			nextNeighbor = next neighbor of frontVertex;
> 			if (nextNeighbor is not visited) {
> 				Mark nextNeighor as visited;
> 				traversalOrder.enqeue(nextNeighbor);
> 				vertexQeue.enqueue(nextNeighbor);
> 			}
> 		}
> 	}
> 	return traversalOrderQueue;
> }
> ```
> - **Note**: Neighbors are the same thing as adjacent vertices.

2. **Depth-First (Pre-order)**
	- Done by traversing until you reach a vertex with no outsync nodes.

> **Example**: Depth-First Algorithm
```

Algorithm 

```
> - **Note**: Neighbors are the same thing as adjacent vertices.

> **Note**: Finding Neighbors
> - To find neighbors, you need to use iterator (`hasNext()`)

# Topological Order

**Directed Acyclic Graph (DAC):** Directed graph [without cycles]{.underline}
- In topological order of the vertices in DAC, vertex $a$ precedes vertex $b$ whenever a directed edge exists from $a$ to $b$.

> **Example**: Topological Sort Algorithm
> ```
> Algorithm getTopologicalOrder() {
> 	vertexStack = stack to hold verticies as they're visited;
> 	numberOfVertices = number of vertices on the stack;
> 	for (counter = 1 to numberOfVertices) {
> 		nextVertex = anunvisited vertex whose neighbors, if any, are all visited
> 		Mark nextVertex as visited
> 		vertexStack.push(nextVertex)
> 	}
> 	return vertexStack;
> }
> ```
> - Note How this returns a stack (pop items off to get the right order)

> **Real-World Example:** Project Management

# Shortest Path

> **Note**: Unweighted Graph
> - In an unweighted graph, we can find all traversals and pick the one with the smallest length.

**Data Structure for Vertices:**
1. Vertex Label
2. Path Length
3. Predecessor

**Data Structure for Paths**:
- We store paths as stacks.

> **Example**: Algorithm to get shortest path of unweighted graph
> ```
> Algorithm getShortestPath(originVertex, endVertex, path) {
> 	done = false;
> 	vertexQueue;
> 	Mark originVertex as visited
> 	// Traverse (kinda like breadth-first_
> 	while (!done && frontVettex has a neighbor) {
> 		nextNeighbor = next neighbor of frontVertex;
> 		if (nextNeighbor is not visited) {
> 			Mark nextNeighbor as visited
> 			Set the length of the path to nextNeighbor to 1 + ength of path to frontVertex
> 			Set the predecessor of nextNeighbor to frontVertex
> 			vertexQueue.enqueue(nextNeighbor);
> 		}
> 		if (nextNeighbor equals endVertex) {
> 			done = true;
> 		}
> 	}
> 	// Construct shortest path
> 	pathLength = length of path to endVertex
> 	path.push(endVertex);
> 	vertex = endVertex;
> 	while (vertex has a predecessor) {
> 		vertex = predecessor of vertex;
> 		path.push(vertex)
> 	}
> 	return pathLength;
> }
> ```
> - If queue is empty, there is no path (disconnected or not there).
> - This is basically a simplified version of Dijkstra's algorithm.
>	- To handle weights, we need to use a priority queue.

<!--
# Basic Graph Interface

```java
public interface BasicGraphInterface<T> {
	boolean addVertex(T vertexLabel);
	boolean addEdge(T begin, T end, double edgeWeight);
	int getNumberOfVertices();
	// ET CETERA
}
```

```java
public interface GraphAlgorithmsInterface<T> {
	
}
```
-->

# Implementation
