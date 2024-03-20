//
//  SingleLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/20.
//

class SingleLinkedList<T>{
    var head: Node<T>?
    ///노드 추가
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
}
