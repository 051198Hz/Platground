//
//  SingleLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/20.
//

class SingleLinkedList<T>{
    var head: Node<T>?
    ///리스트 마지막에 노드 추가
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
    ///노드 제거
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
    
}
