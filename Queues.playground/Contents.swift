import UIKit

// MARK: - QUEUES

// A FIFO datastructure (First In First Out)

// An analogy is a queue of people: the person first in line will be the first one out
// contrast that with a stack of books (LIFO), where you pick up the last book you put on top

// use APPEND + POP

// MARK: - BIG O OF QUEUES
/*
 Insertion O(1)
 Removal O(1)
 Searching O(N)
 Access O(N)
 */


// MARK: - USING ARRAYS

var queue = [String]()

queue.append("FIRST")
queue.append("SECOND")
queue.append("THIRD")

// removing the first thing that was added to the array -> FIFO

queue.removeFirst()
queue.removeFirst()
queue.removeFirst()

queue

// MARK: - CREATING OWN QUEUE FROM SCRATCH

class Node<T> {

    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}


// MARK: - PUSH

struct Stack<T> {

    var head: Node<T>?
    var tail: Node<T>?
    var size = 0
    
    var isEmpty: Bool { head == nil }
    
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func dequeue() -> Node<T>? {
        // return if the list is empty (because there isnt anything to remove)
        guard let head = head else { return nil }
        // if there is just one node, that would mean head.next == nil, so we could use pop
        guard head.next != nil else {
            self.head = nil
            self.tail = nil
            return nil
        }
        
        var newTail = head
        var currentNode = head
        
        while let next = currentNode.next {
            // newTail is being set to the currentNode, thus newTail lags behind
            newTail = currentNode
            // currentNode gets set to the next node
            currentNode = next
        }
        
        newTail.next = nil
        tail = newTail
        return currentNode
    }
}


