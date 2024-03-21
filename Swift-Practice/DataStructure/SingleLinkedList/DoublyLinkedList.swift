//
//  DoublyLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/21.
//

class DoublyLinkedList<T:Equatable>{
    var head: DoublyNode<T>?
    ///리스트의 처음에 노드 추가
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
    ///리스트의 처음 노드를 삭제
    @discardableResult
    func removeFirst()->DoublyNode<T>?{
        if self.head == nil{
            return nil
        }
        var removeNode = self.head
        self.head = self.head?.nextNode
        self.head?.prevNode = nil
        return removeNode
    }
    
}
