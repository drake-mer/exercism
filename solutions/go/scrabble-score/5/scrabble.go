// Package scrabble is a container for the 'Score' function
package scrabble

import "unicode"

// LetterScore is a function that score +=
// the score for a given letter
func Score(word string) (score int) {
	score = 0
	for _, x := range word {
		switch unicode.ToUpper(x) {
		case 'A':
			score += 1
		case 'B':
			score += 3
		case 'C':
			score += 3
		case 'D':
			score += 2
		case 'E':
			score += 1
		case 'F':
			score += 4
		case 'G':
			score += 2
		case 'H':
			score += 4
		case 'I':
			score += 1
		case 'J':
			score += 8
		case 'K':
			score += 5
		case 'L':
			score += 1
		case 'M':
			score += 3
		case 'N':
			score += 1
		case 'O':
			score += 1
		case 'P':
			score += 3
		case 'Q':
			score += 10
		case 'R':
			score += 1
		case 'S':
			score += 1
		case 'T':
			score += 1
		case 'U':
			score += 1
		case 'V':
			score += 4
		case 'W':
			score += 4
		case 'X':
			score += 8
		case 'Y':
			score += 4
		case 'Z':
			score += 10
		}
	}
	return
}
