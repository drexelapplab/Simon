import UIKit
import XCPlayground
import PlaygroundSupport
//: Playground - noun: a place where people can play

import UIKit

var simon = SimonController (page: PlaygroundPage.current)

var seq = SimonController.randomSequence(of: 6)

simon.loadSequence(seq: seq)

