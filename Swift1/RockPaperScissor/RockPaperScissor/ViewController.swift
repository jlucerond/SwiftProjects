//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Joe Lucero on 2/4/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var computerChoice: UILabel!
    @IBOutlet var humanPic: UIImageView!
    @IBOutlet var compPic: UIImageView!
    
    var computerRandomNumber = 0
    var humanNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func humanSelection(sender: AnyObject)
    {
        pickRandomNumber()
        humanNumber = sender.tag
        println("You picked \(humanNumber)")
        if humanNumber == 0
        {
            humanPic.image = UIImage(named: "rock.png")
        }
        else if humanNumber == 1
        {
            humanPic.image = UIImage(named: "paper.png")
        }
        
        else
        {
            humanPic.image = UIImage(named: "scissor.png")
        }
        
        determineWinner()
        
        
    }
    
    func pickRandomNumber()
    {
        computerRandomNumber = Int(arc4random_uniform(3))
        println("Computer picked \(computerRandomNumber)")
        
        if computerRandomNumber == 0
        {
            computerChoice.text = "Rock"
            compPic.image = UIImage(named: "Crock.png")
        }
            
        else if computerRandomNumber == 1
        {
            computerChoice.text = "Paper"
            compPic.image = UIImage(named: "Cpaper.png")
        }
            
        else
        {
            computerChoice.text = "Scissor"
            compPic.image = UIImage(named: "Cscissor.png")
        }
    }
    
    func determineWinner()
    {
        if humanNumber == computerRandomNumber
        {
            winnerLabel.text = "Tie!"
        }
        else if humanNumber == 0
        {
            if computerRandomNumber == 1
            {
                winnerLabel.text = "Computer wins- \npaper beats rock!"
            }
            else
            {
                winnerLabel.text = "Human wins- \nrock beats scissor!"
            }
        }
        else if humanNumber == 1
        {
            if computerRandomNumber == 2
            {
                winnerLabel.text = "Computer wins- \nscissor beats paper!"
            }
            else
            {
                winnerLabel.text = "Human wins- \npaper beats rock!"
            }
        }
        else if humanNumber == 2
        {
            if computerRandomNumber == 0
            {
                winnerLabel.text = "Computer wins- \nrock beats scissor!"
            }
            else
            {
                winnerLabel.text = "Human wins- \nscissor beats paper!"
            }
        }
    }

}

