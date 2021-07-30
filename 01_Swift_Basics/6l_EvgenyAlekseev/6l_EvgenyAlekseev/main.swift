//
//  main.swift
//  6l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 29.07.2021.
//

var myQ = Queue<Int>()
myQ.enqueue(0, 1, 2)

print("*** Basic queue methods check: ***")
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

print("\n*** Checking high-order functions' implementation: ***")
var myNewQ = Queue<Int>()
myNewQ.enqueue(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
print("My new queue:", myNewQ)

var myNewQFiltered = myNewQ.filter({ $0 % 2 != 0 })
print("My new queue filtered:", myNewQFiltered)

var myNewQMapped = myNewQ.map({ $0 * $0 })
print("My new queue mapped:", myNewQMapped)

var myNewQReduced = myNewQ.reduce(1, { $0 * $1 })
print("My new queue reduced result:", myNewQReduced)

myNewQ.forEach({ print($0 * 3) })
