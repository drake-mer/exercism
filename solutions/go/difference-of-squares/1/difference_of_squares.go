package diffsquares

// SumOfSquares returns
// (1² + 2² + ... + n²)
func SumOfSquares(n int) (res int) {
	res = n * (n + 1) * (2*n + 1) / 6
	return
}

// SquareOfSum of (n) = (1 + 2 + ... + n)²
func SquareOfSum(n int) int {
	res := n * (n + 1) / 2
	return res * res
}

// Difference returns
// square(sum(x for x in range(n)))
// - sum(square(x) for x in range(n))
func Difference(n int) (res int) {
	res = SquareOfSum(n) - SumOfSquares(n)
	return
}
