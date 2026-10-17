package grains

import (
	"errors"
)

// Square tells the number of grains on a given square
func Square(squarePos int) (uint64, error) {
	if squarePos <= 0 || squarePos > 64 {
		return 0, errors.New("Out-of-range value for Square")
	}
	return 1 << uint(squarePos-1), nil
}

// Total tells the total number of grains
func Total() (result uint64) {
	var total uint64
	return ^total
}
