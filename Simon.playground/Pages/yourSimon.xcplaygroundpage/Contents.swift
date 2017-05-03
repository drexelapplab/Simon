import Foundation
import UIKit
import XCPlayground
import PlaygroundSupport
import QuartzCore
class yourSimonController: SimonController {
/*:
 # Simon
 ### Here, you will be learning how to make the game Simon.
 - - - 
 ## Init
 */
    override init (page:PlaygroundPage) {
        super.init ()
/*:
## CGPoint and CGSize
 First, We need to make a screen for our game to take place in. In order to make a screen we need two things, a center point and a size for the screen. In Swift, a point is called a `CGPoint` and is created with this **command**: `CGPoint (x:,y:)`. Sizes are called `CGSize` and are created with this **command**: `CGSize (width:,height:)`. Here is how to would make a center point and size for our screen.
````
var origin = CGPoint (x:0.0, y:0.0) 
var size = CGSize (width:700.0, height: 700.0)
 ````
 */
        let origin = CGPoint (x:0.0, y:0.0) //center point
        let size = CGSize (width:700.0, height: 700.0) //size of screen
/*:
Note that the keyword `let` is a different color, so is `CGPoint` and `0.0`. The color for `let` is the computer recognizing that you are telling the computer to remember a constant `variable`. A `variable` is a peice of memory that stores a `value` and constant means that you cannot change it after it is made. The color of `CGPoint` is the computer recognizing that you are calling a `function`. A `function` is a task for the computer to do, in this case make a `CGPoint`. The color for `0.0` is the computer recognizing that are you creating a number. When the computer recognizes something it will change it's color, this is to help programmers, like you, read their code more easily.
## CGRect
Now we need to make the frame for the screen. A frame is called a `CGRect` and is created by calling the `function` `CGRect (CGPoint, CGSize)`.
````
var frame = CGRect (origin: origin, size: size)
````
*/
        let frame = CGRect (origin: origin, size: size)
/*:
## UIView
All thats left to do is make the screen and tell the computer to display it. A screen is called a `UIView` and is created by calling the `function` `UIView (frame:)`. We tell the computer to display the `screen` with the following **command**: `PlaygroundPage.current.LiveView = screen`.
````
var screen = UIView (frame:frame)
PlaygroundPage.current.liveView = screen
````
*/
        let screen = UIView (frame: frame)
        PlaygroundPage.current.liveView = screen
/*:
Now that the `screen` is made, we need to add the squares. The `variables` for the squares are already created and are called `red`, `green`, `blue`, and `yellow` but we still make their frames. Lets start by making origin points for each square.
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
## Adding Subviews
Now, all thats left is to make `CGRect`s and `UIView`s for the squares and then display them. If we want to access the `variable` for the red square, we can do it with the **command**: `self.red`. If we wanted to access the green sqaure instead, we would use `self.green`. Adding a new `UIView` to an already existing screen is done with the following **command**: `screen.addSubview (UIView)`. Here is how the above steps would look like, try making them for the other 3 squares too.
````
let redRect = CGRect (origin:redOrigin, size:squareSize)
self.red = UIView (frame:redRect)
screen.addSubview (self.red!)
````
*/
        //finish making the squares here 
/*:
## UIColor
The squares do not show because they are black, just like the screen. You can change the color of a `UIView` with the following **command**.
````
self.red?.backgroundColor = UIColor.red
````
There are a lot of colors to choose from, here is a list: black, gray, white, red, green, blue, cyan, yellow, magenta, orange, purple, brown. We can access a color with the following **command**. `UIColor.color` where "color" is the name of the color we want. Try change the color of the squares. Just remember that even though we will be referencing the squares by a specific color, they do not need to be that color.
*/
        //change color of squares here 
/*:
Here is where you will want to go back and change the origin point of all the squares so they are spaced out evenly. Think of the screen like a grid. the `x` line is horizontal and the `y` line is vertical. The greater the `x` and/or `y` the farther it will be from the origin. The origin is the top left corner of the screen.
\
Now that the squares are placed, they need to be dimmed in preperation for the blink animation. Here is the **command** to dim the red sqaure.
````
self.red?.layer.alpha = 0.5
````
*/
        //dim all of the squares to 0.5 here
/*:
## UITapGestureRecognizer
Now that the sqaures are ready all setup to their starting configurations, we need to make the respond to touch. This will be a three step process. 
1. write a function to run when the square is pressed. 
2. create a `UITapGestureRecognizer` to detect when a square is tapped. 
3. add the `UITapGestureRecognizer` to a sqaure so it can respond to being tapped. 
\
\
We will be writing the function to run when the square is pressed later on in this tutorial, but for now we can do steps 2 and 3. A `UITapGestureRecognizer` is made with the following **command**: `UITapGestureRecognizer (target:, action:)`. The target is `self` an the action is the name of the function we want wrapped up so the `UITapGestureRecognizer` can use it. We added a `UITapGestureRecognizer` to our button with this **command**: `addGestureRecognizer(Gesture)`. Doing steps 2 and 3 for the red square would look like this.
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
Now all thats left to do it make the start button. The start button is accessed with `self.startBtn` and is a `UILabel`. A `UILabel` is similar to a `UIView` but meant to have text inside of it. `UILabels` are made with the follow **command**: `UILabel (frame:)`. Just like `UIView` `UILabel` needs a frame which needs an origin and a size. Create them below. 
````
let startBtnOrigin 
let startBtnSize
let startBtnFrame 
````
 */
        //create self.startBtn here and put it on the screen 
/*:
The last thing we need to do here is setup the `startBtn` so that it shows the pattern of squares lighting up. Just like with making the animations for the squares there are 3 steps. We will do the last 2 here. The name of the `functions` that shows the pattern is called `showPattern` and we will make it later. Setup the `UITapGestureRecognizer` for `startBtn` below.
 */
        //setup UITapGestureRecognizer for startBtn here
    }
/*:
 ## loadSequence 
 */
    override func loadSequence (seq: [Squares]) {
/*:
This function will load a new sequence of squares to the controller. the sequence can be accessed by `self.sequence` and should be assigned to `seq`.
 */
        //assign self.sequence to seq here.
    }
/*:
 ## pressedR
 */
    override func pressedR (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //checks to see if the computer is looking for user input
/*:
## oneTimePing
Here is where we will code the action of the `UITapGestureRecognizer` for `self.red`. When a square is pressed there are three things that need to happen. 
1. animate to tell user it was pressed. 
2. add it's color to the user input. 
3. check if the user-entered input is done and if so, if it is correct or not.
\
\
For step 1, the **command** to animate a square is `self.oneTimePing (Square)`. To animate the red square, it would look like this. 
````
self.oneTimePing (Squares.Red)
````
There are corresponding names for the green, blue, and yellow squares: `Squares.Green`, `Squares.Blue`, and `Squares.Yellow`. Think of these as guides, while not the actual square it tells the `function` `oneTimePing` which square to use.
 */
            //add the *command* to animate the red square here
/*:
## Appending
Now to add the square to the input. to access the user input we write `self.input`. `self.input` is an `array`. an `Array` is essentially an ordered list and we are using it to store all of the inputs for the user. The **command** to add a new square to the input is `self.input.append (square)`. Here is what the **command** for adding the red square to the input `array` would look like.
````
self.input.append (Squares.Red) 
````
 */
            //add Square.Red to the input array here
/*:
## If-Statements
For the last step we will need to tell the computer to use some logic. A computer can be instructed run code only if a specified condition is true or false. We do this by making an *if-statement*, which looks like this.
````
if (condition) {
    (code)
} else {
    (other code)
}
````
For an *if-statement*, the *(code)* will be run *if* the *(condition)* is **true** and *(other code)* will be run *if* *(condition)* is **false**. This way a computer can change how it works depending on the situation. here is what an *if-statement* would look like that checks to see if enough inputs have been entered to warrant checking to see if the user entered the right squares.
````
if self.input.count == self.sequence.count {
    //code here
}
````
Note how we can tell how many squares have been input by written the **command**: `self.input.count`. This can be done for all `arrays`(yes, this means `self.sequence` is also an `array`. We can tell if two `arrays` are equal, or the same, with the following **command**: `array1 == array2`.
 */
            if self.input.count == self.sequence.count {
/*:
An *if-statement* needs to be written below. It should check if `self.input` and `self.sequence` are equal. if they are equal, the `function` `self.success ()` should be run, otherwise the `function` `self.fail ()` should be run.
 */
                //write your if-statement here
                self.input = []//always clear input
            }
        }
    }
