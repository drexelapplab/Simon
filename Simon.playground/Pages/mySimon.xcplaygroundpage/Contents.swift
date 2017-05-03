import UIKit
import XCPlayground
import PlaygroundSupport
/*: 
 #Introduction 
 
 */

var simon = SimonController (page: PlaygroundPage.current)

var seq = simon.randomSequence(of: 4)

simon.loadSequence(seq: seq)

