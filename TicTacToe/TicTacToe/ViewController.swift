//
//  ViewController.swift
//  TicTacToe
//
//  Created by Gary Hicks on 2018-02-05.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func restart(_ sender: Any) {
        winnerLabel.isHidden=true
        restartButton.isHidden=true
        
        activeGame=true
        player = 1
        game = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0=empty, 1=player1, 2=player2
        
        for i in 1..<10 { //saves using a counter!
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
    }
    
    //player 1 is o's, player 2 is x's
    var player = 1
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0=empty, 1=player1, 2=player2
    let winComb = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var activeGame = true
    var counter = 0
    
    @IBAction func click(_ sender: AnyObject) {
        
        let position = sender.tag-1
        
        if game[position] == 0 && activeGame {
            counter+=1
            print(counter)
            if player == 1 {
                sender.setImage(UIImage(named: "alphabet-letter-o.jpg"), for : [])
                player = 2
                game[position]=1
            }
            else{
                sender.setImage(UIImage(named: "alphabet-letter-x.jpg"), for : [])
                player = 1
                game[position]=2
            }
            for i in winComb {
                if game[i[0]] != 0 && game[i[1]] == game[i[2]] && game[i[2]] == game[i[0]]{ //We must have a winner
                    activeGame = false
                    
                    if game[i[0]] == 1 {
                        
                        winnerLabel.text = "O's have won!"
                        winnerLabel.isHidden = false
                        restartButton.isHidden = false
                        counter = 0
                    }
                    else if game[i[0]] == 2 {
                        
                        winnerLabel.text = "X's have won!"
                        winnerLabel.isHidden = false
                        restartButton.isHidden = false
                        counter = 0
                    }
                }
            }
            if counter == 9 {
                activeGame=false
                winnerLabel.text = "Tie!"
                winnerLabel.isHidden = false
                restartButton.isHidden = false
                counter = 0
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden=true
        restartButton.isHidden=true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

