//
//  Queue.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/04/10.
//

import Foundation

struct Queue<T>{
    fileprivate var nodes = Array<T>()
    var front: T?{
        return nodes.first
    }
    var rear: T?{
        return nodes.last
    }
    var count: Int{
        return nodes.count
    }
    mutating func enqueue(element: T){
        self.nodes.append(element)
    }
}
