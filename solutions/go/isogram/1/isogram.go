package isogram

import (
	unicode "unicode"
)

// IsIsogram tells if a given string is an isogram
func IsIsogram(sentence string) bool {
	var letterCount map[rune]int
	var upperCase rune
	for _, character := range sentence {
		if unicode.IsLetter(character) {
			upperCase = unicode.ToUpper(character)
			if letterCount[upperCase] == 1 {
				return false
			}
			letterCount[upperCase] = 1
		}
	}
	return true
}
