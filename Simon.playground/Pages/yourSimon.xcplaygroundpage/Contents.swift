import Foundation
import UIKit
import XCPlayground
import PlaygroundSupport
import QuartzCore
/*: 
 # Simon
 ### Here, You will be learning how to make the game Simon.
 
 */
class yourSimonController: SimonController {
    override init (page:PlaygroundPage) {
        super.init ()
/*:
 First, We need to make a screen for our game to take place in. In order to make a screen we need two things, a center point and a size for the screen. In Swift, a point is called a `CGPoint` and is created with this *command*: `CGPoint (x:,y:)`. Sizes are called `CGSize` and are created with this *command*: `CGSize (width:,height:)`. Here is how to would make a center point and size for our screen.
````
var origin = CGPoint (x:0.0, y:0.0) 
var size = CGSize (width:700.0, height: 700.0)
 ````
 */
        let origin = CGPoint (x:0.0, y:0.0) //center point
        let size = CGSize (width:700.0, height: 700.0) //size of screen
/*:
Note that the keyword `let` is a different color, so is `CGPoint` and `0.0`. The color for `let` is the computer recognizing that you are telling the computer to remember a constant `variable`. A `variable` is a peice of memory that stores a `value` and constant means that you cannot change it after it is made. The color of `CGPoint` is the computer recognizing that you are calling a `function`. A `function` is a task for the computer to do, in this case make a `CGPoint`. The color for `0.0` is the computer recognizing that are you creating a number. When the computer recognizes something it will change it's color, this is to help programmers read their code more easily.
\
Now we need to make the frame for the screen. A frame is called a `CGRect` and is created by calling the `function` `CGRect (CGPoint, CGSize)`.
````
var frame = CGRect (origin: origin, size: size)
````
*/
        let frame = CGRect (origin: origin, size: size)
/*:
All thats left to do is make the screen and tell the computer to display it. A screen is called a `UIView` and is created by calling the `function` `UIView (frame:)`. We tell the computer to display the `screen` with the following *command*: `PlaygroundPage.current.LiveView = screen`.
````
var screen = UIView (frame:frame)
PlaygroundPage.current.liveView = screen
````
*/
        let screen = UIView (frame: frame)
        PlaygroundPage.current.liveView = screen
/*:
Now that the `screen` is made, we need to add the squares. The `variables` for the squares are already created and are called `red`, `green`, `blue`, and `yellow` but we still to create them. Lets start by making origin points for each square.
````
let redOrigin
let greenOrigin
let blueOrigin
let yellowOrigin
````
You can set them to `CGPoint (x:0.0, y:0.0)` and change them later once they are displayed.
*/
        //Create origins here
/*:
The next step is to make the `CGSize` for the squares, because all the squares are the same size, we only need one. I suggest `CGSize (width:200.0, height:200.0)`.
````
let squareSize
````
*/
        //make squareSize here
/*:
Now, all thats left is to make `CGRect`s and `UIView`s for the squares and then display them. If we want to access the `variable` for the red square, we can do it with the *command*: `self.red`. If we wanted to access the green sqaure instead, we would use `self.green`. Adding a new `UIView` to an already existing screen is done with the following *command*: `screen.addSubview (UIView)`. Here is how the above steps would look like, try making them for the other 3 squares too.
````
let redRect = CGRect (origin:redOrigin, size:squareSize)
self.red = UIView (frame:redRect)
screen.addSubview (self.red!)
````
*/
        //finish making the squares here 
/*:
The squares do not show because they are black, just like the screen. You can change the color of a `UIView` with the following *command*.
````
self.red?.backgroundColor = UIColor.red
````
There are a lot of colors to choose from, here is a list: `black, gray, white, red, green, blue, cyan, yellow, magenta, orange, purple, brown`. We can access a color with the following *command*. `UIColor.color` where "color" is the name of the color we want. Try change the color of the squares. Just remember that even though we will be referencing the squares by a specific color, they do not need to be that color.
*/
        //change color of squares here 
/*:
Here is where we want to go back and change the origin point of all the squares so they are spaced out evenly. Think of the screen like a grid. the `x` line is horizontal and the `y` line is vertical. The greater the `x` and/or `y` the farther it will be from the origin. The origin is the top left corner of the screen.
\
Now that we can see the squares, lets dim them a bit so we can brighten them up when the user pressed them. Here is the *command* to dim the red sqaure.
````
self.red?.layer.alpha = 0.5
````
*/
        //dim all of the squares to 0.5 here
/*:
Now that the sqaures are ready all setup to their starting configurations, we need to make the respond to touch. This will be a three step process. 
1. write a function to run when the square is pressed. 
2. create a `UITapGestureRecognizer` to detect when a square is tapped. 
3. add the `UITapGestureRecognizer` to a sqaure so it can respond to being tapped. 
We will be writing the function to run when the square is pressed later on in this tutorial, but for now we can do steps 2 and 3. A `UITapGestureRecognizer` is made with the following *command*: `UITapGestureRecognizer (target:, action:)`. The target is `self` an the action is the name of the function we want wrapped up so the `UITapGestureRecognizer` can use it. We added a `UITapGestureRecognizer` to our button with this *command*: `addGestureRecognizer(Gesture)`. Doing steps 2 and 3 for the red square would look like this. 
````
let tapRed = UITapGestureRecognizer(target: self,
                                action:#selector (self.pressedR (_:)))
self.red?.addGestureRecognizer(tapRed)
````
Try creating and adding `UITapGestureRecognizers` for the rest of the squares. There are corresponding `functions` called `pressedG`, `pressedB`, and `pressedY` for their respective squares.
 */
        let tapRed = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedR (_:)))
        self.red?.addGestureRecognizer(tapRed)
        //create and add UITapGestureRecognizers for the rest of the squares here 
