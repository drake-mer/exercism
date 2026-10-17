package luhn

import (
	"errors"
	"strconv"
	"unicode"
)

// validFormat is
//  - filtering spaces
//  - reporting errors in case non-(space or digit)
//    chars are in the input string
func validFormat(input string) (string, error) {
	var output string
	output = ""
	for _, char := range input {
		if unicode.IsDigit(char) {
			output = output + string(char)
		} else if !unicode.IsSpace(char) {
			err := errors.New("NonSpace and NonDigit in input")
			return output, err
		}
	}
	if len(output) < 2 {
		err := errors.New("Card number is not correct")
		return output, err
	}
	return output, nil
}

// doubleDigit double a given digit for the
// Luhn algorithm special need
func doubleDigit(input int) (output int) {
	output = input * 2
	if output > 9 {
		output = output - 9
	}
	return output
}

// Tells if a sequence of digits is valid
// according to the Luhn formula
// Before calling this function, the input
// must have been validated to contain *only*
// single digits
func luhnValid(input string) bool {
	var digit int
	var err error
	var sum int
	var inputSize int
	sum = 0
	inputSize = len(input)
	for k := inputSize - 1; k >= 0; k-- {
		digit, err = strconv.Atoi(string(input[k]))
		if err != nil {
			// Should never enter here because input
			// has been checked before calling
			panic("Incorrect conversion from digit to int")
		}
		if (inputSize-k)%2 == 0 {
			digit = doubleDigit(digit)
		}
		sum = sum + digit
	}
	return sum%10 == 0
}

// Valid function tells if a given card number
// is valid according to the Luhn algorithm
func Valid(input string) bool {
	correctedInput, err := validFormat(input)
	if err != nil {
		return false
	}
	return luhnValid(correctedInput)
}
