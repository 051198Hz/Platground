//
//  main.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/20.
//

var myDLL: DoublyLinkedList<Int>? = DoublyLinkedList<Int>()
for i in 0..<10{
    myDLL!.appendNode(DoublyNode(data: i))
}
myDLL!.printReverse()
myDLL = nil
