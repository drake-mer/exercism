pub fn is_armstrong_number(num: u32) -> bool {
    println!("number {}", num);
    println!("digits {}", digits(num).into_iter().map(|x| x.to_string()).collect::<Vec<String>>().join(", "));
    println!("sum {}", armstrong_sum(num));
    return armstrong_sum(num) == num
}

pub fn digits(num: u32) -> Vec<u32> {
    // use integer division to produce the digits in reverse order
    // of a given unsigned integer.
    let mut output = Vec::new();

    if num == 0 {
        // no digit here since the input argument is 0
        return output;
    }
    let mut reminder = num % 10;
    let mut _dividend = num / 10;
    output.push(reminder); 
    while _dividend != 0 {
        // 
        reminder = _dividend % 10;
        _dividend = _dividend / 10;
        output.push(reminder) ;
    }
    return output;
}


pub fn exponent(num: u32, power: usize)-> u32 {
    let mut result = num;
    let mut k = 1;
    if power == 0 {
        return 1
    }
    while k < power {
        result *= num;
        k += 1;
    }
    return result;
}


pub fn armstrong_sum(num: u32) -> u32 {
    let number_digits: Vec<u32> = digits(num);
    let exponent_ = number_digits.len();
    let mut result = 0;
    for element in &number_digits {
        result += exponent(*element, exponent_)
    }
    return result;
}
