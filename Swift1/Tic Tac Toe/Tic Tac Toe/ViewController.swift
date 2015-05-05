//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Joe Lucero on 1/15/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

var playerTurn = 1
// 0 = empty; 1 = X; 2 = O
var gameState = [0,0,0,0,0,0,0,0,0]
let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
var winner = 0
var whichCombinationWon = 0

class ViewController: UIViewController {
    @IBOutlet var winnerScreen: UILabel!
    @IBOutlet var playAgain: UIButton!
    @IBOutlet var v1: UIImageView!
    @IBOutlet var v2: UIImageView!
    @IBOutlet var v3: UIImageView!
    @IBOutlet var h1: UIImageView!
    @IBOutlet var h2: UIImageView!
    @IBOutlet var h3: UIImageView!
    @IBOutlet var d1: UIImageView!
    @IBOutlet var d2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button0Pressed(sender: AnyObject) {
        var image = UIImage()
        println(sender.tag)

        if (gameState[sender.tag]==0 && winner == 0)
        {
            if playerTurn%2 == 0
            {
                image = UIImage(named: "letterO.png")!
                gameState[sender.tag] = 2
            }
        
            else
            {
                image = UIImage(named: "letterX.png")!
                gameState[sender.tag] = 1
            }
        
            playerTurn++
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations
            {

                    if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[2]] == gameState[combination[1]] && gameState[combination[0]] != 0)
                    {
                    winner = gameState[combination[0]]
                    whichRedLineToShow()
                    }
                whichCombinationWon++
            }
        }
        
        if (winner != 0)
        {
            println("player \(winner) won")
            winnerScreen.hidden = false
            playAgain.hidden = false
            whichRedLineToShow()
            
            if (winner == 1)
            {
                winnerScreen.text = "X has won!"
            }
                
            else
            {
                winnerScreen.text = "O has won!"
            }
        }
        
        whichCombinationWon = 0;
    }

    @IBAction func playAgainPressed(sender: AnyObject)
    {
        playerTurn = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        winner = 0
        winnerScreen.hidden = true
        playAgain.hidden = true
        h1.hidden = true
        h2.hidden = true
        h3.hidden = true
        v1.hidden = true
        v2.hidden = true
        v3.hidden = true
        d1.hidden = true
        d2.hidden = true
        
        var button : UIButton
        
        for var i = 0; i < 9; i++
        
        {
        button = view.viewWithTag(i) as UIButton
        button.setImage (nil , forState: .Normal)
        }

        
    }
    
    func whichRedLineToShow()
    {
        if whichCombinationWon == 0
        {
            h1.hidden = false
        }
        
        else if whichCombinationWon == 1
        {
            h2.hidden = false
        }
        
        else if whichCombinationWon == 2
        {
            h3.hidden = false
        }
        
        else if whichCombinationWon == 3
        {
            v1.hidden = false
        }
        
        else if whichCombinationWon == 4
        {
            v2.hidden = false
        }
        
        else if whichCombinationWon == 5
        {
            v3.hidden = false
        }
        
        else if whichCombinationWon == 6
        {
            d1.hidden = false
        }
        
        else if whichCombinationWon == 7
        {
            d2.hidden = false
        }
        
    }
}

