package luhn

import (
	"strconv"
	"unicode"
)

// doubleDigit double a given digit for the
// Luhn algorithm special need
func doubleDigit(input int) (output int) {
	output = input * 2
	if output > 9 {
		output = output - 9
	}
	return output
}

// Valid function tells if a given card number
// is valid according to the Luhn algorithm
func Valid(input string) bool {
	digitPos := 0
	luhnSum := 0
	for k := len(input) - 1; k >= 0; k-- {
		char := input[k]
		if unicode.IsSpace(rune(char)) {
			// spaces are acceptable in the input
			continue
		}
		if !unicode.IsDigit(rune(char)) {
			// any other char type is not though
			return false
		}
		digit, _ := strconv.Atoi(string(char))
		digitPos++
		if digitPos%2 == 0 {
			luhnSum += doubleDigit(digit)
		} else {
			luhnSum += digit
		}
	}
	return digitPos > 1 && luhnSum%10 == 0
}
