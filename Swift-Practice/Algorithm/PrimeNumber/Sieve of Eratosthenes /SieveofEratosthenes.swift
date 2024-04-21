//
//  SieveofEratosthenes.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/04/10.
//

extension PrimeNumber{
    ///[start, end] 사이의 소수를 출력하는 함수
    ///
    ///     let input = readLine()!.split(separator: " " ).map { Int(String($0))! }
    ///     getPrimeNumber(start: input[0], end: input[1])
    ///
    @discardableResult
    static func getPrimeNumber(start: Int, end: Int, flag: Bool = false)->Int{
        let start = start == 1 ? 2 : start
        if end <= 3{
            var count = Int.zero
            for i in start...end{
                count += 1
                if flag { print(i) }
            }
            return count
        }
        
        var numbers = Array(start...end)
        let end = Int(Double(end).squareRoot())
        
        for i in 2...end{
            numbers = numbers.filter{
                !(($0 != i) && ($0 % i == 0))
            }
        }
        if flag { numbers.forEach{ print($0) } }
        return numbers.count
    }
}