/*:
Pressing them will still not make them light up. This is because we have not done step 1 yet; we will do that later. We still have to make the start button and the light that tells the user if they got it correct or not. The name of the light is called correct and is accessed with `self.correct`. It is a `UIView` just like the squares, so lets make an origin and a size for it and then place it on the screen. 
````
let correctOrigin 
let correctSize 
let correctCGRect
````
 */
        //create and place self.correct here 
/*:
Now all thats left to do it make the start button. The start button is accessed with `self.startBtn` and is a `UILabel`. A `UILabel` is similar to a `UIView` but meant to have text inside of it. `UILabels` are made with the follow *command*: `UILabel (frame:)`. Just like `UIView` `UILabel` needs a frame which needs an origin and a size. Create them below. 
````
let startBtnOrigin 
let startBtnSize
let startBtnFrame 
```
 */
        //create self.startBtn here and put it on the screen 
/*:
The last thing we need to do here is setup the `startBtn` so that it shows the pattern of squares lighting up. Just like with making the animations for the squares there are 3 steps. We will do the last 2 here. The name of the `functions` that shows the pattern is called `showPattern` and we will make it later. Setup the `UITapGestureRecognizer` for `startBtn` below.
 */
        //setup UITapGestureRecognizer for startBtn here
    }
    
    override func loadSequence(seq: [Squares]) {
        self.sequence = seq
    }
    
    override func pressedR(_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
            self.oneTimePing(Squares.Red)
            self.input.append (Squares.Red)
            if input.count == sequence.count {
                if sequence == input {
                    self.success ()
                } else {
                    self.fail ()
                }
                input = []
            }
        }
    }
    override func pressedG(_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
            self.oneTimePing(Squares.Green)
            self.input.append (Squares.Green)
            if input.count == sequence.count {
                if sequence == input {
                    self.success ()
                } else {
                    self.fail ()
                }
                input = []
            }
        }
    }
    override func pressedB(_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
            self.oneTimePing(Squares.Blue)
            self.input.append (Squares.Blue)
            if input.count == sequence.count {
                if sequence == input {
                    self.success ()
                } else {
                    self.fail ()
                }
                input = []
            }
        }
    }
    override func pressedY(_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
            self.oneTimePing(Squares.Yellow)
            self.input.append (Squares.Yellow)
            if input.count == sequence.count {
                if sequence == input {
                    self.success ()
                } else {
                    self.fail ()
                }
                input = []
            }
        }
    }
    override func showPattern(_ recognizer: UITapGestureRecognizer) {
        if sequence.isEmpty && !isDisplaying { return }
        if isWaiting { //no cheating
            sequence = []
            isWaiting = false
        }
        isDisplaying = true
        for i in self.sequence {
            if i == .Red {
                addRedToSequence ()
            } else if i == .Green {
                addGreenToSequence ()
            } else if i == .Blue {
                addBlueToSequence ()
            } else {
                addYellowToSequence ()
            }
        }
        startSequence ()
    }
    
    
    override func randomSequence (of:Int) -> [Squares] {
        var seq:[Squares] = []
        for _ in 1...of {
            var t:Squares
            let i = arc4random_uniform(4)
            if i == 0 {
                t = .Red
            } else if i == 1 {
                t = .Green
            } else if i == 2 {
                t = .Blue
            } else {
                t = .Yellow
            }
            seq.append (t)
        }
        return seq
    }
    
}
var simon = yourSimonController (page: PlaygroundPage.current)


//: [Next](@next)
