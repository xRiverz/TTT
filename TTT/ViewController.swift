//
//  ViewController.swift
//  TTT
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //cross
    var gamestate = [0, 0, 0, 0, 0, 0, 0, 0]
    
    let wining = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,8]]
    var gameisactive = true
    
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender : AnyObject){
        
        if ((gamestate[sender.tag-1]) == 0){
            gamestate[sender.tag-1] = activePlayer
        if (activePlayer == 1 ){
            sender.setImage(UIImage(named: "icons8-x-100.png" ), for: UIControl.State())
            activePlayer = 2
        } else{
            sender.setImage(UIImage(named: "icons8-o-100.png" ), for : UIControl.State())
            activePlayer = 1
        }
    }
        for comb in wining
        {
            if gamestate[comb[0]] != 0 && gamestate[comb[0]] == gamestate[comb[1]] && gamestate[comb[1]] == gamestate[comb[2]]
            {
                gameisactive = false
                
                if gamestate[comb[0]] == 1
                {
                    label.text = "Cross Has Won !"
                }else{
                    label.text = "Nought Has Won !"
                }
            }
            playAgainButton.isHidden = false
            label.isHidden = false
        }
        gameisactive = false
       for i in gamestate
       {
           if i == 0 {
               gameisactive = true
               break
           }
       }
       if gameisactive == false
       {
           label.text = "It Was A Draw !"
           label.isHidden = false
           playAgainButton.isHidden = false
       }

    }

    
    @IBOutlet weak var playAgainButton : UIButton!
    @IBAction func playAgain(_ sender : AnyObject)
    {
        gamestate = [0, 0, 0, 0, 0, 0, 0, 0]
        gameisactive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}




