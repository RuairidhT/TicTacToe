//
//  AIViewController.swift
//  TicTacToe
//
//  Created by Ruairidh Taylor 2015 (N0629719) on 07/12/2018.
//  Copyright © 2018 Ruairidh Taylor 2015 (N0629719). All rights reserved.
//

import UIKit
import AVFoundation

class AIViewController: UIViewController, AVAudioPlayerDelegate{

    var activePlayer = 1  //Cross = 1, Nought = 2
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameInPlay = true
    var xSoundEffect: AVAudioPlayer = AVAudioPlayer()
    var oSoundEffect: AVAudioPlayer = AVAudioPlayer()
    var ngSoundEffect: AVAudioPlayer = AVAudioPlayer()
    var xScore : Int = 0
    var oScore : Int = 0
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    
    
    @IBAction func gamePlay(_ sender: UIButton) {
        
        
        if (game[sender.tag-1] == 0 && gameInPlay == true){
            
            game[sender.tag-1] = activePlayer
            
            if (activePlayer == 1){
                sender.setImage(UIImage(named: "cross.png"), for: .normal)
                xSoundEffect.play()
                activePlayer = 2
                checkForWinner()
            }
            
            if gameInPlay == true{
                AITurn()
            }
            checkForWinner()
            activePlayer = 1
        }
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
        ngSoundEffect.play()
        game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameInPlay = true
        activePlayer = 1
        winner.isHidden = true
        PlayAgain.isHidden = true
        xPlayer.isHidden = false
        oPlayer.isHidden = false
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    @IBOutlet weak var PlayAgain: UIButton!
    @IBOutlet weak var winner: UIImageView!
    @IBOutlet weak var xPlayer: UILabel!
    @IBOutlet weak var oPlayer: UILabel!
    
    func checkForWinner(){
        
        for combination in winningCombos{
            if game[combination[0]] != 0 && game[combination[0]] == game[combination[1]] && game[combination[1]] ==
                game[combination[2]]
            {
                
                gameInPlay = false
                
                if game[combination[0]] == 1{
                    xPlayer.isHidden = true
                    oPlayer.isHidden = true
                    winner.image = UIImage(named: "playerWins.png")
                    xScore += 1
                    xPlayer.text = "X's Score = " + String(xScore)
                }
                else{
                    xPlayer.isHidden = true
                    oPlayer.isHidden = true
                    winner.image = UIImage(named: "computerWins.png")
                    oScore += 1
                    oPlayer.text = "O's Score = " + String(oScore)
                }
                
                PlayAgain.isHidden = false
                winner.isHidden = false
            }
            
        }
        var count = 1
        if gameInPlay == true{
            for i in game{
                count = i*count
            }
            if count != 0{
                gameInPlay = false
                xPlayer.isHidden = true
                oPlayer.isHidden = true
                winner.image = UIImage(named: "draw.png")
                winner.isHidden = false
                PlayAgain.isHidden = false
           }
        }
    }
    
    //GitHub. (2015). Tic-Tac-Toe-with-undefeatable-AI. [online] Available at: https://github.com/tanmayb123/Tic-Tac-Toe-with-undefeatable-AI/blob/master/TicTacToe(WithAI)/ViewController.swift [Accessed 11 Dec. 2018].
    //This source helped me understand how the computer would take its turn by figuring out which is the best move to take given the current situation.
    
    func AITurn() {
        var currentMove: Int!
        
        //Play sides
        if game[1] == 0 {
            currentMove = 2
        }
        if game[3] == 0 {
            currentMove = 4
        }
        if game[5] == 0 {
            currentMove = 6
        }
        if game[7] == 0 {
            currentMove = 8
        }
        
        //Play corners
        if game[0] == 0 {
            currentMove = 1
        }
        if game[2] == 0 {
            currentMove = 3
        }
        if game[6] == 0 {
            currentMove = 7
        }
        if game[8] == 0 {
            currentMove = 9
        }
        
        //Play center
        if game[4] == 0 {
            currentMove = 5
        }
        
        //Block forks
        if game[1] == 1 && game[3] == 1 && game[0] == 0 {
            currentMove = 1
        }
        if game[3] == 1 && game[7] == 1 && game[6] == 0 {
            currentMove = 7
        }
        if game[7] == 1 && game[5] == 1 && game[8] == 0 {
            currentMove = 9
        }
        if game[5] == 1 && game[1] == 1 && game[2] == 0 {
            currentMove = 3
        }
        
        //Block winning
            //top
        if game[0] == 1 && game[1] == 1 && game[2] == 0 {
            currentMove = 3
        }
        if game[0] == 1 && game[1] == 0 && game[2] == 1 {
            currentMove = 2
        }
        if game[0] == 0 && game[1] == 1 && game[2] == 1 {
            currentMove = 1
        }
            //Middle
        if game[3] == 1 && game[4] == 1 && game[5] == 0 {
            currentMove = 6
        }
        if game[3] == 1 && game[4] == 0 && game[5] == 1 {
            currentMove = 5
        }
        if game[3] == 0 && game[4] == 1 && game[5] == 1 {
            currentMove = 4
        }
            //Bottom
        if game[6] == 1 && game[7] == 1 && game[8] == 0 {
            currentMove = 9
        }
        if game[6] == 1 && game[7] == 0 && game[8] == 1 {
            currentMove = 8
        }
        if game[6] == 0 && game[7] == 1 && game[8] == 1 {
            currentMove = 7
        }
            //Left
        if game[0] == 1 && game[3] == 1 && game[6] == 0 {
            currentMove = 7
        }
        if game[0] == 1 && game[3] == 0 && game[6] == 1 {
            currentMove = 4
        }
        if game[0] == 0 && game[3] == 1 && game[6] == 1 {
            currentMove = 1
        }
            //Middle
        if game[1] == 1 && game[4] == 1 && game[7] == 0 {
            currentMove = 8
        }
        if game[1] == 1 && game[4] == 0 && game[7] == 1 {
            currentMove = 5
        }
        if game[1] == 0 && game[4] == 1 && game[7] == 1 {
            currentMove = 2
        }
            //Right
        if game[2] == 1 && game[5] == 1 && game[8] == 0 {
            currentMove = 9
        }
        if game[2] == 1 && game[5] == 0 && game[8] == 1 {
            currentMove = 6
        }
        if game[2] == 0 && game[5] == 1 && game[8] == 1 {
            currentMove = 3
        }
        
        //Try Winning
            //top
        if game[0] == 2 && game[1] == 2 && game[2] == 0 {
            currentMove = 3
        }
        if game[0] == 2 && game[1] == 0 && game[2] == 2 {
            currentMove = 2
        }
        if game[0] == 0 && game[1] == 2 && game[2] == 2 {
            currentMove = 1
        }
            //Middle
        if game[3] == 2 && game[4] == 2 && game[5] == 0 {
            currentMove = 6
        }
        if game[3] == 2 && game[4] == 0 && game[5] == 2 {
            currentMove = 5
        }
        if game[3] == 0 && game[4] == 2 && game[5] == 2 {
            currentMove = 4
        }
            //Bottom
        if game[6] == 2 && game[7] == 2 && game[8] == 0 {
            currentMove = 9
        }
        if game[6] == 2 && game[7] == 0 && game[8] == 2 {
            currentMove = 8
        }
        if game[6] == 0 && game[7] == 2 && game[8] == 2 {
            currentMove = 7
        }
            //Left
        if game[0] == 2 && game[3] == 2 && game[6] == 0 {
            currentMove = 7
        }
        if game[0] == 2 && game[3] == 0 && game[6] == 2 {
            currentMove = 4
        }
        if game[0] == 0 && game[3] == 2 && game[6] == 2 {
            currentMove = 1
        }
            //Middle
        if game[1] == 2 && game[4] == 2 && game[7] == 0 {
            currentMove = 8
        }
        if game[1] == 2 && game[4] == 0 && game[7] == 2 {
            currentMove = 5
        }
        if game[1] == 0 && game[4] == 2 && game[7] == 2 {
            currentMove = 2
        }
            //Right
        if game[2] == 2 && game[5] == 2 && game[8] == 0 {
            currentMove = 9
        }
        if game[2] == 2 && game[5] == 0 && game[8] == 2 {
            currentMove = 6
        }
        if game[2] == 0 && game[5] == 2 && game[8] == 2 {
            currentMove = 3
        }
        
        // check for free space and place nought
        if game.contains(0){
            game[currentMove-1] = 2
            oSoundEffect.play()
        }
        if currentMove == 1{
            Button1.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 2{
            Button2.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 3{
            Button3.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 4{
            Button4.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 5{
            Button5.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 6{
            Button6.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 7{
            Button7.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 8{
            Button8.setImage(UIImage(named: "nought.png"), for: .normal)
        }
        if currentMove == 9{
            Button9.setImage(UIImage(named: "nought.png"), for: .normal)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xMusicFile = Bundle.main.path(forResource: "Cross", ofType: "mp3")
        let oMusicFile = Bundle.main.path(forResource: "Nought", ofType: "mp3")
        let ngMusicFile = Bundle.main.path(forResource: "newGame", ofType: "mp3")
        
        do{
            try xSoundEffect = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: xMusicFile!) as URL)
        }
        catch{
            print(error)
        }
        do{
            try oSoundEffect = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: oMusicFile!) as URL)
        }
        catch{
            print(error)
        }
        do{
            try ngSoundEffect = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: ngMusicFile!) as URL)
        }
        catch{
            print(error)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
