---
title: "Core"
---

# Pipeline

**Simplified Pipeline**:
1. Vertex Shader
2. Primitive/Patch Assembly
3. Tessellation
4. Geometry Shader
5. Rasterization & Interpolation
6. Fragment Shader.

# Vertex Shader

**Vertex Shader**: Operates on individual vertices one vertex at a time.
- Outputs a single vertex for each input vertex.
- Has access to uniform variables, read-only global variables for all vertices in a drawl call.
- Each vertex has a set of user-defined input attributes.

> A vertex shader has no knowledge of:
> - The other vertices that make up the graphical primitive, or
> - The type of primitive that vertex belongs to.

> Examples of User-Defined Input Attributes:
> - Position
> - Normal Vector
> - Texture Coordinates

GLSL defines a set of per-vertex attributes:

```glsl
in	int	gl_VertexID;
in	int	gl_InstanceID;
```
- gl_VertexID: Index of the vertex in the attribute arrays.
- gl_InstanceID: Index of the instance.

Intrinsic output attributes:

```glsl
out gl_PerVertex {
	vec4	gl_Position;
	float	gl_PointSize;
	float	gl_ClipDistance[];
};
```
- All optional, but some fixed-function steps after vertex shader expect gl_Position to be written.
	* `gl_Position`: Homogeneous coordinates of the output vertex's position.
- Like before, we can define our own per-vertex variables.

**Example**:

```glsl
#version 410

layout (std140) uniform Matrices {
	mat4 projModelViewMatrix;
	mat3 normalMatrix;
};

# This shader takes these three user-defined attributes per-vertex:
in vec3 position;
in vec3 normal;
in vec2 texCoord;

# See how the user-defined output variables are enclosed in this named-block (A)
out VertexData {
	vec2 texCoord;
	vec3 normal;
} VertexOut;

# Compute outputs here
void main()
{
	# (A) cont.
	VertexOut.texCoord = texCoord;
	VertexOut.normal = normalize(normalMatrix * normal);
	# Also output to gl_Position 
	gl_Position = projModelViewMatrix * vec4(position, 1.0);
}
```
- All shaders must have a main function

# Primitive Assembly

**Primitive Assembly Stage**: 
