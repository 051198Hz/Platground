//
//  Queue.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/04/10.
//

import Foundation

struct Queue<T>{
    fileprivate var inbox: [T] = []
    fileprivate var outbox: [T] = []
    var front: T?{
        return outbox.isEmpty ? inbox.first : outbox.last
    }
    var rear: T?{
        if outbox.isEmpty { return inbox.last }
        return outbox.first
    }
    var count: Int{
        return outbox.count + inbox.count
    }
    mutating func enqueue(element: T){
        inbox.append(element)
    }
    mutating func dequeue()->T?{
        if outbox.isEmpty{
            outbox = inbox.reversed()
            //Array.removeAll()은 keepingCapacity가 false일 때, O(1)의 Performance를 갖는다.
            //https://stackoverflow.com/questions/54133045/performance-array-removeall-vs
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}
