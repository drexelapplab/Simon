import Foundation
import UIKit
import XCPlayground
import PlaygroundSupport
import QuartzCore

open class SimonController {
    public enum Squares:UInt8 {case Red=0, Green, Blue, Yellow} //makes things easy
    private var ppage:PlaygroundPage? //page, mostly just for reference
    private var startBtn:UILabel? //start button
    private var correct:UIView? //displays if correct or not
    public var _redBtn:UIView? //red    box
    public var _greenBtn:UIView? //green  box
    public var _blueBtn:UIView? //blue   box
    public var _yellowBtn:UIView? //yellow box
    public var sequence:[Squares] = []
    public var input:[Squares] = [] //user input
    var animations:[() ->Void] = [] //animation queue
    private var isDisplaying:Bool = false
    private var isWaiting:Bool = false
    //example sequences
    public static var EASY = [Squares.Red, Squares.Green, Squares.Blue, Squares.Yellow]
    public static var MEDIUM = [Squares.Blue,Squares.Yellow,Squares.Green,Squares.Red,Squares.Green,Squares.Yellow,Squares.Yellow,Squares.Green]
    public static var HARD = [Squares.Yellow,Squares.Green,Squares.Green,Squares.Red,Squares.Red,Squares.Green,Squares.Blue,Squares.Green,Squares.Yellow,Squares.Blue,Squares.Red,Squares.Blue,Squares.Yellow,Squares.Green,Squares.Green,Squares.Blue]
    //init, places all of the objects on the UIView and configures all input
    public init () {}
    public init (page:PlaygroundPage) {
        let containerView = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 700.0, height: 700.0))
        PlaygroundPage.current.liveView = containerView
        _redBtn = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        _greenBtn = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        _blueBtn = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        _yellowBtn = UIView (frame: CGRect (x: 0.0, y: 0.0, width: 200.0, height: 200.0))
        self._redBtn?.center = CGPoint (x:containerView.center.x - 120,
                                   y:containerView.center.y - 180)
        self._greenBtn?.center = CGPoint (x:containerView.center.x - 120,
                                   y:containerView.center.y + 60)
        self._blueBtn?.center = CGPoint (x:containerView.center.x + 120,
                                   y:containerView.center.y - 180)
        self._yellowBtn?.center = CGPoint (x:containerView.center.x + 120,
                                   y:containerView.center.y + 60)
        print ("views created.")
        self._redBtn?.layer.cornerRadius = 5.0
        self._greenBtn?.layer.cornerRadius = 5.0
        self._blueBtn?.layer.cornerRadius = 5.0
        self._yellowBtn?.layer.cornerRadius = 5.0
        self._redBtn?.alpha = 0.5
        self._greenBtn?.alpha = 0.5
        self._blueBtn?.alpha = 0.5
        self._yellowBtn?.alpha = 0.5
        self._redBtn?.backgroundColor = UIColor.red
        self._greenBtn?.backgroundColor = UIColor.green
        self._blueBtn?.backgroundColor = UIColor.blue
        self._yellowBtn?.backgroundColor = UIColor.yellow
        let pR = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedR (_:)))
        self._redBtn?.addGestureRecognizer(pR)
        let pG = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedG (_:)))
        self._greenBtn?.addGestureRecognizer(pG)
        let pB = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedB (_:)))
        self._blueBtn?.addGestureRecognizer(pB)
        let pY = UITapGestureRecognizer(target: self,
                                        action:#selector (self.pressedY (_:)))
        self._yellowBtn?.addGestureRecognizer(pY)
        print ("buttons configured.")
        
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
        
        print ("loading buttons into view...")
        containerView.addSubview(self._redBtn!)
        containerView.addSubview(self._greenBtn!)
        containerView.addSubview(self._blueBtn!)
        containerView.addSubview(self._yellowBtn!)
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
            print ("flashing _redBtn")
            self._redBtn?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self._redBtn?.alpha = 0.5
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
            print ("flashing _greenBtn")
            self._greenBtn?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self._greenBtn?.alpha = 0.5
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
            print ("flashing _blueBtn")
            self._blueBtn?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self._blueBtn?.alpha = 0.5
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
            print ("flashing _yellowBtn")
            self._yellowBtn?.alpha = 1.0
        }, completion: {success in
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self._yellowBtn?.alpha = 0.5
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
    //adds red-ping disply animation to queue
    public func addRedToSequence () {
        print ("red")
        animations.append (__pingR)
    }
    //adds green-ping disply animation to queue
    public func addGreenToSequence () {
        print ("green")
        animations.append (__pingG)
    }
    //adds blue-ping disply animation to queue
    public func addBlueToSequence () {
        print ("blue")
        animations.append (__pingB)
    }
    //adds yellow-ping disply animation to queue
    public func addYellowToSequence () {
        print ("yellow")
        animations.append (__pingY)
    }
    //used to start the animation chain going.
    public func startSequence () {
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
                addRedToSequence ()
            } else if i == .Green {
                addGreenToSequence ()
            } else if i == .Blue {
                addBlueToSequence ()
            } else { //has to be yellow
                addYellowToSequence ()
            }
        }
        print ("----------Pattern Loaded-----------")
        startSequence ()
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
    
    private func oneTimePing (_ sq:Squares) {
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



