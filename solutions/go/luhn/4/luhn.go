package luhn

// Valid function tells if a given card number
// is valid according to the Luhn algorithm
func Valid(input string) bool {
	digitPos := 0
	luhnSum := 0
	for k := len(input) - 1; k >= 0; k-- {
		char := input[k]
		if char == ' ' {
			// spaces are acceptable in the input
			continue
		}
		digit := int(char - '0')
		if digit < 0|| digit > 9 {
			return false
		}
		digitPos++
		if digitPos%2 == 0 {
			digit *= 2
			if digit > 9 {
				digit -= 9
			}
		} 
		luhnSum += digit
	}
	return digitPos > 1 && luhnSum%10 == 0
}
