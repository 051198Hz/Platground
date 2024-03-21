//
//  DoublyLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/21.
//
///더블 링크드 리스트, 특정 노드는 이전 노드와 이후 노드의 정보를 가지고 있다.
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
    ///리스트내 특정 위치에 노드 추가
    @discardableResult
    func InsertNodeAt(_ newNode:DoublyNode<T>, _ idx: Int) -> DoublyNode<T>?{
        if self.head == nil { return nil}
        var currentNode = self.head
        for _ in 0..<idx{
            if currentNode == nil {return nil}
            currentNode = currentNode?.nextNode
        }
        if currentNode?.prevNode == nil{
            self.head = newNode
        }
        currentNode?.prevNode = newNode
        newNode.nextNode = currentNode
        newNode.prevNode = nil
        return newNode
    }
    ///리스트의 가장 마지막에 노드를 추가
    @discardableResult
    func appendNode(_ newNode: DoublyNode<T>)->DoublyNode<T>{
        if self.head == nil {
            self.head = newNode
            return newNode
        }
        var tail = self.head
        while(tail?.nextNode != nil){
            tail = tail?.nextNode
        }
        newNode.nextNode = tail?.nextNode
        newNode.prevNode = tail
        tail?.nextNode = newNode
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
    ///리스트의 특정 위치 노드를 삭제
    @discardableResult
    func removeAt(_ idx: Int)->DoublyNode<T>?{
        if self.head == nil {return nil}
        var removeNode = self.head
        for _ in 0..<idx{
            if removeNode == nil {return nil}
            removeNode = removeNode?.nextNode
        }
        removeNode?.prevNode?.nextNode = removeNode?.nextNode
        removeNode?.nextNode?.prevNode = removeNode?.prevNode
        removeNode?.prevNode = nil
        removeNode?.nextNode = nil
        return removeNode
    }
    ///리스트내 특정 위치의 노드 반환
    @discardableResult
    func getNodeAt(_ idx: Int) -> DoublyNode<T>?{
        if self.head == nil { return nil}
        var currentNode = self.head
        for _ in 0..<idx{
            if currentNode == nil {return nil}
            currentNode = currentNode?.nextNode
        }
        return currentNode
    }
}
