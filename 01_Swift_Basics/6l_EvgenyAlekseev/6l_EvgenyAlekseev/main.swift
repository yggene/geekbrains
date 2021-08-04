//
//  main.swift
//  6l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 29.07.2021.
//

// testing basic functions on arrays of Int
var myQ = Queue<Int, Any>()
myQ.enqueue(0, 1, 2)

print("*** Checking basic methods: ***")
print("My Queue: \(myQ)")
print("My Queue count: \(myQ.count)")
print("The first element of my queue:", myQ.peek() ?? "It's empty!")
print("Dequeueing:", myQ.dequeue() ?? "nothing!")
print("And now the first element is:", myQ.peek() ?? "It's empty")
print("And the whole queue is:", myQ)

print("\n*** Checking indices: ***")
print("Index 0:", myQ[0] ?? "It's empty!")
print("Index -1:", myQ[-1] ?? "It's empty!")
print("Index 2:", myQ[2] ?? "It's empty!")
print("Index 1:", myQ[1] ?? "It's empty!")

// testing high-order functions on arrays of Arrays
var myNewQ = Queue<Array<Int>, Any>()
myNewQ.enqueue([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])

print("\n*** Checking high-order functions: ***")
print("My new queue:", myNewQ)

var myNewQFiltered = myNewQ.filter({ $0.contains(5) || $0.contains(1) })
print("My new queue filtered:", myNewQFiltered)

var myNewQMapped = myNewQ.map({ $0 + [($0.last ?? 0) + 1] })
print("My new queue mapped:", myNewQMapped)

var myNewQReduced = myNewQ.reduce([], { $0 as! Array<Any> + $1 })
print("My new queue reduced result:", myNewQReduced)

myNewQ.forEach({ print($0) })
