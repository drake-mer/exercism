// Package leap contains a function to
// tell if we are in a leap year.
package leap

// IsLeapYear tells if a year in the 
// Gregorian calendar is indeed a leap year
func IsLeapYear(year int) bool {
        return (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))
}
