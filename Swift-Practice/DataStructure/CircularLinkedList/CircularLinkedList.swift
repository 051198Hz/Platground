//
//  CircularLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/25.
//
///헤드의 이전 노드가 테일, 테일의 다음 노드가 헤드를 가리키는 링크드 리스트
class CircularLinkedList<T>{
    var head: DoublyNode<T>?
    weak var tail: DoublyNode<T>?
    ///리스트의 처음에 노드 추가
    func inertAtFirst(_ newNode: DoublyNode<T>){
        if self.head == nil{
            self.head = newNode
            self.tail = newNode
            head?.prevNode = newNode
            tail?.nextNode = newNode
            return
        }
        newNode.nextNode = self.head
        newNode.prevNode = self.tail
        self.head = newNode
        self.tail?.nextNode = newNode
    }
    //리스트의 특정 위치에 노드 삽입
    func insertAt(_ idx: Int, _ newNode: DoublyNode<T>)->DoublyNode<T>?{
        if self.head == nil {return nil}
        var currentNode = self.head
        for _ in 0..<idx{
            if currentNode == nil {return nil}
            currentNode = currentNode?.nextNode
        }
        currentNode?.prevNode?.nextNode = newNode
        currentNode?.prevNode = newNode
        newNode.nextNode = currentNode
        newNode.prevNode = currentNode?.prevNode
        return newNode
    }
    ///리스트의 마지막에 노드 추가
    func insertAtLast(_ newNode: DoublyNode<T>){
        if self.head == nil {
            self.head = newNode
            self.tail = newNode
            head?.prevNode = newNode
            tail?.nextNode = newNode
            return
        }
        self.tail?.nextNode = newNode
        newNode.prevNode = self.tail
        newNode.nextNode = self.head
        self.head?.prevNode = newNode
    }
    ///리스트의 처음 노드를 삭제
    @discardableResult
    func removeFirst()->DoublyNode<T>?{
        if self.head == nil{
            return nil
        }
        var removeNode = self.head
        self.head = self.head?.nextNode
        self.head?.prevNode = self.tail
        self.tail?.nextNode = self.head
        return removeNode
    }
    ///리스트의 특정 위치 노드를 삭제
    @discardableResult
    func removeAt(_ idx: Int)->DoublyNode<T>?{
        if self.head == nil {return nil}
        var removeNode = self.head
        for _ in 0..<idx{
            if removeNode?.nextNode == nil {return nil}
            removeNode = removeNode?.nextNode
        }
        removeNode?.nextNode?.prevNode = removeNode?.prevNode
        removeNode?.prevNode?.nextNode = removeNode?.nextNode
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
