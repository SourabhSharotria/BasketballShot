//
//  ShotBuffer.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 09/08/25.
//

struct ShotBuffer<T> {
    private var buffer: [T] = []

    /// Checks if the buffer is empty.
    var isEmpty: Bool {
        return buffer.isEmpty
    }

    /// The number of items currently in the buffer.
    var count: Int {
        return buffer.count
    }

    /// Initializes an empty buffer.
    init() {}
}
extension ShotBuffer {
    /// Adds a new element to the back of the queue.
    mutating func enqueue(_ element: T) {
        buffer.append(element)
    }
}

extension ShotBuffer {
    /// Removes and returns the element at the front of the queue.
    mutating func dequeue() -> T? {
        // Return nil if the buffer is empty
        guard !buffer.isEmpty else {
            return nil
        }
        // Remove the element from the front
        return buffer.removeFirst()
    }
}
