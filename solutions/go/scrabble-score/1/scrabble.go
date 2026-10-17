// Package scrabble is a container for the 'Score' function
package scrabble

import "unicode"


// Score is a function that computes the score of a given word
// using a map Letter -> Score for computing the total score
// of a given word.
func Score(word string) (score int) {
	score = 0
	if word == "" {
		return score
	}
	scoreBoard := make(map[rune] int)
	// Probably utterly inefficient to have this map built and allocated
	// at each function call.
	//
	// Let see what the mentor can say about it :)
	//
	// Possible strategies
	//
	// - create a compile time constant
	// - allocate the variable only once at runtime in a local variable
	// - etc, etc.
	mapping := map[int] []rune {
		1: []rune {'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'},
		2: []rune {'D', 'G'},
		3: []rune {'B', 'C', 'M', 'P'},
		4: []rune {'F', 'H', 'V', 'W', 'Y'},
		5: []rune {'K'},
		8: []rune {'J', 'X'},
		10: []rune {'Q', 'Z'},
	}
	for score, letters := range mapping {
		for _, letter := range letters {
			scoreBoard[letter] = score
		}
	}
	for _, letter := range word {
		score += scoreBoard[unicode.ToUpper(letter)]
	}
	return score
}
