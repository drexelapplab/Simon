import Foundation
import UIKit
import XCPlayground
import PlaygroundSupport
import QuartzCore
class yourSimonController: SimonController {
    override init (page:PlaygroundPage) {
        super.init ()
//ignore code above this
/*:
 # Simon
 ### Learn how to make the game Simon.
 - - - 
 # Building the Screen
This section will go over how to setup your game. This includes creating a background, setting up buttons and adding user input functionality to them.
 */
/*:
## Making the Background
 First, We need to make a background for our game. In order to make a background we need to know the size of the background and where to put the background. You can tell the computer to remember a point with the **command**: `CGPoint (x:,y:)`. Here, we are telling the computer to remember an x and a y; a point is what we call the x and y when together.  We describe the size of the background with the **command**: `CGSize (width:,height:)`. Here is how to create a `CGPoint` named `origin` and a `CGSize` named `size`.
````
var origin = CGPoint (x:0, y:0)
var size = CGSize (width:700, height: 700)
 ````
 */
        let origin = CGPoint (x:0, y:0) //point
        let size = CGSize (width:700, height: 700) //size
        
/*:
- Note:
`origin` and `size` are both `variables`. A `variable` is a container for storing data.
## Framing the Background
Now that we have the size and position of the screen we need to combine them into a frame object called a `CGRect`. This frame will store all of the information for the background in one place. A `CGRect` is created with the **command**: `CGRect (origin:,size:)`. Here is how you would make a `CGRect` called `frame`.
````
var frame = CGRect (origin: origin, size: size)
````
*/
        let frame = CGRect (origin: origin, size: size)//frame
/*:
## Displaying the Background
All thats left to do is create the background and tell the computer to display it. A background is called a `UIView` and is created with the **command**: `UIView (frame:)`. After the `UIView` is created we can tell the computer to display the background with the **command**: `PlaygroundPage.current.LiveView = background`.
````
var background = UIView (frame:frame)
PlaygroundPage.current.liveView = background
````
*/
        let background = UIView (frame: frame)//screen
        PlaygroundPage.current.liveView = background//show screen
/*:
Now that the `background` is made, we need to add the buttons. There is already space saved for the buttons. You can access this space with the **commands**: `self.red`, `self.green`, `self.blue`, and `self.yellow`. While the space for the buttons already exists, they still need to be created. Lets start by making origin points for each of the buttons.
````
let redOrigin
let greenOrigin
let blueOrigin
let yellowOrigin
````
You can set them to `CGPoint (x:0, y:0)` and change them later.
- Callout(Start Here):
Write Code Below
*/
        //Create origins here
        
        
/*:
The next step is to make the sizes for the buttons. Luckily, only one size needs to be used as all of these buttons will be the same size. I suggest `CGSize (width:200, height:200)`.
````
let buttonSize
````
- Callout(Start Here):
Write Code Below
*/
        //make buttonSize here
        
/*:
## Putting The Buttons on the Background
Now, all that's left is to make a `CGRect`/`UIView`s for each button and then display all of them. Remember, the names of the buttons are `self.red`, `self.green`, `self.blue`, and `self.yellow`. Adding a `UIView` to the background is done with the **command**: `background.addSubview (UIView)`. Below is an example for setting up the red button.
````
let redRect = CGRect (origin:redOrigin, size:buttonSize)
self.red = UIView (frame:redRect)
background.addSubview (self.red!)
````
- Callout(Start Here):
Write Code Below
*/
        //finish making the buttons here
        
/*:
## Changing Button Colors
Even if you did the previous steps correctly, the buttons will still not show up.  This is because all of the buttons are black, just like the screen. You can change the color of a `UIView` with the **command**: `self.red?.backgroundColor = UIColor.red`.
````
self.red?.backgroundColor = UIColor.red
````
There are a lot of colors to choose from, here is a list: black, gray, white, red, green, blue, cyan, yellow, magenta, orange, purple, brown. We can access a color with the following **command**. `UIColor.color` where "color" is the name of the color you want. Try changing the color of each button. Remember that even though we are referencing the buttons by a specific color, they do not need to be that color.
- Callout(Start Here):
Write Code Below
*/
        //change color of buttons here 
        
/*:
Here is where you will want to go back and change the origin point of all the buttons so they are spaced out evenly. In order to space them out properly, think of the screen like a grid. `x` is the horizontal position and `y` is vertical vertical position. The greater the `x` and/or `y` the farther it will be from the origin. The origin is the top left corner of the background.
\
Now that the buttons are placed, they need to be dimmed in preparation for the animation. Here is the **command** to dim the red button.
````
self.red?.alpha = 0.5
````
- Callout(Start Here):
Write Code Below
*/
        //dim all of the Tap to 0.5 here
        
/*:
## Setting Up User Input
Now it's time to setup the buttons to respond to user input. This is done in three steps:
1. Write code to run when the button is pressed.
2. Create a `UITapGestureRecognizer` to detect when the button is tapped.
3. Add the `UITapGestureRecognizer` to the button so it can respond to being tapped.
\
\
We will be writing the code to run when a button is pressed later on in this tutorial. For now we can do steps 2 and 3. A `UITapGestureRecognizer` is made with the **command**: `UITapGestureRecognizer (target:, action:)` and will react to a user's tap. The target is `self` and action is the code that will be run. A `UITapGestureRecognizer` is attached to a button with the **command**: `button.addGestureRecognizer(Gesture)`. Doing steps 2 and 3 for the red button would look like this.
````
let tapRed = UITapGestureRecognizer(target: self,
            action:#selector (self.pressedR (_:)))
self.red?.addGestureRecognizer(tapRed)
````
Try creating and adding `UITapGestureRecognizers` for the rest of the buttons. There are corresponding `functions` called `pressedG`, `pressedB`, and `pressedY` for their respective buttons.
- Callout(Start Here):
Write Code Below
 */
        let tapRed = UITapGestureRecognizer(target: self,
                    action:#selector (self.pressedR (_:)))
        self.red?.addGestureRecognizer(tapRed)
        //create and add UITapGestureRecognizers for the rest of the buttons here
        
/*:
Pressing them will still not make them light up. This is because we have not done step 1 yet; we will do that later. We still have to make the start button and the light that tells the user if they have entered the right pattern. The name of the light `self.correct`. It is a `UIView` just like the other buttons, so let's make an origin and a size for it and then place it on the screen. Remember to change the color so you can see it, I would suggest `UIColor.white`.
````
let correctOrigin 
let correctSize 
let correctRect
````
- Callout(Start Here):
Write Code Below
 */
        //create and place self.correct here 
        
/*:
Now all that's left to do is make the start button. The start button is named `self.startBtn` and is a `UILabel`. A `UILabel` is similar to a `UIView` except that it is meant to have text inside of it. `UILabels` are made with the **command**: `UILabel (frame:)`. Just like `UIView`, `UILabel` needs a frame which needs an origin and a size. Create them below. Don't forget to add the start button to the background.
````
let startBtnOrigin 
let startBtnSize
let startBtnRect
self.startBtn = UILabel (frame:startBtnRect)
background.addSubview (self.startBtn!)
````
- Callout(Start Here):
Write Code Below
 */
        //create self.startBtn here and put it on the screen

/*:
You can add text to the start button with the **command**: `UILabel.text = "text"`. Make sure the text is surrounded in "quotes". Here is how it would look to set the start button's text to "start". 
````
self.startBtn?.text = "start"
````
- Callout(Start Here):
Write Code Below
*/
        //add text to startBtn here 
        
        
        //this is the rest of the code to put text on the start button and do the rest of the configurations.
        self.startBtn?.textAlignment = NSTextAlignment.center //makes sure text is centered
        //set up the user input for startBtn
        let sb = UITapGestureRecognizer (target: self,
                        action:#selector (self.showPattern (_:)))
        self.startBtn?.addGestureRecognizer (sb)
        self.startBtn?.isUserInteractionEnabled = true //allows it to be tapped.
        self.loadPattern ()
    }
/*:
 # Coding the Red Button
This code is run when the red button is pressed. It will animate the button and add it to the user input.
 */
    override func pressedR (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //checks to see if the computer is looking for user input
/*:
## Animating a Button
Here is where we will code the action of the `UITapGestureRecognizer` for the red button. When a button is pressed there are three things that need to happen.
1. The button animates.
2. The button is added to the list of user inputs.
3. The Input is compared to the correct pattern to check if the user entered the correct pattern.
\
\
For step 1, the **command** to animate a Tap is `self.oneTimePing (Tap.Color)`. To animate the red button, it would look like this.
````
self.oneTimePing (Tap.Red)
````
There are corresponding names for the green, blue, and yellow buttons: `Tap.Green`, `Tap.Blue`, and `Tap.Yellow`; you should think of these as guides. While they are not the actual button, they tell the computer which button to reference during animation.
- Callout(Start Here):
Write Code Below
 */
            //add the command to animate the red button here
            
/*:
## Adding to an Array
Now it's time to add the Tap to the input. All of the user inputs is to be stored in `self.input`. The object `self.input` is an `array` which is essentially a list of `variables` which are called `elements`. The difference between `elements` and `variables` is that an `element` is part of an `array` and a `variable` exists without having to be part of an `array`. The **command** to add a new Tap to the input is `self.input.append (Tap)`. Here is the **command** for adding Tap.Red to the input.
````
self.input.append (Tap.Red) 
````
- Callout(Start Here):
Write Code Below
 */
            //add Tap.Red to the input array here
            
            self.check () //this is step 3, you will code this later
        }
    }
/*:
# Coding the Green Button
This code is run when the green button is pressed. It will animate the button and add it to the user input.
 */
    override func pressedG (_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
/*:
Repeat the code for `pressedR` but for green instead.
- Callout(Start Here):
Write Code Below
*/
            //write the code for pressG here
            
            
            self.check ()
        }
    }
/*:
# Coding the Blue Button
This code is run when the blue button is pressed. It will animate the button and add it to the user input.
*/
    override func pressedB (_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
/*:
Repeat the code for `pressedR` but for blue instead.
- Callout(Start Here):
Write Code Below
*/
            //write the code for pressB here
            
            
            self.check ()
        }
    }
