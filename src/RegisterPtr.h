#ifndef REGISTER_PTR_H
#define REGISTER_PTR_H

#include <stdint.h>

namespace ino {

template <class T, uintptr_t Addr>
struct RegisterPtr {

	RegisterPtr()  = default;

	volatile T& operator*() const noexcept { return *get(); }

	static T load() noexcept { return *get(); }

	volatile T* operator->() const noexcept {
		return get();
	}
	
	static volatile T* get() noexcept {
		return reinterpret_cast<volatile T*>(Addr);
	}

	operator volatile T*() const noexcept {
		return get();
	}

	constexpr operator bool() const noexcept {
		return Addr != 0u;
	}
};


} /* namespace ino */


#endif /* REGISTER_PTR_H */
