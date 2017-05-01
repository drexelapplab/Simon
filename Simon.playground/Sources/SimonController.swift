import Foundation
import UIKit
import XCPlayground
import PlaygroundSupport
import QuartzCore

open class SimonController {
    public enum Squares:UInt8 {case Red=0, Green, Blue, Yellow} //makes things easy
    open var startBtn:UILabel? //start button
    open var correct:UIView? //displays if correct or not
    open var red:UIView? //red    box
    open var green:UIView? //green  box
    open var blue:UIView? //blue   box
    open var yellow:UIView? //yellow box
    open var sequence:[Squares] = []
    open var input:[Squares] = [] //user input
    private var animations:[() -> Void] = [] //animation queue
    open var isDisplaying:Bool = false
    open var isWaiting:Bool = false
    //example sequences
    public static var EASY = [Squares.Red, Squares.Green, Squares.Blue, Squares.Yellow]
    public static var MEDIUM = [Squares.Blue,Squares.Yellow,Squares.Green,Squares.Red,Squares.Green,Squares.Yellow,Squares.Yellow,Squares.Green]
    public static var HARD = [Squares.Yellow,Squares.Green,Squares.Green,Squares.Red,Squares.Red,Squares.Green,Squares.Blue,Squares.Green,Squares.Yellow,Squares.Blue,Squares.Red,Squares.Blue,Squares.Yellow,Squares.Green,Squares.Green,Squares.Blue]

    public init () {} //benign
    //init, places all of the objects on the UIView and configures all input

