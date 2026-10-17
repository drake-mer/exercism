package twofer

// ShareWith is kind of a templating string
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	first_part := "One for " + name
	all_string := first_part + ", one for me."
	return all_string
}
