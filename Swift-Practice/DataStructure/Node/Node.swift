//
//  File.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/20.
//
class Node<T>{
    var data:T?
    var nextNode:Node<T>?
    init(data: T? = nil, nextNode: Node<T>? = nil) {
        self.data = data
        self.nextNode = nextNode
    }
    deinit{
        
    }
}
///이전 노드, 이후 노드의 포인터를 1가지 가지고 있는 노드
class DoublyNode<T>: Node<T>{
    var prevNode: Node<T>?
    init(prevNode: Node<T>? = nil, data: T? = nil, nextNode: Node<T>? = nil) {
        super.init(data: data, nextNode: nextNode)
        self.prevNode = prevNode
    }
}
