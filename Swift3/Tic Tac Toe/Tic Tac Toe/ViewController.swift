//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Joe Lucero on 4/16/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variables
    var count = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var winner = 0
    //IBOutlet Collection
    @IBOutlet var allGameButtons: [UIButton]!
    //IBOutlets
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    //XCode Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    //IBActions
    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0
        {
            var image : UIImage

            if count%2 == 0{
                image = UIImage(named: "o.png")!
                gameState[sender.tag] = count
                count = 1
            }
            else{
                image = UIImage(named: "x.png")!
                gameState[sender.tag] = count
                count = 2
            }
        
            sender.setImage(image, forState: .Normal)
        
            checkToSeeIfWinner()
        }
    }
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
        count = 1
        winner = 0
        gameState = [0,0,0,0,0,0,0,0,0]
        winnerLabel.alpha = 0
        playAgainButton.hidden = true
        
        
        
        for var i = 0; i < 9; i++
        {
            allGameButtons[i].setImage(nil, forState: .Normal)
        }
        
    }
    //Other Functions
    func checkToSeeIfWinner(){
        var sumOfGameStates = 0

        for combination in winningCombinations{
            var a = gameState[combination[0]]
            var b = gameState[combination[1]]
            var c = gameState[combination[2]]
            
            if a == b && a == c && a != 0 {
                winner = a
                declareWinner()
            }
        }
        for singleState in gameState{
            sumOfGameStates += singleState
        }
        
        if sumOfGameStates == 13 {
            winner = 100
            declareWinner()
        }
        
    }
    func declareWinner(){
        winnerLabel.alpha = 0.5
        gameState = [3, 4, 5, 6, 7, 8, 9, 10, 11]
        playAgainButton.hidden = false
        
        if winner == 1 {
            winnerLabel.text = "X WON!"
        }
        
        else if winner == 2 {
            winnerLabel.text = "O WON!"
        }
        
        else {
            winnerLabel.text = "TIE!"
        }
        
    }
}