/*:
## PressedG
 */
    override func pressedG (_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
/*:
Repeat the code for `pressedR` but for green instead.
*/
            //write the code for pressG here
        }
    }
/*:
## PressedB
*/
    override func pressedB (_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
/*:
Repeat the code for `pressedR` but for blue instead.
*/
            //write the code for pressB here
        }
    }
/*:
 ## pressedY
 */
    override func pressedY (_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
/*:
Repeat the code for `pressedR` but for yellow instead.
*/
            //write the code for pressY here
        }
    }
/*:
 ## showPattern
 */
    override func showPattern (_ recognizer: UITapGestureRecognizer) {
        if self.sequence.isEmpty && !isDisplaying { return } //checks if sequence can be displayed.
        if isWaiting { //no cheating
            self.input = [] //clear input
            isWaiting = false //stop user input
        }
        isDisplaying = true //we are now displaying sequence
/*:
## For-loops
Here is where the code for displaying `self.sequence` will be written. At this point, `self.sequence` is an `array` of squares and we need to go through the array and tell the computer to animate them, in order. Luckily there is a way to queue up the animations so all we need to do is tell the computer which animation to put in the queue. We first need a way to go through everything in the `array`. This is done with a *for-loop*, which looks like this:
````
for (name) in (array) {
    (code)
}
````
This tells the computer to run *(code)* once for `element` in the `array`. In *(code)* we can reference the specific `element` in the `array` by `(name)`. An `element` is essentially a single `variable` that is in the `array`. Here is an example if a *for-loop*.
````
for i in self.sequence {
}
````
Now we need a way to queue up each animation for the given square. To add the animation to bink the red square we use the **command**: `addRedToQueue ()`. Just like with all the functions so far, there are counterparts for green, blue, and yellow squares also. Fill out the code below.
 */
        for i in self.sequence { //loops through self.sequence
            if i == Squares.Red { //checks if red square
                //add code to add the animation for the red square to the queue
            }
            if i == Squares.Green {
                //add code to add the animation for the green square to the queue
            }
            if i == Squares.Blue {
                //add code to add the animation for the blue square to the queue
            }
            if i == Squares.Yellow {
                //add code to add the animation for the yellow square to the queue
            }
        }//end of for-loop
        startDisplayingSequence () //start to display the animations
    }
