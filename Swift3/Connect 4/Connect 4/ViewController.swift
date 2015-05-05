//
//  ViewController.swift
//  Connect 4
//
//  Created by Joe Lucero on 4/16/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var turn = 1
    var howManyPicked = [0,0,0,0,0,0,0]
    var gameState = [[0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0]]
    
    @IBOutlet var firstRow: [UIImageView]!
    @IBOutlet var secondRow: [UIImageView]!
    @IBOutlet var thirdRow: [UIImageView]!
    @IBOutlet var fourthRow: [UIImageView]!
    @IBOutlet var fifthRow: [UIImageView]!
    @IBOutlet var sixthRow: [UIImageView]!
    @IBOutlet var seventhRow: [UIImageView]!
    
    var allRows = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allRows.append(firstRow)
        allRows.append(secondRow)
        allRows.append(thirdRow)
        allRows.append(fourthRow)
        allRows.append(fifthRow)
        allRows.append(sixthRow)
        allRows.append(seventhRow)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickedButton(sender: AnyObject) {
        var rowSelected = sender.tag
        if howManyPicked[rowSelected] != 6 {
        
        // red goes
        if turn == 1 {
            // which row
            var whichRow = allRows[sender.tag] as! NSArray
            
            //which spot
            var whatHeight = howManyPicked[rowSelected]
            var theThing = whichRow[whatHeight] as! UIImageView
            
            //which color/score
            theThing.backgroundColor = UIColor.redColor()
            
            //change gameState
            var myRow = gameState[rowSelected]
            gameState[rowSelected][howManyPicked[rowSelected]] = 1
            println(gameState)
            
            
            //which turn
            turn = 2
            
            //increase the array
            howManyPicked[rowSelected]++
            
        }
        // black goes
        else{
            // which row
            var whichRow = allRows[sender.tag] as! NSArray
            
            //which spot
            var whatHeight = howManyPicked[rowSelected]
            var theThing = whichRow[whatHeight] as! UIImageView
            
            //which color/score
            theThing.backgroundColor = UIColor.blackColor()
            
            //change gameState
            var myRow = gameState[rowSelected]
            gameState[rowSelected][howManyPicked[rowSelected]] = 2
            println(gameState)
            
            
            //which turn
            turn = 1
            
            //increase the array
            howManyPicked[rowSelected]++
        }
            
        //checkForWinner()
        }
    }
    
    func checkForWinner(){
        var winningStates = [[0][0], [0][1], [0][2]]
        
        for state in winningStates{
            var a = gameState[state][state]
            println(a)
        }
    }

}

