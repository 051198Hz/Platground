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
}