/*:
 ## randomSequence 
 */
    override func randomSequence (of:Int) -> [Squares] {
        var seq:[Squares] = []
/*:
This `function` should create a randomly generated `array` of `Squares`. This first step, create the `array` is already done. Now it needs to be populated. Much like with looping through the sequence in the `function` above, a *for-loop* should be used. A *for-loop* that loops a certain number of times can be written like this: 
````
for i in lower...upper {// "{" starts the for-loop
    (code)
} // "}" ends the for-loop
````
Here, `lower...upper` is a `range`. A `range` is a list of numbers that can be looped through. The **command**: `1...5` would produce the `range` `[1, 2, 3, 4, 5]`. In the space below, write a *for-loop* that loops through the `range` `1...of`.
 */
        //start your for-loop here
            var t:Squares //will hold the random Square
/*:
## Random Numbers
Now for the *(code)*. To create a random number use the **command** `arc4random_uniform (n)` to create a random number between 0 and n-1. For this case, since there are 4 options, n should be 4. Create and assign a `variable` `r` to be a random number between 0 and 3.
 */
        //create r here
/*:
Much like the loop in the previous example, a few *if-statements* are needed to determine the value of `t`. Write *if-statments* below that will assign `t` a square depending on the random number generated. If `r` is 0 then `t` should be Squares.Red, if `r` is 1 then `t` should be Squares.Green, if `r` is 2 then `t` should be Squares.Blue, if `r` is 3 then `t` should be Squares.Yellow.
 */
        //write your if-statements here. 
/*:
The last thing to do is to add `t` to the new sequence, `seq`. This can be done with the **command**: `seq.append (t)`.
 */
        //append t to seq here
        //end your for-loop here
        return seq
    }
    
}

var simon = yourSimonController (page: PlaygroundPage.current)
//let rseq = simon.randomSequence (of:<pick a number>)
//simon.loadSequence (seq:rseq)

//try out the game you just made!

