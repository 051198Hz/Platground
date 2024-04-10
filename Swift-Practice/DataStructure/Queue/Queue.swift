//
//  Queue.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/04/10.
//

import Foundation

class Queue<T>{
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
}
