package diffsquares

// SumOfSquares(n) returns (1² + 2² + ... + n²)
func SumOfSquares(n int) int {
	return n * (n + 1) * (2*n + 1) / 6

}

// SquareOfSum of (n) = (1 + 2 + ... + n)²
func SquareOfSum(n int) int {
	res := n * (n + 1) / 2
	res *= res
	return res
}

// Difference(n) returns
// (sum(x for x in range(n)))² - sum(x² for x in range(n))
func Difference(n int) int {
	res := SquareOfSum(n) - SumOfSquares(n)
	return res
}
