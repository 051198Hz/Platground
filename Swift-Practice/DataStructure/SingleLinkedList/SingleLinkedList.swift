//
//  SingleLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/20.
//

class SingleLinkedList<T>{
    var head: Node<T>?
    ///리스트 마지막에 노드 추가
    @discardableResult
    func appendNode(_ newNode: Node<T>)->Node<T>{
        if let head = self.head{
            var tail = head
            while(tail.nextNode != nil){
                tail = tail.nextNode!
            }
            tail.nextNode = newNode
        }else{
            self.head = newNode
        }
        return newNode
    }
    ///리스트 마지막 노드 제거
    @discardableResult
    func removeLastNode()->Node<T>?{
        if self.head == nil{
            print("List is empty")
            return nil
        }
        
        if self.head?.nextNode == nil {
            var removeNode = self.head
            self.head = nil
            return removeNode
        }
        
        if let head = self.head{
            var tail = head
            while(tail.nextNode?.nextNode != nil){
                tail = tail.nextNode!
            }
            var removeNode = tail.nextNode
            tail.nextNode = tail.nextNode?.nextNode
            return removeNode
        }
        return nil
    }
    //리스트의 특정위치의 노드 제거
    @discardableResult
    func removeNodeAt(_ idx: Int)->Node<T>?{
        if self.head == nil{
            print("List is empty")
            return nil
        }
        var currentNode = self.head
        for _ in 0..<idx-1{
            if currentNode?.nextNode?.nextNode == nil {break}
            currentNode = currentNode?.nextNode
        }
        let removeNode = currentNode?.nextNode
        currentNode?.nextNode = currentNode?.nextNode?.nextNode
        return removeNode
    }
    
}
