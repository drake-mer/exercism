// Package hamming is helping computing the hamming distance.
package hamming


import "errors"


// Distance computes Hamming distance between two DNA strands.
func Distance(a, b string) (hammingDistance int, err error) {
	hammingDistance = 0
	err = nil

	// per requirement, you do want to return an error here
	if len(a) != len(b) {
		err = errors.New("The two DNA strands do not have the same length")
	}

	if err != nil {
		return
	}

	for index := range a {
		if a[index] != b[index] {
			hammingDistance++
		}
	}
	return

}
