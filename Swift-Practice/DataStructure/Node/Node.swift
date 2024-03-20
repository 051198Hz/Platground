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
