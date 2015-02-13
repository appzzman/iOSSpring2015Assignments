numbers.map({(number:Int)->Int in
    let result = 10 * number
    return result
})

numbers.map(
    {
      (number: Int) -> Int in
        if number % 2 != 0 {return 0}
        let result = 3 * number
    return result
    }

)
