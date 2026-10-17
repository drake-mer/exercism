package isogram

import (
	unicode "unicode"
)

// IsIsogram tells if a given string is an isogram
func IsIsogram(sentence string) bool {
	var upperCase rune
	letterCount := make(map[rune]int)
	for _, character := range sentence {
		if !unicode.IsLetter(character) {
			continue
		}
		upperCase = unicode.ToUpper(character)
		if letterCount[upperCase] == 1 {
			return false
		}
		letterCount[upperCase] = 1
	}
	return true
}
