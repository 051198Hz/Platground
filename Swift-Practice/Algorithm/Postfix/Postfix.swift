//
//  Postfix.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/04/05.
//
struct Postfix{
    static func getPostfix(Infix: String)->String?{
        let infix = Infix.components(separatedBy: [" "]).joined()
        var stack = Stack<Character>()
        var postfix = String()
        for element in infix{
            if element.isNumber || element == "."{
    //        if element.isUppercase{
                postfix.append(element)
            }else{
                if postfix.last != " " { postfix.append(" ") }
                if element == ")"{
                    while(stack.isEmpty == false){
                        if stack.top! == "(" {
                            _ = stack.pop()!
                            break
                        }
                        postfix.append(stack.pop()!)
                    }
                }else{
                    while(stack.isEmpty == false){
                        //스택 안에 남아있는 연산자가 자신보다 높으면 안됨
                        //즉, 스택 top과 현재 op를 비교하여, top이 높지 않으면 break
                        if stack.top!.isPrior(Op: element) == false {break}
                        if element != "(" {
                            postfix.append(stack.pop()!)
                        }
                    }
                    stack.push(element)
                }
            }
        }
        while(stack.isEmpty == false){
            if postfix.last != " " { postfix.append(" ") }
            postfix.append(stack.pop()!)
        }
        return postfix
    }
}

extension Character{
    func isPrior(Op:Character)->Bool{
        //우선순위이므로 부등호의 방향은 반대
        return self.priority(inStack: true) <= Op.priority(inStack: false)
    }
    func priority(inStack:Bool)->Int{
        enum priority:Character{
            case LEFT_PARENT = "("
            case RIGHT_PARENT = ")"
            case PLUS = "+"
            case MINUS = "-"
            case MULTIPLY = "*"
            case DEVIDE = "/"
        }
        switch priority(rawValue: self){
        case .LEFT_PARENT:
            return inStack ? 3 : 0
        case .MULTIPLY,.DEVIDE:
            return 1
        case .PLUS,.MINUS:
            return 2
        default:
            return 987654321
        }
    }
}
