//
//  ifStatementTimeComplexity.swift
//  exPS
//
//  Created by Yune gim on 2024/01/19.
//
//import Foundation
//func printEnterd(){
//    print("Entered")
//}

import Foundation

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return (diff)
}

enum number: Int{
    case one = 1
    case two
    case three
    case four
    case five
    case ott = 123
}

let printEnterd = { (_number:number) in
    print(" ", terminator: "")
}

let controllStatementUsingIf = {
    let someNumber :number = .ott
    
    if someNumber == .one{
        printEnterd(someNumber)
    }else if(someNumber == .two){
        printEnterd(someNumber)
    }else if(someNumber == .three){
        printEnterd(someNumber)
    }else if(someNumber == .four){
        printEnterd(someNumber)
    }else if(someNumber == .five){
        printEnterd(someNumber)
    }else if(someNumber == .ott){
        printEnterd(someNumber)
    }
}

let controllStatementUsingSwitch = {
    let someNumber :number = .ott
    switch someNumber {
    case .one:
        printEnterd(someNumber)
    case .two:
        printEnterd(someNumber)
    case .three:
        printEnterd(someNumber)
    case .four:
        printEnterd(someNumber)
    case .five:
        printEnterd(someNumber)
    case .ott:
        printEnterd(someNumber)
    }
}

let numberMap: [number:(number)->()] = [ .one: printEnterd,
                               .two: printEnterd,
                               .three: printEnterd,
                               .four: printEnterd,
                               .five: printEnterd,
                               .ott: printEnterd ]

let controllStatementUsingDict = {
    let someNumber: number = .ott



    let doNumber: (number)->() = numberMap[someNumber, default: { _ in print("case not founded") } ]

    doNumber(someNumber)
}

var lastavg: Double = .zero
var oldavg: Double = .zero
var avgTime: Double = .zero
var avgList: [Double] = []
for _ in 0..<10 {
    for _ in 0..<10 {
        for _ in 0..<10 {
            for _ in 0..<1000{
                //compairson if and swiftch
                let t1 = progressTime {
                    controllStatementUsingIf()
                }
                let t2 = progressTime {
                    controllStatementUsingSwitch()
                }
                
                //    print("controll statement using if \ntime:" + """
                //    \(t1)
                //    """)
                //
                //    print("controll statement using dict(map) \ntime:" + """
                //    \(t2)
                //    """)
                
                avgTime = {
                    let t = t2 / t1
                    if( avgTime == .zero){
                        return t
                    }
                    return (avgTime + t) / 2
                }()
            }
            oldavg = {
                if( oldavg == .zero){
                    return avgTime
                }
                return (oldavg + avgTime) / 2
            }()
        }
        lastavg = {
            if( lastavg == .zero){
                return oldavg
            }
            return (lastavg + oldavg) / 2
        }()
    }
    avgList.append(lastavg)
}
for i in avgList{
    print(i)
}
// 1.1072280641180905
// 0.8625729924869092
// 0.8204535808823783
// 1.080544454666544
// 0.9696689019153237
// 1.0455069732656839
// 0.8854966695881413
// 1.0777198223885485
// 1.0216661510294691
// 0.8823759493646446
