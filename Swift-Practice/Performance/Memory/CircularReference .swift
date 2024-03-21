//
//  CircularReference .swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/21.
//
class Object:AddressPrinter{
    var lover: Subject?
}
class Subject:AddressPrinter{
    var lover: Object?
}
class WObject:AddressPrinter{
    weak var lover: WSubject?
}
class WSubject:AddressPrinter{
    var lover: WObject?
}
class AddressPrinter{
    let name: String
    init(_ name: String){
        self.name = name
        print( "\(Unmanaged.passUnretained(self).toOpaque()) \(type(of: self)): \(self.name) allocated")

    }
    deinit{
        print( "\(Unmanaged.passUnretained(self).toOpaque()) \(type(of: self)): \(self.name) deallocated")
    }
}

func simulateCircularRef(){
    
    var kim:Object? = Object("kim") //kim의 참조횟수 1
    var lee:Subject? = Subject("lee") //lee의 참조횟수 1

    kim?.lover = lee //kim의 참조횟수 1, lee의 참조횟수 1
    lee?.lover = kim //kim의 참조횟수 2, lee의 참조횟수 2

    lee = nil //lee의 참조횟수 1, kim의 참조횟수 2
    kim = nil //kim의 참조횟수 1, lee의 참조횟수 1
    
    var park:WObject? = WObject("park") //park의 참조횟수 1
    var ku:WSubject? = WSubject("ku") //ku의 참조횟수 1

    park?.lover = ku //ku의 참조횟수 1, park의 참조횟수 1
    ku?.lover = park //ku의 참조횟수 1, park의 참조횟수 2
    
    ku = nil //ku의 참조횟수 0, park의 참조횟수 1
    //ARC는 어떤 인스턴스가 메모리에서 해제되었을 때, 그 인스턴스의 프로퍼티가 다른 인스턴스의 프로퍼티를 가르키고 있다면
    //프로퍼티가 가르키던 인스턴스의 RC를 1 감소시킨다.
    park = nil //park의 참조횟수 0
}
