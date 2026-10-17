// Package triangle is about numerically testing
// properties of a triangle
package triangle

import "math"

// Kind is an enum that represent the type of a triangle
// those types are not mutually exclusive, so your classification
// is not very mathematical :)
type Kind int

const (
	// NaT means not a triangle
	NaT Kind = 0
	// Equ means equilateral
	Equ Kind = 1
	// Iso means isosceles
	Iso Kind = 2
	// Sca means scalene
	Sca Kind = 3
	// Deg means a degenerate triangle
	Deg Kind = 4
)

// IsIsocele tells if a triangle is Isocele
func IsIsocele(a, b, c float64) (response bool) {
	return a == b || b == c || c == a
}

// IsEquilateral tells if a triangle is equilateral
func IsEquilateral(a, b, c float64) (response bool) {
	return a == b && c == a
}

// IsDegenerate tells if a triangle is degenerate
func IsDegenerate(a, b, c float64) (response bool) {
	return a == b+c || b == c+a || c == b+a
}

// IsScalene tells if a triangle is scalene
func IsScalene(a, b, c float64) (response bool) {
	return a != b && b != c && c != a
}

// IsNotaTriangle checks that the number seemingly
// represent a real triangle
func IsNotaTriangle(a, b, c float64) (response bool) {
	response = false
	if a <= 0 || b <= 0 || c <= 0 {
		response = true
	}
	if a+b < c || a+c < b || b+c < a {
		response = true
	}
	if math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c) {
		response = true
	}
	if math.IsInf(a, 0) || math.IsInf(b, 0) || math.IsInf(c, 0) {
		response = true
	}
	return response
}

// KindFromSides gives the kind of a triangle
// using the given side lengths.
func KindFromSides(a, b, c float64) (k Kind) {
	if IsNotaTriangle(a, b, c) {
		return NaT
	} else if IsEquilateral(a, b, c) {
		return Equ
	} else if IsIsocele(a, b, c) {
		return Iso
	} else if IsScalene(a, b, c) {
		return Sca
	} else if IsDegenerate(a, b, c) {
		return Deg
	}
	return NaT
}
