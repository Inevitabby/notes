# Physical Memory

| Incredibly Accurate Diagram of Memory
| :---:                                                |
| machine code                                         |
| globals                                              |
| $\downarrow$ heap $\downarrow$                       |
| *(if heap and stack collide, that's stack overflow)* |
| $\uparrow$ stack $\uparrow$                          |

Heap:
- `malloc()`

Stack:
- Local variables

