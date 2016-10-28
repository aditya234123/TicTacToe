//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aditya Yadav on 10/27/16.
//  Copyright © 2016 Aditya Yadav. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var winninglabel: UILabel!
    @IBOutlet weak var winningbutton: UIButton!
    
    var activeplayer = 1 //cross
    var gamestate = [0,0,0,0,0,0,0,0,0]
    
    let winningcomb = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameisactive = true
    
    @IBAction func clickedon(_ sender: UIButton) {
        
        if(gamestate[sender.tag-1] == 0 && gameisactive == true){
            
            gamestate[sender.tag-1] = activeplayer
            
            if (activeplayer == 1){
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState.normal)
                activeplayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState.normal)
                activeplayer = 1
            }
            
            
        }
        
        
        
        
        for combination in winningcomb{
            
            if (gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]]){
                gameisactive = false
                
                if(gamestate[combination[0]] == 1){
                    //cross won
                    winninglabel.text = "Crosses won"
                }
                else{
                    //nought won
                    winninglabel.text = "O's won"
                }
               
                winninglabel.isHidden = false
                winningbutton.isHidden = false
                
                
            }
        }
        
        
        gameisactive = false
        
        for i in gamestate
        {
            if i == 0
            {
                gameisactive = true
                break
            }
        }
        
        if gameisactive == false
        {
            winninglabel.text = "IT WAS A DRAW"
            winninglabel.isHidden = false
            winningbutton.isHidden = false
        }
        
        
    }
    
    @IBAction func playagainclicked(_ sender: UIButton) {
        
        
        gamestate = [0,0,0,0,0,0,0,0,0]
        
        activeplayer = 1
        winningbutton.isHidden = true
        winninglabel.isHidden = true
        gameisactive = true
        
        for k in 1...9{
            let button = view.viewWithTag(k) as? UIButton
            button?.setImage(nil, for: UIControlState.normal)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

