// Package hamming is helping computing the hamming distance.
package hamming

import "errors"

// Distance computes Hamming distance between two DNA strands.
func Distance(a, b string) (int, error) {

	// per requirement, you do want to return an error here
	if len(a) != len(b) {
		return 0, errors.New("the two DNA strands do not have the same length")
	}

	hammingDistance := 0
	for index := range a {
		if a[index] != b[index] {
			hammingDistance++
		}
	}
	return hammingDistance, nil

}
