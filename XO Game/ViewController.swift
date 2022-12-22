//
//  ViewController.swift
//  XO Game
//
//  Created by Muhamed Alkhatib on 20/08/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var position0: UIButton!
    
    @IBOutlet weak var position1: UIButton!
    
    @IBOutlet weak var position2: UIButton!
    
    @IBOutlet weak var position3: UIButton!
    
    @IBOutlet weak var position4: UIButton!
    
    @IBOutlet weak var position5: UIButton!
    
    @IBOutlet weak var position6: UIButton!
    
    @IBOutlet weak var position7: UIButton!
    
    @IBOutlet weak var position8: UIButton!
    
    
    var player : Int = 1
    var gameState : [Int] = [0,0,0,
                             0,0,0,
                             0,0,0]
    var winningIndexes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       resetAll()
    }
    
    func resetAll () {
        gameState=[0,0,0,
                   0,0,0,
                   0,0,0]
        result.text = ""
        position0.setImage(nil, for: UIControl.State.normal)
        position1.setImage(nil, for: UIControl.State.normal)
        position2.setImage(nil, for: UIControl.State.normal)
        position3.setImage(nil, for: UIControl.State.normal)
        position4.setImage(nil, for: UIControl.State.normal)
        position5.setImage(nil, for: UIControl.State.normal)
        position6.setImage(nil, for: UIControl.State.normal)
        position7.setImage(nil, for: UIControl.State.normal)
        position8.setImage(nil, for: UIControl.State.normal)
        gameIsActive = true
    }
    
    func determineWinner (){
        
        for index in winningIndexes{
            
            if gameState[index[0]] == gameState[index[1]] && gameState[index[1]] == gameState[index[2]] &&
                gameState[index[2]] != 0{
                
                var sympole = ""
                if player == 1 {
                    sympole = "X"
                }else{
                    sympole = "O"
                }
                
                result.text = "The Winner is Player \(player) With '\(sympole)'"
                gameIsActive = false
                break
            }
            
        }
         
    }
    
    
    
    func selectPosition(button:UIButton){
    
        if gameIsActive{
            
            if button.image(for: UIControl.State.normal) == nil {
                if player == 1 {
                    
                    button.setImage(UIImage(named: "x3"), for: UIControl.State.normal)
                    gameState[button.tag] = player
                    determineWinner()
                    player = 2
                }else{
                    
                    button.setImage(UIImage(named: "o2"), for: UIControl.State.normal)
                    gameState[button.tag] = player
                    determineWinner()
                    player = 1
                } 
            }
        }
    }
    
    @IBAction func bottonPressed(_ sender: Any) {
        print("work")
        selectPosition(button: sender as! UIButton)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        player = 1
        resetAll()
        print("work")
    }
    
    
    
    
}

