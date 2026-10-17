// Package raindrops gives an implementation of the
// Convert function
package raindrops

import "fmt"

// Convert function is a variant of the fizzbuzz
// challenge often asken in CS related job interviews
func Convert(input int) (output string) {
	output = ""
	conversionTable := map[int]string{
		3: "Pling",
		5: "Plang",
		7: "Plong",
	}
	for _, divisor := range []int{3, 5, 7} {
		if (input % divisor) == 0 {
			output += conversionTable[divisor]
		}
	}
	if output != "" {
		return output
	}
	return fmt.Sprintf("%d", input)

}
