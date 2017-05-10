import Foundation
import UIKit
import XCPlayground
import PlaygroundSupport
import QuartzCore
class yourSimonController: SimonController {
/*:
 # Simon
 ### Learn how to make the game Simon.
 - - - 
 # Building the Screen
This section will go over how to setup your game. This includes creating a background, setting up buttons and adding user input functionality to them.
 */
    override init (page:PlaygroundPage) {
        super.init ()
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
Now that the `background` is made, we need to add the buttons. There is already space saved for the buttons. If you want to access this space with the **commands**: `self.red`, `self.green`, `self.blue`, and `self.yellow`. While the space for the buttons already exists, they still need to be created. Lets start by making origin points for each of the buttons.
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
background (self.red!)
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
Now it's time to add the Tap to the input. All of the user inputs is to be stored in `self.input`. The object `self.input` is an `array` which is essentially an ordered list. The **command** to add a new Tap to the input is `self.input.append (Tap)`. Here is the **command** for adding Tap.Red to the input.
````
self.input.append (Tap.Red) 
````
- Callout(Start Here):
Write Code Below
 */
            //add Tap.Red to the input array here
            
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
For an *if-statement*, the *(code)* will be run *if* the *(condition)* is **true** and *(other code)* will be run *if* *(condition)* is **false**. This way a computer can change how it runs depending on the situation. Here is what an *if-statement* would look like that checks to see if enough inputs have been entered to warrant checking to see if the user entered the right pattern.
````
if self.input.count == self.pattern.count {
    //code here
}
````
Note how we can tell how many Taps have been input so far with the **command**: `self.input.count`. This can be done for all `arrays`(yes, this means `self.pattern` is also an `array`). We can tell if two `arrays` are equal with the **command**: `array1 == array2`.
 */
            if self.input.count == self.pattern.count {
/*:
An *if-statement* needs to be written below. It should check if `self.input` and `self.pattern` are equal. If they are equal, the **command** `self.success ()` should be run, otherwise the **command** `self.fail ()` should be run.
- Callout(Start Here):
Write Code Below
 */
                //write your if-statement here
                
                self.input = []//always clear input last
            }
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
            
        }
    }
/*:
 # Coding the Start Button
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
## Writing a For-loop
Here is where the code for displaying `self.pattern` will be written. At this point, `self.pattern` is an `array` of Taps and we need to go through the array and tell the computer to animate them. We first need a way to go through everything in the `array`. This is done with a *for-loop*, which looks like this:
````
for (name) in (array) {
    (code)
}
````
This tells the computer to run *(code)* once for each Tap in the `array`. In *(code)* we can reference the specific Tap in the `array` by `(name)`. Here is an example of a *for-loop* that will loop through the pattern.
````
for i in self.pattern {
}
````
Now we need a way to queue up each animation for the corresponding Tap. To add the animation to blink the red button we use the **command**: `addRedToQueue ()`. Just like with all the functions so far, there are counterparts for green, blue, and yellow button also. Fill out the code below.
- Callout(Start Here):
Write Code Below
 */
        for i in self.pattern { //loops through self.pattern
            if i == Tap.Red {
                //add code to add the animation for the red button to the queue
                
            }
            if i == Tap.Green {
                //add code to add the animation for the green button to the queue
                
            }
            if i == Tap.Blue {
                //add code to add the animation for the blue button to the queue
                
            }
            if i == Tap.Yellow {
                //add code to add the animation for the yellow button to the queue
                
            }
        }//end of for-loop
        startDisplayingPattern () //start to display the animations
    }
/*:
 # randomPattern
This code will generate a random pattern of Taps. `length` is the number of Taps that will be randomly generated.
 */
    override func randomPattern (_ length:Int) -> [Tap] {
        var seq:[Tap] = []
/*:
Here, you will be writing the code to generate a pattern of random Taps. Much like with looping through the pattern in the previous section, a *for-loop* will be used. A *for-loop* that runs a certain number of times can be written like this:
````
for i in lower...upper {// "{" starts the for-loop
    (code)
} // "}" ends the for-loop
````
Here, `lower...upper` is a `range`. A `range` is a list of numbers that can be looped through. The **command**: `1...5` would produce the `range` `[1, 2, 3, 4, 5]`. Here is an example of a *for-loop* that loops through the `range` `1...length`.
````
for i in 1...length {
    (code)
}
````
## Generating Random Numbers 
There are often times when you need a random number. While true randomness is impossible, there are plently of ways to generate a pseudo-random number. Pseudo-random means that something is so close to being random that it can be treated as random. In Swift, a great way to generate a pseudo-random number is with the **command**:`arc4random_uniform (upper_bound)`. Here, `upper_bound` is 1 greater than the largest possible number that could be generated. Here is how you would make a random number betweeen 0 and 3.
````
let n = arc4random_uniform (4) 
````
If you want the number 0 to add Tap.Red to the pattern, the *if-statement* would look like the one below.
````
if n == 0 {
    seq.append (Tap.Red)
}
````
Here, you will write a *for-loop* that will loop `length` number of times. Inside the *for-loop* you will generate a random number between 0 and 3. After you generate a number, add the corresponding Tap to the pattern. I suggest 0 corresponds with Tap.Red, 1 with Tap.Green, 2 with Tap.Blue, and 3 with Tap.Yellow. 
 */
        //write your loop here
        
        
        
        //end your for-loop here
        
        return seq
    }
    
}

var simon = yourSimonController (page: PlaygroundPage.current)
//let rseq = simon.randompattern (<pick a number>)
//simon.loadpattern (seq:rseq)

//Try out the game you just made!

