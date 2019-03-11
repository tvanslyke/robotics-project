#ifndef INO_PLACEMENT_NEW_H
#define INO_PLACEMENT_NEW_H

#include <stddef.h>

// Default placement versions of operator new.
inline void* operator new(size_t, void* __p) throw() { return __p; }
inline void* operator new[](size_t, void* __p) throw() { return __p; }

// Default placement versions of operator delete.
inline void  operator delete  (void*, void*) throw() { }
inline void  operator delete[](void*, void*) throw() { }

#endif /* INO_PLACEMENT_NEW_H */
