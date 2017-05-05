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
 # Init
This code is run at the start of your game and is used to create the screen along with place all the squares and other buttons.
 */
    override init (page:PlaygroundPage) {
        super.init ()
/*:
## Making a Screen
 First, We need to make a screen for our game. In order to make a screen we need to know the size of the screen and where to put the screen. A point is called a `CGPoint` and is created with the **command**: `CGPoint (x:,y:)`. A screen size is called a `CGSize` and is created with the **command**: `CGSize (width:,height:)`. Here is how to make a `CGPoint` named `origin` and a `CGSize` named `size`.
````
var origin = CGPoint (x:0, y:0)
var size = CGSize (width:700, height: 700)
 ````
 */
        let origin = CGPoint (x:0, y:0) //point
        let size = CGSize (width:700, height: 700) //size
        
/*:
## Framing a Screen
Now that we have the size and position of the screen we need to combine them into a frame object called a `CGRect`. This frame will store all of the information for the screen in one place. A `CGRect` is created with the **command**: `CGRect (origin:,size:)`. Here is how you would make a `CGRect` called `frame`.
````
var frame = CGRect (origin: origin, size: size)
````
*/
        let frame = CGRect (origin: origin, size: size)//frame
/*:
## Displaying a Screen
All thats left to do is make the screen and tell the computer to display it. A screen is called a `UIView` and is created with the **command**: `UIView (frame:)`. After the `UIView` is created we can tell the computer to display the screen with the following **command**: `PlaygroundPage.current.LiveView = screen`.
````
var screen = UIView (frame:frame)
PlaygroundPage.current.liveView = screen
````
*/
        let screen = UIView (frame: frame)//screen
        PlaygroundPage.current.liveView = screen//show screen
/*:
Now that the `screen` is made, we need to add the buttons. The `variables` for the buttons are already created and are called `red`, `green`, `blue`, and `yellow` but they are missing their `UIViews`. Lets start by making origin points for each of the colored buttons.
````
let redOrigin
let greenOrigin
let blueOrigin
let yellowOrigin
````
You can set them to `CGPoint (x:0, y:0)` and change them later once they are displayed.
*/
        //Create origins here
        
/*:
The next step is to make the `CGSize` for the buttons and because all the buttons are the same size, we only need one size. I suggest `CGSize (width:200, height:200)`.
````
let buttonSize
````
*/
        //make buttonSize here
        
/*:
## Adding to a Screen
Now, all that's left is to make `CGRect`s and `UIView`s for the buttons and then display them. If we want to access the `variable` for the red button, we can do it with the **command**: `self.red`. If we wanted to access the green button instead, we would use `self.green`. There are four colored buttons: red, green, blue, yellow. Adding a new `UIView` to an already existing screen is done with the following **command**: `screen.addSubview (UIView)`. Here is how the above steps would look like, try making them for the all the buttons.
````
let redRect = CGRect (origin:redOrigin, size:buttonSize)
self.red = UIView (frame:redRect)
screen.addSubview (self.red!)
````
*/
        //finish making the buttons here
        
/*:
## Changing Colors
If you did the previous steps correctly, the buttons will still not show up.  This is because all of the buttons are black, just like the screen. You can change the color of a `UIView` with the **command**: `self.red?.backgroundColor = UIColor.red`.
````
self.red?.backgroundColor = UIColor.red
````
There are a lot of colors to choose from, here is a list: black, gray, white, red, green, blue, cyan, yellow, magenta, orange, purple, brown. We can access a color with the following **command**. `UIColor.color` where "color" is the name of the color you want. Try changing the color of each button. Remember that even though we will be referencing the buttons by a specific color, they do not need to be that color.
*/
        //change color of buttons here 
        
/*:
Here is where you will want to go back and change the origin point of all the buttons so they are spaced out evenly. To do so, think of the screen like a grid. The `x` line is horizontal and the `y` line is vertical. The greater the `x` and/or `y` the farther it will be from the origin. The origin is the top left corner of the screen.
\
Now that the buttons are placed, they need to be dimmed in preparation for the animation. Here is the **command** to dim the red button.
````
self.red?.alpha = 0.5
````
*/
        //dim all of the squares to 0.5 here
        
/*:
## User Input
Now it's time to setup the buttons to respond to user input. This is done in three steps:
1. Write code to run when the button is pressed.
2. Create a `UITapGestureRecognizer` to detect when the button is tapped.
3. Add the `UITapGestureRecognizer` to the button so it can respond to being tapped.
\
\
We will be writing the code to run when the button is pressed later on in this tutorial. For now we can do steps 2 and 3. A `UITapGestureRecognizer` is made with the **command**: `UITapGestureRecognizer (target:, action:)`. The target is `self` and action is the code that will be run. A `UITapGestureRecognizer` is attached to a button with the **command**: `addGestureRecognizer(Gesture)`. Doing steps 2 and 3 for the red button would look like this.
````
let tapRed = UITapGestureRecognizer(target: self,
            action:#selector (self.pressedR (_:)))
self.red?.addGestureRecognizer(tapRed)
````
Try creating and adding `UITapGestureRecognizers` for the rest of the buttons. There are corresponding `functions` called `pressedG`, `pressedB`, and `pressedY` for their respective buttons.
 */
        let tapRed = UITapGestureRecognizer(target: self,
                    action:#selector (self.pressedR (_:)))
        self.red?.addGestureRecognizer(tapRed)
        //create and add UITapGestureRecognizers for the rest of the buttons here
        
/*:
Pressing them will still not make them light up. This is because we have not done step 1 yet; we will do that later. We still have to make the start button and the light that tells the user if they have entered the right pattern. The name of the light is called correct and is named `self.correct`. It is a `UIView` just like the other buttons, so let's make an origin and a size for it and then place it on the screen. Remember to change the color so you can see it, I would suggest `UIColor.white`.
````
let correctOrigin 
let correctSize 
let correctRect
````
 */
        //create and place self.correct here 
        
/*:
Now all that's left to do is make the start button. The start button is named `self.startBtn` and is a `UILabel`. A `UILabel` is similar to a `UIView` except that it is meant to have text inside of it. `UILabels` are made with the **command**: `UILabel (frame:)`. Just like `UIView`, `UILabel` needs a frame which needs an origin and a size. Create them below. Don't forget to add the start button to the screen.
````
let startBtnOrigin 
let startBtnSize
let startBtnRect
screen.addSubview (self.startBtn!)
````
 */
        //create self.startBtn here and put it on the screen
        
        
        //this is the rest of the code to put text on the start button and do the rest of the configurations.
        self.startBtn?.text = "start" //puts the text in the box
        self.startBtn?.textAlignment = NSTextAlignment.center //makes sure text is centered
        //set up the user input for startBtn
        let sb = UITapGestureRecognizer (target: self,
                        action:#selector (self.showPattern (_:)))
        self.startBtn?.addGestureRecognizer (sb)
        self.startBtn?.isUserInteractionEnabled = true //allows it to be tapped.
    }
/*:
 # pressedR
This code is run when the red button is pressed. It will animate the button and add it to the user input.
 */
    override func pressedR (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //checks to see if the computer is looking for user input
/*:
## Animating a Button
Here is where we will code the action of the `UITapGestureRecognizer` for `self.red`. When a button is pressed there are three things that need to happen.
1. Animate the button.
2. Add the button to the list of user inputs.
3. Check to see if the user is done inputting and check if they entered the correct pattern.
\
\
For step 1, the **command** to animate a square is `self.oneTimePing (Square)`. To animate the red button, it would look like this.
````
self.oneTimePing (Squares.Red)
````
There are corresponding names for the green, blue, and yellow buttons: `Squares.Green`, `Squares.Blue`, and `Squares.Yellow`. Think of these as guides. While they are not the actual button, they tell the computer which button to reference.
 */
            //add the command to animate the red button here
            
/*:
## Adding to an Array
Now it's time to add the Square to the input. All of the user inputs should be stored inside `self.input`. The object `self.input` is an `array` which is essentially an ordered list. The **command** to add a new square to the input is `self.input.append (Square)`. Here is what the **command** for adding the red Square to the input `array` would look like.
````
self.input.append (Squares.Red) 
````
 */
            //add Square.Red to the input array here
            
/*:
## If-Statements
For the last step we will need to tell the computer to use some logic. A computer can be instructed to run code only if a specified condition is **true** or **false**. We do this by making an *if-statement*, which looks like this.
````
if (condition) {
    (code)
} else {
    (other code)
}
````
For an *if-statement*, the *(code)* will be run *if* the *(condition)* is **true** and *(other code)* will be run *if* *(condition)* is **false**. This way a computer can change how it works depending on the situation. Here is what an *if-statement* would look like that checks to see if enough inputs have been entered to warrant checking to see if the user entered the right pattern.
````
if self.input.count == self.pattern.count {
    //code here
}
````
Note how we can tell how many squares have been input so far with the **command**: `self.input.count`. This can be done for all `arrays`(yes, this means `self.pattern` is also an `array`). We can tell if two `arrays` are equal with the **command**: `array1 == array2`.
 */
            if self.input.count == self.pattern.count {
/*:
An *if-statement* needs to be written below. It should check if `self.input` and `self.pattern` are equal. If they are equal, the **command** `self.success ()` should be run, otherwise the **command** `self.fail ()` should be run.
 */
                //write your if-statement here
                
                self.input = []//always clear input last
            }
        }
    }
/*:
# PressedG
This code is run when the green button is pressed. It will animate the button and add it to the user input.
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
# PressedB
This code is run when the blue button is pressed. It will animate the button and add it to the user input.
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
 # pressedY
This code is run when the yellow button is pressed. It will animate the button and add it to the user input.
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
 # showPattern
This code is run when the start button is pressed. It will display the loaded pattern and will not run if a pattern has not been loaded.
 */
    override func showPattern (_ recognizer: UITapGestureRecognizer) {
        if self.pattern.isEmpty || !isDisplaying { return } //checks if pattern can be displayed.
        if isWaiting { //no cheating
            self.input = [] //clear input
            isWaiting = false //stop user input
        }
        isDisplaying = true //we are now displaying pattern
/*:
## For-loops
Here is where the code for displaying `self.pattern` will be written. At this point, `self.pattern` is an `array` of squares and we need to go through the array and tell the computer to animate them, in order. Luckily there is a way to queue up the animations so all we need to do is tell the computer which animation to put in the queue. We first need a way to go through everything in the `array`. This is done with a *for-loop*, which looks like this:
````
for (name) in (array) {
    (code)
}
````
This tells the computer to run *(code)* once for `element` in the `array`. In *(code)* we can reference the specific `element` in the `array` by `(name)`. An `element` is essentially a single `variable` that is in the `array`. Here is an example of a *for-loop*.
````
for i in self.pattern {
}
````
Now we need a way to queue up each animation for the given square. To add the animation to blink the red button we use the **command**: `addRedToQueue ()`. Just like with all the functions so far, there are counterparts for green, blue, and yellow button also. Fill out the code below.
 */
        for i in self.pattern { //loops through self.pattern
            if i == Squares.Red {
                //add code to add the animation for the red button to the queue
                
            }
            if i == Squares.Green {
                //add code to add the animation for the green button to the queue
                
            }
            if i == Squares.Blue {
                //add code to add the animation for the blue button to the queue
                
            }
            if i == Squares.Yellow {
                //add code to add the animation for the yellow button to the queue
                
            }
        }//end of for-loop
        startDisplayingPattern () //start to display the animations
    }
/*:
 # randomPattern
This code will generate a random pattern of Squares. `of` is the number of Sqaures that will be randomly generated.
 */
    override func randomPattern (of:Int) -> [Squares] {
        var seq:[Squares] = []
/*:
Here, you will be writing the code to generate a pattern of random Squares. This first step, create the `array`, is already done above. Now it needs to be filled with random Squares. Much like with looping through the pattern in the previous section, a *for-loop* should be used. A *for-loop* that runs a certain number of times can be written like this:
````
for i in lower...upper {// "{" starts the for-loop
    (code)
} // "}" ends the for-loop
````
Here, `lower...upper` is a `range`. A `range` is a list of numbers that can be looped through. The **command**: `1...5` would produce the `range` `[1, 2, 3, 4, 5]`. In the space below, write a *for-loop* that loops through the `range` `1...of`. So the code for the *for-loop* would look like 
````
for i in 1...of {
    (code)
}
````
The *(code)* that goes inside the *for-loop* is written below. Surround it in a *for-loop*.
 */
        //start your for-loop here
        
            var t:Squares
            let i = arc4random_uniform(4)//how to make a random number
            if i == 0 {
                t = Squares.Red
            } else if i == 1 {
                t = Squares.Green
            } else if i == 2 {
                t = Squares.Blue
            } else {
                t = Squares.Yellow
            }
            seq.append (t)
        //end your for-loop here
        
        return seq
    }
    
}

var simon = yourSimonController (page: PlaygroundPage.current)
//let rseq = simon.randompattern (of:<pick a number>)
//simon.loadpattern (seq:rseq)

//Try out the game you just made!

