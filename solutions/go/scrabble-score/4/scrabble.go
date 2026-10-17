// Package scrabble is a container for the 'Score' function
package scrabble

import "unicode"

// LetterScore is a function that return
// the score for a given letter
func LetterScore(x rune) (int){
	switch x {
		case 'A':
			return 1
		case 'B':
			return 3
		case 'C':
			return 3
		case 'D':
			return 2
		case 'E':
			return 1
		case 'F':
			return 4
		case 'G':
			return 2
		case 'H':
			return 4
		case 'I':
			return 1
		case 'J':
			return 8
		case 'K':
			return 5
		case 'L':
			return 1
		case 'M':
			return 3
		case 'N':
			return 1
		case 'O':
			return 1
		case 'P':
			return 3
		case 'Q':
			return 10
		case 'R':
			return 1
		case 'S':
			return 1
		case 'T':
			return 1
		case 'U':
			return 1
		case 'V':
			return 4
		case 'W':
			return 4
		case 'X':
			return 8
		case 'Y':
			return 4
		case 'Z':
			return 10
	}
	return 0
}

// Score is a function that computes the score of a given word
// using a map Letter -> Score for computing the total score
// of a given word.
func Score(word string) (score int) {
	score = 0
	if word == "" {
		return score
	}
	for _, letter := range word {
		score += LetterScore(unicode.ToUpper(letter))
	}
	return score
}
