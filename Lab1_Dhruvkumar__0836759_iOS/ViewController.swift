//
//  ViewController.swift
//  Lab1_Dhruvkumar__0836759_iOS
//
//  Created by Dhruv on 2022-01-18.
//

import UIKit

class ViewController: UIViewController {

    enum Turn
        {
            case zero
            case cross
    }
    @IBOutlet weak var h1: UIButton!
    @IBOutlet weak var h2: UIButton!
    @IBOutlet weak var h3: UIButton!
    @IBOutlet weak var h4: UIButton!

    @IBOutlet weak var h5: UIButton!
    @IBOutlet weak var h6: UIButton!
    @IBOutlet weak var h7: UIButton!
    @IBOutlet weak var h8: UIButton!
    @IBOutlet weak var h9: UIButton!
    var FirstTurn = Turn.cross
        var currentTurn = Turn.cross
        var z = "0"
        var c = " X"
        var board = [UIButton]()
        
        var zeroscore = 0
        var crossscore = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            initBoard()
            let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
            view.addGestureRecognizer(swipeleft)
            
        }
        
        @objc func swipe(gesture : UISwipeGestureRecognizer)
        {
            let swipeGesture = gesture as UISwipeGestureRecognizer
            switch swipeGesture.direction{
                
            case UISwipeGestureRecognizer.Direction.left:
                for button in board
                {
                    button.setTitle(nil, for: .normal)
                    button.isEnabled = true
                    }
                if FirstTurn == Turn.cross
                {
                    FirstTurn = Turn.zero
                    
                    
                }
                else if(FirstTurn == Turn.zero)
                {
                    FirstTurn = Turn.cross
                   
                }
                currentTurn = FirstTurn
                
                print(" swipe left")
            
            default:
                 break
                
            }
        }
        
        func initBoard(){
            board.append(h1)
            board.append(h2)
            board.append(h3)
            board.append(h4)
            board.append(h5)
            board.append(h6)
            board.append(h7)
            board.append(h8)
            board.append(h9)
        }
      
        @IBAction func tapaction(_ sender: UIButton) {
            actionOnBoard(sender)
            
            if checkForWinner(c)
            {
                crossscore += 1
                resultAlert(title: " cross win!!")
            }
            if checkForWinner(z){
                zeroscore += 1
                resultAlert(title: "zero win!!")
            }
            
            if(fullBoard())
            {
                resultAlert(title: "DRAW")
            }
        }
    func resultAlert(title : String)
        {
            _ = "\nZero " + String(zeroscore) + "\n\nCrosses " + String(crossscore)
            let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.resetBoard()}))
            self.present(ac , animated: true)
        }
        
        func fullBoard() -> Bool
        {
            for button in board
            {
                
                if  (button.title(for: .normal) == nil )
                {
                return false
                }
            }
            return true
        }
        
        func checkForWinner(_ s: String)-> Bool
        {
            // to check horizontally who is winner
            if thisSymbol(h1, s) && thisSymbol(h2, s) && thisSymbol(h3, s)
            {
                return true
            }
            if thisSymbol(h4, s) && thisSymbol(h5, s) && thisSymbol(h6, s)
            {
                return true
            }
            if thisSymbol(h7, s) && thisSymbol(h8, s) && thisSymbol(h9, s)
            {
                return true
            }
            // to chech vertically who is winner
            if thisSymbol(h1, s) && thisSymbol(h4, s) && thisSymbol(h7, s)
            {
                return true
            }
            if thisSymbol(h2, s) && thisSymbol(h4, s) && thisSymbol(h8, s)
            {
                return true
            }
            if thisSymbol(h3, s) && thisSymbol(h6, s) && thisSymbol(h9, s)
            {
                return true
            }
            
            // to check diagonally who is winner
            if thisSymbol(h1, s) && thisSymbol(h5, s) && thisSymbol(h9, s)
            {
                return true
            }
            if thisSymbol(h3, s) && thisSymbol(h5, s) && thisSymbol(h7, s)
            {
                return true
            }
            return false
        }
        
        func thisSymbol(_ button : UIButton , _ symbol : String )-> Bool
        {
            return button.title(for: .normal) == symbol
        }
        
        func resetBoard()
        {
            for button in board
            {
                button.setTitle(nil, for: .normal)
                button.isEnabled = true
                }
            if FirstTurn == Turn.cross
            {
                FirstTurn = Turn.zero
                
                
            }
            else if(FirstTurn == Turn.zero)
            {
                FirstTurn = Turn.cross
                
            }
            currentTurn = FirstTurn
        }
        
        func actionOnBoard(_ sender : UIButton){
            if (sender.title(for: .normal) == nil)
            {
                if(currentTurn == Turn.zero)
                {
                    sender.setTitle(z, for: .normal)
                    currentTurn = Turn.cross
                    
                } else if(currentTurn == Turn.cross)
                {
                    sender.setTitle(c, for: .normal)
                    currentTurn = Turn.zero
                    
                }
            }
        }
        
        override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            
            for button in board
            {
    //            button.setTitle(nil, for: .normal)
    //            button.isEnabled = true
    //            }
    //        if FirstTurn == PlayerTurn.cross
    //        {
    //            FirstTurn = PlayerTurn.zero
    //            turnlabel.text = zero
    //
    //        }
    //        else if(FirstTurn == PlayerTurn.zero)
    //        {
    //            FirstTurn = PlayerTurn.cross
    //            turnlabel.text = cross
    //        }
    //        currentTurn = FirstTurn
                
                
                //let button ;
                
        }
        }
        
    }
    
    
    





