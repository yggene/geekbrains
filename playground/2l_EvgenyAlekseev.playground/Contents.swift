// 1. Compose a func to check if a number is even
func isEven(_ num: Int) -> Bool {
    num % 2 == 0
}


// 2. Compose a func to check if a number is divided by 3 without remainder
func isDivisibleByThree(_ num: Int) -> Bool {
    num % 3 == 0
}


// 3. Create an ascending array from 1 to 100
var newArr = [Int]()
for i in 1...100 {
    newArr.append(i)
}


// 4. Remove all numbers that are even and not divisible by 3 from newArr
newArr.removeAll(where: { isEven($0) || !isDivisibleByThree($0) })
print(newArr)


// 5. Compose a function to add n Fibonacci numbers to an array, negative numbers excluded
func fibonacciArray(count n: Int) -> [Int] {
    var result = [Int]()
    
    guard n >= 0 else { return result }
    
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


// 6. Fill an array with prime numbers up to n, negative numbers excluded
func primesArray(in n: Int) -> [Int] {
    var result = [Int]()
    var boolArray = [Bool]()
    
    guard n >= 0 else { return result }
    
    for _ in 0 ... n {
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


