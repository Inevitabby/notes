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
- **Connected Graph:** Has a path between every pair of distinct vertices
	* *(You can pick any two vertices and find a path between them)*
- **Complete**: There is a path from every vertex to every other vertex.
- **Disconnected**: There is at least one pair of vertices with no edge connecting them.

## Paths

**Path**: A path between two vertices is a sequence of edges.
- In a directed graph, the edge's direction must also be considered! (**Directed Path**)
- **Length**: Number of edges in the path
- **Cycle**: Path that begins and ends at the same vertex.

## Traversals

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
> 	return traversalOrder
> }
> ```
> - **Note**: Neighbors are the same thing as adjacent vertices.

2. **Depth-First (Pre-order)**
	- Done by traversing until you reach a vertex with no outsync nodes.

<!--
TODO ALG
-->

> **Note**: Our convention will be to use alphabetical order when we need to make a decision about how to traverse.  

## Topological Order

**Directed Acyclic Graph (DAC):** Directed graph without cycles
- In topological order of the vertices in DAC, vertex $a$ precedes vertex $b$ whenever a directed edge exists from $a$ to $b$.

```
Algorithm getTopologicalOrder() {
	vertexStack = stack to hold verticies as they're visited;
	numberOfVertices = number of vertices on the stack;
	for (counter = 1 to numberOfVertices) {
		nextVertex = anunvisited vertex whose neighbors, if any, are all visited
		Mark nextVertex as visited
		vertexStack.push(nextVertex)
	}
	return vertexStack;
}
```
