package listops

type binFunc = func(int, int) int
type predFunc = func(int) bool
type unaryFunc = func(int) int

// IntList is a simple alias for an integer array
type IntList []int


// Foldr is well known, remember right == accumulator on the right
func (list * IntList) Foldr(f func(int, int) int, acc int) (int){
	var elem int
	for pos := list.Length() - 1; pos >= 0; pos-- {
		elem = (*list)[pos]
		acc = f(elem, acc)
	}
	return acc
}


// Foldl is well known, remember left == accumulator on the left
func (list * IntList) Foldl(f func(int, int) int, acc int) (int){
	for _, elem := range *list {
		acc = f(acc, elem)
	}
	return acc
}


// Filter the element of a list according to a predicate function
func (list IntList) Filter(f func(int) bool) (output IntList){
	output = []int{}
	for _, elem := range list {
		if f(elem){
			output = append(output, elem)
		}
	}
	return output
}


// Length Compute the length of a list using 'len' for know
// We just use range and return index + 1 at the end but that's ugly
func (list * IntList) Length() (pos int) {
	return len(*list)
}


// Map is the well known function for lists
func (list * IntList) Map(f unaryFunc) (output IntList){
	output = make([]int, len(*list))
	for pos, elem := range *list {
		output[pos] = f(elem)
	}
	return
}


// Reverse is the well known function for lists
func (list * IntList) Reverse() (output IntList){
	// we know that reverse can be implemented in term of
	// folr if using linked list.
	// Here we are working on arithmetic arrays so let's use the old school technique
	var length = list.Length()
	output = make([]int, length)
	for pos, elem := range *list {
		output[length - 1 - pos] = elem
	}
	return
}


// Append is a method that concatenate two lists together 
func (list * IntList) Append(input IntList) (output IntList){
	output = append(*list, input...)
	return
}


// Concat is a method that concatenate several list together
func (list IntList) Concat(input []IntList) (output IntList){
	output = make([]int, 0)
	for _, aList := range input{
		output = list.Append(aList)
		list = output
	}
	return output
}
