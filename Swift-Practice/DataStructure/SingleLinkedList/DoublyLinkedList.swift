//
//  DoublyLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/21.
//

class DoublyLinkedList<T:Equatable>{
    var head: DoublyNode<T>?
    @discardableResult
    func insertAtFirst(_ newNode: DoublyNode<T>)->DoublyNode<T>{
        if self.head == nil{
            self.head = newNode
            return newNode
        }
        self.head?.prevNode = newNode
        newNode.nextNode = self.head
        self.head = newNode
        return newNode
    }
}
