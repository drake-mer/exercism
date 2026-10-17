// Package scrabble is a container for the 'Score' function
package scrabble

import "unicode"

// Score is a function that compute the score
// of a given word according to the written rules in the code
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
