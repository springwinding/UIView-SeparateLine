//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
private var key = ""
var array = objc_getAssociatedObject(str, &key)
var arrays = ["123"]
objc_setAssociatedObject(str, &key, arrays, .OBJC_ASSOCIATION_RETAIN)
let test = objc_getAssociatedObject(str, &key)
test
arrays.append("456")