/*:
 # Coding the Yellow Button
This code is run when the yellow button is pressed. It will animate the button and add it to the user input.
 */
    override func pressedY (_ recognizer: UITapGestureRecognizer) {
        if isWaiting {
/*:
Repeat the code for `pressedR` but for yellow instead.
- Callout(Start Here):
Write Code Below
*/
            //write the code for pressY here
            
            
            self.check ()
        }
    }
/*:
# Checking User Input
This code will check if the user is inputting the correct pattern and prepare the next level if the correct pattern has been completely entered.
*/
    override func check () {
/*:
## Writing If-Statements
For the last step we will need to tell the computer to use some logic. A computer can be instructed to run code only if a specified condition is **true** or **false**. We do this by making an *if-statement*, which looks like this.
````
if (condition) {
(code)
} else {
(other code)
}
````
For an *if-statement*, the *(code)* will be run *if* the *(condition)* is **true** and *(other code)* will be run *if* *(condition)* is **false**. The *else-statement* is what follows an *if-statement*. It contains the code that will be run if the *(condition)* is false and is optional. This way a computer can change how it runs depending on the situation. Here is what an *if-statement* would look like that checks to see if the last input entered is not the correct one.
````
if self.input[self.input.count-1] != self.pattern[self.input.count-1] {
//code here
} else {
//other code
}
````
- Note:
`array[number]` is how you access an `element` in an `array`. Numbering in an `array` starts at 0. So if you want to access the first `element` in an `array` you would use the **command**: `array[0]`. If you want the 5th `element` in the `array` you would use the **command**: `arrray[4]`.
\
`array.count` gives you the number of `elements` in an `array`. 1 is subtracted from this number because counting in `arrays` starts at 0, not 1.
- - -
Inside this *if-statement* two things need to happen. 1: the **command** `self.fail()` should be run. 2: the input should be reset. The input is reset with the **command** `self.input = []`.
````
self.fail ()
self.input = []
````
Next, We need to check if the entire pattern has been entered. This can be added to the previous *if-statement* inside the *else-statement* where *other code* is located. To check if the entire pattern has been entered, all that is you need to do is check if the input has the same number of `elements` as the pattern. This is done with the **command**: `self.input.count == self.pattern.count`.
````
if self.input.count == self.pattern.count {
//code here
}
````
Inside the *if-statement* above, the **command**: `self.success()` should be run. A new random tap should also be added to the pattern. This can be done with the **command**: `self.pattern.append (self.randomTap ())`. Lastly, the input needs to be reset, just like in the last *if-statement*.
- Callout(Start Here):
Write Code Below
*/
        //write an if-statement that checks if the just entered is incorrect
        
        //then write the code that should run if this condition is true
        
        //in the else-statement write another if-statement that checks if the correct pattern has beenentered
        
        //inside that if-statement, write the code that should be run if that condition is true
        
    }

