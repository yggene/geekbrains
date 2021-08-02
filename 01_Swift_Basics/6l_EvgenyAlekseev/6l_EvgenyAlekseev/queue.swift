//
//  queue.swift
//  6l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 29.07.2021.
//

struct Queue<T> {
    private var elements: [T] = []
    
    // add to queue
    mutating func enqueue(_ elements: T...) {
        for element in elements {
            self.elements.append(element)
        }
    }
    
    // remove from queue
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    //Check if queue is empty
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // return length of a queue
    var count: Int {
        return elements.count
    }
    
    // get the first element of a queue without removing it
    func peek() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.first
    }
    
    // forEach implemented
    func forEach(_ action: (T) -> Void) {
        for element in elements {
            action(element)
        }
    }
    
    // filter implemented
    func filter(_ condition: (T) -> Bool) -> [T] {
        var result: [T] = []
        for element in elements {
            if condition(element) {
                result.append(element)
            }
        }
        return result
    }
    
    // map implemented
    func map(_ action: (T) -> T) -> [T] {
        var result: [T] = []
        for element in elements {
            result.append(action(element))
        }
        return result
    }
    
    // reduce implemented
    func reduce(_ accumulator: T,
                _ action: (T, T) -> T) -> T {
        var result = accumulator
        for element in elements {
            result = action(result, element)
        }
        return result
    }
    
    // subscript to return nil when trying to get index out of range
    subscript(_ index: Int) -> T? {
        guard elements.indices.contains(index) else { return nil }
        return elements[index]
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return elements.description
    }
}
