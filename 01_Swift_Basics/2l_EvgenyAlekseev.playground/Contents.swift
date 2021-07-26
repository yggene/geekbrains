// 1. Compose a func to check if a number is even
func isEven(_ num: Int) -> Bool {
    num % 2 == 0
}


// 2. Compose a func to check if a number is divided by 3 without remainder
func isMultipleOfThree(_ num: Int) -> Bool {
    num.isMultiple(of: 3)
}


// 3. Create an ascending array from 1 to 100
var newArr = [Int]()
for i in 1...100 {
    newArr.append(i)
}

// 3. Solution #2
newArr = [Int](1...100)


// 4. Remove all numbers that are even and not divisible by 3 from newArr. Solution #1
newArr.removeAll(where: { isEven($0) || !isMultipleOfThree($0) })
print(newArr)

// 4. Solution #2
for num in newArr {
    if isEven(num) || !isMultipleOfThree(num) {
        newArr.remove(at: newArr.firstIndex(of: num)!)
    }
}
print(newArr)


// 5. Compose a function to add n Fibonacci numbers to an array, negative numbers excluded
func fibonacciArray(count n: Int) -> [Int] {
    var result = [Int]()
    
    if n < 0 { return result }
    
    for i in 0 ..< n {
        if i == 0 {
            result.append(0)
        } else if i == 1 {
            result.append(1)
        } else {
            result.append(result[i - 1] + result[i - 2])
        }
    }

    return result
}

print(fibonacciArray(count: 50))


// 6. Fill an array with prime numbers up to n, negative numbers excluded. Solution #1
func primesArray(in n: Int) -> [Int] {
    var result = [Int]()
    var boolArray = [Bool]()

    if n < 0 { return result }

    for _ in 0...n {
        boolArray.append(true)
    }

    for p in stride(from: 2, through: n, by: 1) {
        if !boolArray[p] {
            continue
        }
        result.append(p)
        for i in stride(from: p + p, through: n, by: p) {
            boolArray[i] = false
        }
    }
    
    return result
}

print(primesArray(in: 100))


// 6. Solution #2, almost the same, but using a single array
func anotherPrimesArray(in n: Int) -> [Int] {
    var result = [Int]()
    
    if n <= 0 { return result }
    
    for i in 0...n {
        result.append(i)
    }

    for p in stride(from: 2, through: n, by: 1) {
        if result[p] == -1 {
            continue
        }
        for i in stride(from: p + p, through: n, by: p) {
            result[i] = -1
        }
    }
    
    return result.filter({ num in
        num > 1
    })
}

print(anotherPrimesArray(in: 100))
