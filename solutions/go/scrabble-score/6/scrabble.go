// Package scrabble is a container for the 'Score' function
package scrabble

import "unicode"

// LetterScore is a function that score +=
// the score for a given letter
func Score(word string) (score int) {
	score = 0
	for _, x := range word {
		switch unicode.ToUpper(x) {
		case 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T':
			score += 1
		case 'D', 'G':
			score += 2
		case 'B', 'C', 'M', 'P':
			score += 3
		case 'F', 'H', 'V', 'W', 'Y':
			score += 4
		case 'K':
			score += 5
		case 'J', 'X':
			score += 8
		case 'Q', 'Z':
			score += 10
		}
	}
	return
}
