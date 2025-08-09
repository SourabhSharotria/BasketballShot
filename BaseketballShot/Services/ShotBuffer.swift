//
//  ShotBuffer.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 09/08/25.
//

struct ShotBuffer<T> {
    private var buffer: [T] = []
    private let persistenceHandler: ((T) -> Void)?
    
    /// Checks if the buffer is empty.
    var isEmpty: Bool {
        buffer.isEmpty
    }

    /// The number of items currently in the buffer.
    var count: Int {
        buffer.count
    }

    /// Initializes an empty buffer.
    /// - Parameter persistenceHandler: Optional closure to persist each enqueued item.
    init(persistenceHandler: ((T) -> Void)? = nil) {
        self.persistenceHandler = persistenceHandler
    }

    /// Adds a new element to the back of the queue.
    mutating func enqueue(_ element: T) {
        buffer.append(element)
        persistenceHandler?(element) // Save to Core Data if handler is set
    }

    /// Removes and returns the element at the front of the queue.
    mutating func dequeue() -> T? {
        guard !buffer.isEmpty else { return nil }
        return buffer.removeFirst()
    }
}
