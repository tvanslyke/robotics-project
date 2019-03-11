#ifndef INO_OPTIONAL_H
#define INO_OPTIONAL_H

#include "placement_new.h"

namespace ino {

inline constexpr struct nullopt_t {} nullopt;

template <class T>
struct Optional {
	constexpr Optional() = default;

	constexpr Optional(nullopt_t):
		Optional()
	{
	
	}

	template <class U>
	explicit constexpr Optional(U&& value):
		value_(static_cast<U&&>(value)),
		has_value_(true)
	{
	
	}

	constexpr Optional(const Optional& other):
		Optional()
	{
		if(other.has_value()) {
			emplace_fast(other.value());
		}
	}

	constexpr Optional(Optional&& other):
		Optional()
	{
		if(other.has_value()) {
			emplace_fast(static_cast<T&&>(other.value()));
		}
	}

	constexpr Optional& operator=(const Optional& other) {
		if(other) {
			emplace(*other);
		} else {
			reset();
		}
		return *this;
	}

	constexpr Optional& operator=(Optional&& other) {
		if(other) {
			emplace(static_cast<T&&>(*other));
		} else {
			reset();
		}
		return *this;
	}

	constexpr Optional& operator=(const T& value) {
		emplace(value);
		return *this;
	}

	constexpr Optional& operator=(T&& value) {
		emplace(static_cast<T&&>(value));
		return *this;
	}

	~Optional() {
		reset();
	}

	constexpr operator bool () const {
		return has_value();
	}

	constexpr bool has_value() const {
		return has_value_;
	}

	void reset() {
		if(has_value()) {
			// manually destroy the contained value
			value_.~T();
			has_value_ = false;
		}
	}

	template <class ... Args>
	T& emplace(Args&& ... args) {
		reset();
		// Not an allocation! (placement new)
		return emplace_fast(static_cast<Args&&>(args)...);
	}

	constexpr const T& value() const {
		return value_;
	}

	constexpr T& value() {
		return value_;
	}

	constexpr const T& operator*() const {
		return value();
	}

	constexpr T& operator*() {
		return value();
	}

	constexpr const T* operator->() const {
		return &value();
	}

	constexpr T* operator->() {
		return &value();
	}

	template <class U>
	constexpr T value_or(U&& other) const& {
		if(*this) {
			return *this;
		} else {
			return static_cast<T>(static_cast<U&&>(other));
		}
	}

	template <class U>
	constexpr T value_or(U&& other) const&& {
		return static_cast<const Optional*>(this)->value_or(static_cast<U&&>(other));
	}

	template <class U>
	constexpr T value_or(U&& other) & {
		return static_cast<const Optional*>(this)->value_or(static_cast<U&&>(other));
	}

	template <class U>
	constexpr T value_or(U&& other) && {
		if(*this) {
			return static_cast<T&&>(*this);
		} else {
			return static_cast<T>(static_cast<U&&>(other));
		}
	}

private:

	template <class ... Args>
	constexpr T& emplace_fast(Args&& ... args) {
		// Not an allocation! (placement new)
		T* p = &value_;
		T& v = *(new (&p) T(static_cast<Args&&>(args) ...));
		has_value_ = true;
		return v;
	}

	union {
		char dummy_ = '\0';
		T value_;
	};
	bool has_value_ = false;
};

template <class T>
Optional(const Optional<T>&) -> Optional<T>;

template <class T>
Optional(const T&) -> Optional<T>;


} /* namespace ino */

#endif /* INO_OPTIONAL_H */
