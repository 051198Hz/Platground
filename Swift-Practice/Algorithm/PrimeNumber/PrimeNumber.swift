//
//  PrimeNumber.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/04/10.
//

import Foundation

struct PrimeNumber{
    
}

extension PrimeNumber{
    static func isPrime(number: Int)->Bool{
        if number == 1 { return false }
        if number == 2 { return true }
        if number == 3 { return true }
        let r = Int(Double(number).squareRoot())
        for i in 2...r{
            if number % i == 0 {return false}
        }
        return true
    }
    static func factorization(n: Int){
        if n == 1 {return}
        var n = n
        var k = 2
        while n>1 {
            if n % k == 0{
                n /= k
                print(k)
            }else{
                k += 1
            }
        }
    }
}
