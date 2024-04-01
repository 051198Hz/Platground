//
//  Queue.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/27.
//
///입력받은 자료에 대해 후입선출하는  자료구조
class Stack<T>{
    var count: Int{
        return self.stack.count
    }
    var isEmpty: Bool{
        return stack.isEmpty
    }
    private var stack: [T] = []
    ///새 노드를 스택 위에 올림
    func push(_ data: T){
        self.stack.append(data)
    }
    ///스택 최상단 노드의 데이터를 반환 후 노드 삭제
    func pop()->T?{
        return self.stack.popLast()
    }
}
