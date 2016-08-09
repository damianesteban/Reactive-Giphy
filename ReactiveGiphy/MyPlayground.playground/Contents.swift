//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let dateString = "1970-01-01 00:00:00"

let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

let d1 = dateFormatter.dateFromString("1970-01-01 00:00:00")
let d2 = dateFormatter.dateFromString("2016-01-10 00:00:02")
let d3 = dateFormatter.dateFromString("0000-00-00 00:00:00")

let x = d1?.compare(d2!)

print(dateFormatter.dateFromString(dateString))

// pseudocode:


// Inputs
//let filterForRating: PublishSubject<Bool>
//
//func fetchSearchResults(filter: Bool) -> Observable<Object> {
//    return provider.request
//        //..
//        //..
//        .mapJSON()
//    switch filter {
//    case true:
//        .filter($0.IsRatedR)
//        return objects
//    case false:
//        .filter($0.IsRatedR)
//        return objects
//    }
//}

struct Dude {
    let name: String
    let hair: String
}

struct Bob {
    let name: String
    let hair: String
}

let bs = [Bob(name: "asas", hair: "asas"), Bob(name: "asas", hair: "asas"), Bob(name: "asas", hair: "asas"), Bob(name: "asas", hair: "asas")]

let ds = [Dude(name: "wewewe", hair: "qwqwqw"), Dude(name: "wewewe", hair: "qwqwqw"), Dude(name: "wewewe", hair: "qwqwqw"), Dude(name: "wewewe", hair: "qwqwqw")]

let new = bs.map




