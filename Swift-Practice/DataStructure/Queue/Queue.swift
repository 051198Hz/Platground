//
//  Queue.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/27.
//
///입력받은 자료에 대해 후입선출하는  자료구조
class Stack<T>{
    class Node{
        var data: T?
    }
    var capacity: Int
    fileprivate var top: Int
    fileprivate var nodes: [Node]?
    init(_ size: Int){
        self.nodes = []
        self.nodes?.reserveCapacity(size)
        self.capacity = size
        self.top = 0
    }
}