/*:
 # Coding the Start Button
This code is run when the start button is pressed. It will display the loaded pattern and will not run if a pattern has not been loaded.
 */
    override func showPattern (_ recognizer: UITapGestureRecognizer) {
        if self.pattern.isEmpty && !isDisplaying { return } //checks if pattern can be displayed.
        if isWaiting {
            self.input = [] //no cheating
            isWaiting = false //stop user input
        }
        isDisplaying = true //we are now displaying pattern
/*:
## Writing a For-loop
Here is where the code for displaying `self.pattern` will be written. At this point, `self.pattern` is an `array` of Taps and we need to go through the array and tell the computer to animate them. We first need a way to go through each `element` in the `array`. This is done with a *for-loop*, which looks like this:
````
for (name) in (array) {
    (code)
}
````
This tells the computer to run *(code)* once for `element` in the `array`. In *(code)* we can access the `element` by `(name)`. Here is an example of a *for-loop* that will loop through the pattern.
````
for i in self.pattern {
}
````
Now we need a way to queue up each animation for the corresponding Tap. To add the animation to blink the red button we use the **command**: `addRedToQueue ()`. There are **commands** like this for each of the green, blue, and yellow buttons. Below, write a *for-loop* that loops through `self.pattern`. Inside the *for-loop* you should write *if-statements* that queue up the corresponding animation. To queue up the red animation, the *if-statement* would look like this. 
````
if i == Tap.Red {
    addRedToQueue () 
}
````
- Callout(Start Here):
Write Code Below
 */
        //Write a for-loop that loops through pattern 
        
        //inside the for-loop, add if-statements to queue up the corresponding animation
        
        
        
        startDisplayingPattern () //start to display the animations after the for-loop
    }
/*:
 # Creating a Random Tap
This code will generate a random Tap.
 */
    override func randomTap () -> Tap {
        var tap = Tap.Red
/*:
## Generating Random Numbers
There are often times when you need a random number.  In Swift, a great way to generate a random number is with the **command**:`arc4random_uniform (upper_bound)`. Here, `upper_bound` is 1 greater than the largest possible number that could be generated. So if you want to generate a random number between 0 and 3 you would use the **command**: `arc4random_uniform (4)`.
````
let n = arc4random_uniform (4) 
````
If you want the number 0 to add Tap.Red to the pattern, the *if-statement* would look like the one below.
````
if n == 0 {
    tap = Tap.Red
}
````
- Callout(Start Here):
Write Code Below
 */
        //generate a random numbere here
        
        //Assign tap using if-statements here
        
        return tap
    }
    
}

var simon = yourSimonController (page: PlaygroundPage.current)

//Try out the game you just made!

