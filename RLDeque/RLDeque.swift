import Foundation

class RLNode<T> {
    private var key: T? = nil
    private var next: RLNode<T>? = nil
    private var prev: RLNode<T>? = nil
}

public class RLDeque<T> {
    private var front: RLNode<T>! = RLNode<T>()
    private var back: RLNode<T>! = RLNode<T>()
    private var size: Int? = 0
    
    func insert_back(var key: T) {
        var item: RLNode<T>! = RLNode<T>()
        item.key = key
        
        if size == 0 { front = item }
        else if size == 1 {
            back = item
            front.next = back
            back.prev = front
        } else {
            back.next = item
            item.prev = back
            back = item
        }
        
        size = size! + 1
    }
    
    func insert_front(var key: T) {
        var item: RLNode<T>! = RLNode<T>()
        item.key = key
        
        if size == 0 { front = item }
        else if size == 1 {
            back = front
            back.prev = item
            item.next = back
            front = item
        } else {
            item.next = front
            front.prev = item
            front = item
        }
        
        size = size! + 1
    }
    
    func remove_front() -> T? {
        var removedValue: T?
        
        if size == 0 { return nil }
        else if size == 1 {
            removedValue = front.key
            front = nil
            back = nil
        } else {
            removedValue = front.key
            front = front.next
            front.prev = nil
        }
        
        size = size! - 1
        return removedValue
    }
    
    func remove_back() -> T? {
        var removedValue: T?
        
        if size == 0 { return nil }
        else if size == 1 {
            removedValue = front.key
            front = nil
            back = nil
        } else {
            if size == 2 {
                removedValue = back.key
                front.next = nil
                back = nil
            } else {
                removedValue = back.key
                back = back.prev
                back.next = nil
            }
        }
        
        size = size! - 1
        return removedValue
    }
    
    func peek() -> T? { return size == 0 ? nil: front.key }
    
    func print() {
        var current: RLNode<T>? = front
        
        while current != nil {
            println(current!.key!)
            current = current?.next
        }
    }
}