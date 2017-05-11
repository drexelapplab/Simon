import Foundation
import UIKit
import XCPlayground
import PlaygroundSupport
import QuartzCore

open class SimonController {
    public enum Tap:UInt8 {case Red=0, Green, Blue, Yellow} //makes things easy
    open var startBtn:UILabel? //start button
    open var correct:UIView? //displays if correct or not
    open var red:UIView? //red    box
    open var green:UIView? //green  box
    open var blue:UIView? //blue   box
    open var yellow:UIView? //yellow box
    open var pattern:[Tap] = []
    open var input:[Tap] = [] //user input
    private var animations:[() -> Void] = [] //animation queue
    open var isDisplaying:Bool = false
    open var isWaiting:Bool = false
    //example sequences
    public static var EASY = [Tap.Red, Tap.Green, Tap.Blue, Tap.Yellow]
    public static var MEDIUM = [Tap.Blue,Tap.Yellow,Tap.Green,Tap.Red,Tap.Green,Tap.Yellow,Tap.Yellow,Tap.Green]
    public static var HARD = [Tap.Yellow,Tap.Green,Tap.Green,Tap.Red,Tap.Red,Tap.Green,Tap.Blue,Tap.Green,Tap.Yellow,Tap.Blue,Tap.Red,Tap.Blue,Tap.Yellow,Tap.Green,Tap.Green,Tap.Blue]

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
        let pR = UITapGestureRecognizer (target: self,
                                        action:#selector (self.pressedR (_:)))
        self.red?.addGestureRecognizer (pR)
        let pG = UITapGestureRecognizer (target: self,
                                        action:#selector (self.pressedG (_:)))
        self.green?.addGestureRecognizer (pG)
        let pB = UITapGestureRecognizer (target: self,
                                        action:#selector (self.pressedB (_:)))
        self.blue?.addGestureRecognizer (pB)
        let pY = UITapGestureRecognizer (target: self,
                                        action:#selector (self.pressedY (_:)))
        self.yellow?.addGestureRecognizer (pY)
        self.startBtn = UILabel (frame: CGRect (x: 0.0, y: 0.0, width: 100.0, height: 50.0))
        self.startBtn?.text = "start"
        self.startBtn?.backgroundColor = UIColor.white
        self.startBtn?.center = CGPoint (x:containerView.center.x,
                                         y:containerView.center.y + 200)
        self.startBtn?.textAlignment = NSTextAlignment.center
        self.startBtn?.layer.masksToBounds = true
        self.startBtn?.layer.cornerRadius = 20.0
        self.startBtn?.isUserInteractionEnabled = true
        let sb = UITapGestureRecognizer (target: self,
                                        action:#selector (self.showPattern (_:)))
        self.startBtn?.addGestureRecognizer (sb)
        
        self.correct = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 30.0, height: 30.0))
        self.correct?.layer.cornerRadius = 20.0
        self.correct?.backgroundColor = UIColor.white
        self.correct?.center = CGPoint (x:containerView.center.x + 100,
                                       y:containerView.center.y + 200)
        containerView.addSubview (self.red!)
        containerView.addSubview (self.green!)
        containerView.addSubview (self.blue!)
        containerView.addSubview (self.yellow!)
        containerView.addSubview (self.startBtn!)
        containerView.addSubview (self.correct!)
        print ("SimonController loaded.")
        self.loadPattern ()
    }
    //used to load a sequence
    open func loadPattern ()  {
        print ("new pattern loaded.")
        self.pattern = [randomTap ()]
    }
    //@ignore
    private func __pingR () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("[red flash]")
            self.red?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.red?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst () ()
                }
            })
        })
    }
    //@ignore
    private func __pingG () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("[green flash]")
            self.green?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.green?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst () ()
                }
            })
        })
    }
    //@ignore
    private func __pingB () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("[blue flash]")
            self.blue?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.blue?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst () ()
                }
            })
        })
    }
    //@ignore
    private func __pingY () {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            print ("[yellow flash]")
            self.yellow?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.yellow?.alpha = 0.5
            }, completion: {success in
                if !self.animations.isEmpty {
                    self.animations.removeFirst () ()
                }
            })
        })
    }
    //@ignore
    private func __end () {
        isDisplaying = false
        isWaiting = true
    }
    //adds red-ping display animation to queue
    public func addRedToQueue () {
        animations.append (__pingR)
    }
    //adds green-ping display animation to queue
    public func addGreenToQueue () {
        animations.append (__pingG)
    }
    //adds blue-ping display animation to queue
    public func addBlueToQueue () {
        animations.append (__pingB)
    }
    //adds yellow-ping display animation to queue
    public func addYellowToQueue () {
        animations.append (__pingY)
    }
    //used to start the animation chain going.
    public func startDisplayingPattern () {
        animations.append (__end)
        animations.removeFirst () ()
    }
    //displays sequence
    @objc open func showPattern (_ recognizer: UITapGestureRecognizer) {
        if pattern.isEmpty && !isDisplaying { return }
        if isWaiting { //no cheating
            input = []
            isWaiting = false
        }
        isDisplaying = true
        animations = pattern.map ({
            switch $0 {
            case .Red:
                return __pingR
            case .Green:
                return __pingG
            case .Blue:
                return __pingB
            case .Yellow:
                return __pingY
            }
        })
        startDisplayingPattern ()
    }
    
    @objc open func pressedR (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("[red tap]")
            self.__pingR ()
            self.input.append (Tap.Red)
            self.check ()
        }
    }
    
    @objc open func pressedG (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("[green tap]")
            self.__pingG ()
            self.input.append (Tap.Green)
            self.check ()
        }
    }
    
    @objc open func pressedB (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("[blue tap]")
            self.__pingB ()
            self.input.append (Tap.Blue)
            self.check ()
        }
    }
    
    @objc open func pressedY (_ recognizer: UITapGestureRecognizer) {
        if isWaiting { //only do stuff when looking for input
            print ("[yellow tap]")
            self.__pingY ()
            self.input.append (Tap.Yellow)
            self.check ()
        }
    }
    
    open func success () {
        print ("correct pattern")
        self.correct?.backgroundColor = UIColor.green
        UIView.animate (withDuration: 1.0, delay: 0.5,
                       animations: { () -> Void in
            self.correct?.backgroundColor = UIColor.white
        })
        isWaiting = false
    }
    
    open func fail () {
        print ("incorrect pattern")
        self.correct?.backgroundColor = UIColor.red
        UIView.animate (withDuration: 1.0, delay: 0.5,
                        animations: { () -> Void in
            self.correct?.backgroundColor = UIColor.white
        })
    }
    
    open func randomTap () -> Tap {
        return Tap.init (rawValue: UInt8 (arc4random_uniform (4)))!
    }
    
    open func check () {
        if input[input.count-1] != pattern[input.count-1] {
            self.fail ()
            input = []
        } else if input.count == pattern.count {
            self.success ()
            pattern.append (self.randomTap ())
            input = []
        }
    }
    
    public func oneTimePing (_ sq:Tap) {
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

