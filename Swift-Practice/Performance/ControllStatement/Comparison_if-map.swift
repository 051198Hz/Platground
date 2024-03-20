//
//  Created by 0511Hz on 2024/01/19.
//

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

let controllStatementUsingDict = {
    let someNumber: number = .ott

    let numberMap: [number:(number)->()] = [ .one: printEnterd,
                                   .two: printEnterd,
                                   .three: printEnterd,
                                   .four: printEnterd,
                                   .five: printEnterd,
                                   .ott: printEnterd ]

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
                let t1 = progressTime {
                    controllStatementUsingIf()
                }
                let t2 = progressTime {
                    controllStatementUsingDict()
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
// 2.0138863210181794
// 2.616386934881362
// 2.257623366154245
// 2.1005244431391255
// 2.053532620876221
// 2.095014726354636
// 2.6757020711947073
// 2.04956723025564
// 1.7790656289143358
// 2.4389319797621507
