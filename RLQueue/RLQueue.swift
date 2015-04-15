import Foundation

class RLNode<T> {
    private var key: T? = nil
    private var next: RLNode<T>? = nil
    private var prev: RLNode<T>? = nil
}

public class RLQueue<T> {
    private var front: RLNode<T>! = RLNode<T>()
    private var back: RLNode<T>! = RLNode<T>()
    private var size: Int? = 0
    
    func insert(var key: T) {
        var insertNode: RLNode<T>! = RLNode<T>()
        insertNode.key = key
        
        if size == 0 { front = insertNode }
        else {
            if back.key == nil {
                insertNode.prev = front
                front.next = insertNode
            } else {
                insertNode.prev = back
                back?.next = insertNode
            }
            
            back = insertNode
        }
        
        size = size! + 1
    }
    
    func remove() -> T? {
        if size == 0 { return nil }
        var valueRemoved: T? = front!.key
        
        if front.next != nil {
            front.next?.prev = nil
            front = front.next
        } else { front = nil }
        
        size = size! - 1
        return valueRemoved
    }
    
    func peek() -> T? { return size == 0 ? nil: front.key! }
    func empty() -> Bool { return size == 0 ? true: false }
}