    public init (page:PlaygroundPage) {
        let containerView = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 700.0, height: 700.0))
        PlaygroundPage.current.liveView = containerView
        red = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        green = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        blue = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        yellow = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        self.red?.center = CGPoint (x:containerView.center.x - 120,
                                   y:containerView.center.y - 180)
        self.green?.center = CGPoint (x:containerView.center.x - 120,
                                   y:containerView.center.y + 60)
        self.blue?.center = CGPoint (x:containerView.center.x + 120,
                                   y:containerView.center.y - 180)
        self.yellow?.center = CGPoint (x:containerView.center.x + 120,
                                   y:containerView.center.y + 60)
        print ("buttons created.")
        self.red?.layer.cornerRadius = 5.0
        self.green?.layer.cornerRadius = 5.0
        self.blue?.layer.cornerRadius = 5.0
        self.yellow?.layer.cornerRadius = 5.0
        self.red?.alpha = 0.5
        self.green?.alpha = 0.5
        self.blue?.alpha = 0.5
        self.yellow?.alpha = 0.5
        self.red?.backgroundColor = UIColor.red
        self.green?.backgroundColor = UIColor.green
        self.blue?.backgroundColor = UIColor.blue
        self.yellow?.backgroundColor = UIColor.yellow
        let pR = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedR (_:)))
        self.red?.addGestureRecognizer(pR)
        let pG = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedG (_:)))
        self.green?.addGestureRecognizer(pG)
        let pB = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedB (_:)))
        self.blue?.addGestureRecognizer(pB)
        let pY = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedY (_:)))
        self.yellow?.addGestureRecognizer(pY)
        print ("buttons configured.")
        print ("creating statBtn and correct...")
        self.startBtn = UILabel (frame: CGRect (x: 0.0, y: 0.0, width: 100.0, height: 50.0))
        self.startBtn?.text = "start"
        self.startBtn?.backgroundColor = UIColor.white
        self.startBtn?.center = CGPoint (x:containerView.center.x,
                                         y:containerView.center.y + 200)
        self.startBtn?.textAlignment = NSTextAlignment.center
        self.startBtn?.layer.masksToBounds = true
        self.startBtn?.layer.cornerRadius = 20.0
        self.startBtn?.isUserInteractionEnabled = true
        let sb = UITapGestureRecognizer(target: self,
                                        action:#selector (self.showPattern (_:)))
        self.startBtn?.addGestureRecognizer(sb)
        
        self.correct = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 30.0, height: 30.0))
        self.correct?.layer.cornerRadius = 20.0
        self.correct?.backgroundColor = UIColor.white
        self.correct?.center = CGPoint (x:containerView.center.x + 100,
                                       y:containerView.center.y + 200)
        print ("startBtn and correct created.")
        print ("loading buttons into view...")
        containerView.addSubview(self.red!)
        containerView.addSubview(self.green!)
        containerView.addSubview(self.blue!)
        containerView.addSubview(self.yellow!)
        containerView.addSubview(self.startBtn!)
        containerView.addSubview(self.correct!)
        print ("SimonController loaded.")
    }
    //used to load a sequence
    open func loadSequence (seq: [Squares])  {
        print ("new sequence loaded.")
        self.sequence = seq
    }
    //@ignore
    private func __pingR () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("flashing red")
            self.red?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.red?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst() ()
                }
            })
        })
    }
    //@ignore
    private func __pingG () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("flashing green")
            self.green?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.green?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst() ()
                }
            })
        })
    }
    //@ignore
    private func __pingB () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("flashing blue")
            self.blue?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.blue?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst() ()
                }
            })
        })
    }
    //@ignore
    private func __pingY () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("flashing yellow")
            self.yellow?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.yellow?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst() ()
                }
            })
        })
    }
    //@ignore
    private func __end () {
        print ("finished displaying sequence")
        isDisplaying = false
        isWaiting = true
    }
    //adds red-ping display animation to queue
    public func addRedToQueue () {
        print ("red")
        animations.append (__pingR)
    }
    //adds green-ping display animation to queue
    public func addGreenToQueue () {
        print ("green")
        animations.append (__pingG)
    }
    //adds blue-ping display animation to queue
    public func addBlueToQueue () {
        print ("blue")
        animations.append (__pingB)
    }
    //adds yellow-ping display animation to queue
    public func addYellowToQueue () {
        print ("yellow")
        animations.append (__pingY)
    }
    //used to start the animation chain going.
    public func startDisplayingSequence () {
        print ("starting to display sequence...")
        animations.append (__end)
        animations.removeFirst() ()
    }
    //displays sequence
    @objc open func showPattern (_ recognizer: UITapGestureRecognizer) {
        if sequence.isEmpty && !isDisplaying { return }
        if isWaiting { //no cheating
            sequence = []
            isWaiting = false
        }
        print ("----------loading Pattern----------")
        isDisplaying = true
        for i in self.sequence {
            if i == .Red {
                addRedToQueue ()
            } else if i == .Green {
                addGreenToQueue ()
            } else if i == .Blue {
                addBlueToQueue ()
            } else { //has to be yellow
                addYellowToQueue ()
            }
        }
        print ("----------Pattern Loaded-----------")
        startDisplayingSequence ()
    }
    
    @objc open func pressedR (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("_redBtn tap detected")
            self.__pingR ()
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
    
    @objc open func pressedG (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("_greenBtn tap detected")
            self.__pingG ()
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
    
    @objc open func pressedB (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("_blueBtn tap detected")
            self.__pingB ()
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
    
    @objc open func pressedY (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("_yellowBtn tap detected")
            self.__pingY ()
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
    
    open func success () {
        print ("correct pattern entered.")
        self.correct?.backgroundColor = UIColor.green
        UIView.animate (withDuration: 1.0, delay: 0.5,
                       animations: { () -> Void in
            self.correct?.backgroundColor = UIColor.white
        })
        isWaiting = false
    }
    
    open func fail () {
        print ("incorrect pattern entered.")
        self.correct?.backgroundColor = UIColor.red
        UIView.animate (withDuration: 1.0, delay: 0.5,
                        animations: { () -> Void in
            self.correct?.backgroundColor = UIColor.white
        })
    }
    
    open func randomSequence (of:Int) -> [Squares] {
        var seq:[Squares] = []
        print ("-----creating random sequence-----")
        for _ in 1...of {
            var t:Squares
            let i = arc4random_uniform(4)
            if i == 0 {
                t = .Red
                print ("Red")
            } else if i == 1 {
                t = .Green
                print ("Green")
            } else if i == 2 {
                t = .Blue
                print ("Blue")
            } else {
                t = .Yellow
                print ("Yellow")
            }
            seq.append (t)
        }
        print ("-----random sequence created------")
        return seq
    }
    
    public func oneTimePing (_ sq:Squares) {
        switch (sq) {
            case .Red:
                self.__pingR ()
            case .Green:
                self.__pingG ()
            case .Blue:
                self.__pingB ()
            case .Yellow:
                self.__pingY ()
        }
    }
    
}



