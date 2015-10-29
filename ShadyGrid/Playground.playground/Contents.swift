//: Playground - noun: a place where people can play

import UIKit

let count = 3

var array = Array<Array<Double>>()

for _ in 1...count {
    array.append(Array(count: count, repeatedValue: Double()));
}

print(array)