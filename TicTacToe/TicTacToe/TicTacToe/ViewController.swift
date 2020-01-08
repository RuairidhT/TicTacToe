//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ruairidh Taylor 2015 (N0629719) on 05/12/2018.
//  Copyright © 2018 Ruairidh Taylor 2015 (N0629719). All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var activePlayer = 1  //Cross = 1, Nought = 2
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameInPlay = true
    var xSoundEffect: AVAudioPlayer = AVAudioPlayer()
    var oSoundEffect: AVAudioPlayer = AVAudioPlayer()
    var ngSoundEffect: AVAudioPlayer = AVAudioPlayer()
    var xScore : Int = 0
    var oScore : Int = 0
    
    @IBOutlet weak var Button1: UIImageView!
    @IBOutlet weak var Button2: UIImageView!
    @IBOutlet weak var Button3: UIImageView!
    @IBOutlet weak var Button4: UIImageView!
    @IBOutlet weak var Button5: UIImageView!
    @IBOutlet weak var Button6: UIImageView!
    @IBOutlet weak var Button7: UIImageView!
    @IBOutlet weak var Button8: UIImageView!
    @IBOutlet weak var Button9: UIImageView!
    
    
//    Kumar, A. (2016). How to assign an action for UIImageView object in Swift. [online] Stack Overflow. Available at: https://stackoverflow.com/questions/27880607/how-to-assign-an-action-for-uiimageview-object-in-swift/27880690 [Accessed 11 Dec. 2018].
//I used this source for figuring out how to give an imageview an action
    
    @objc func Bpressed1(){
        if (game[0] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button1.image = UIImage(named: "cross.png")
                game[0] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button1.image = UIImage(named: "nought.png")
                game[0] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed2(){
        if (game[1] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button2.image = UIImage(named: "cross.png")
                game[1] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button2.image = UIImage(named: "nought.png")
                game[1] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed3(){
        if (game[2] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button3.image = UIImage(named: "cross.png")
                game[2] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button3.image = UIImage(named: "nought.png")
                game[2] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed4(){
        if (game[3] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button4.image = UIImage(named: "cross.png")
                game[3] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button4.image = UIImage(named: "nought.png")
                game[3] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed5(){
        if (game[4] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button5.image = UIImage(named: "cross.png")
                game[4] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button5.image = UIImage(named: "nought.png")
                game[4] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed6(){
        if (game[5] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button6.image = UIImage(named: "cross.png")
                game[5] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button6.image = UIImage(named: "nought.png")
                game[5] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed7(){
        if (game[6] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button7.image = UIImage(named: "cross.png")
                game[6] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button7.image = UIImage(named: "nought.png")
                game[6] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed8(){
        if (game[7] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button8.image = UIImage(named: "cross.png")
                game[7] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button8.image = UIImage(named: "nought.png")
                game[7] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    @objc func Bpressed9(){
        if (game[8] == 0 && gameInPlay == true){
            if activePlayer == 1{
                Button9.image = UIImage(named: "cross.png")
                game[8] = 1
                xSoundEffect.play()
                activePlayer = 2
            }
            else{
                Button9.image = UIImage(named: "nought.png")
                game[8] = 2
                oSoundEffect.play()
                activePlayer = 1
            }
            checkWinner()
        }
    }
    
    //The Swift Guy. (2016). How To Make A Tic Tac Toe Game In Xcode 8 (Swift 3.0). [online] Available at: https://theswiftguy.com/index.php/2016/10/17/how-to-make-a-tic-tac-toe-game-in-xcode-8-swift-3-0/ [Accessed 11 Dec. 2018].
    //I used this source to gain a better understanding in how I would actually go about coding this application it also included some useful algorithms such as checking for winners.
    
    func checkWinner(){
        for combination in winningCombos{
            if game[combination[0]] != 0 && game[combination[0]] == game[combination[1]] && game[combination[1]] == game[combination[2]]{
                
                gameInPlay = false
                
                if game[combination[0]] == 1{
                    xPlayer.isHidden = true
                    oPlayer.isHidden = true
                    winner.image = UIImage(named: "xWins.png")
                    xScore += 1
                    xPlayer.text = "X's Score = " + String(xScore)
                }
                else{
                    xPlayer.isHidden = true
                    oPlayer.isHidden = true
                    winner.image = UIImage(named: "oWins.png")
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
                xPlayer.isHidden = true
                oPlayer.isHidden = true
                winner.image = UIImage(named: "draw.png")
                winner.isHidden = false
                PlayAgain.isHidden = false
            }
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
        Button1.image = nil
        Button2.image = nil
        Button3.image = nil
        Button4.image = nil
        Button5.image = nil
        Button6.image = nil
        Button7.image = nil
        Button8.image = nil
        Button9.image = nil
        
    }
    
    @IBOutlet weak var PlayAgain: UIButton!
    @IBOutlet weak var winner: UIImageView!
    @IBOutlet weak var xPlayer: UILabel!
    @IBOutlet weak var oPlayer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(Bpressed1))
        Button1.addGestureRecognizer(tap1)
        Button1.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(Bpressed2))
        Button2.addGestureRecognizer(tap2)
        Button2.isUserInteractionEnabled = true
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(Bpressed3))
        Button3.addGestureRecognizer(tap3)
        Button3.isUserInteractionEnabled = true
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(Bpressed4))
        Button4.addGestureRecognizer(tap4)
        Button4.isUserInteractionEnabled = true
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(Bpressed5))
        Button5.addGestureRecognizer(tap5)
        Button5.isUserInteractionEnabled = true
        
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(Bpressed6))
        Button6.addGestureRecognizer(tap6)
        Button6.isUserInteractionEnabled = true
        
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(Bpressed7))
        Button7.addGestureRecognizer(tap7)
        Button7.isUserInteractionEnabled = true
        
        let tap8 = UITapGestureRecognizer(target: self, action: #selector(Bpressed8))
        Button8.addGestureRecognizer(tap8)
        Button8.isUserInteractionEnabled = true
        
        let tap9 = UITapGestureRecognizer(target: self, action: #selector(Bpressed9))
        Button9.addGestureRecognizer(tap9)
        Button9.isUserInteractionEnabled = true
        
        //YouTube. (2017). XCode 8: Adding sound. [online] Available at: https://www.youtube.com/watch?v=6t8GSpOkN10 [Accessed 11 Dec. 2018].
        //I used this source to help me understand how to add sounds to the application.
        
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
    
    //3?, p. (2016). preferredStatusBarStyle removed in Swift 3?. [online] Stack Overflow. Available at: https://stackoverflow.com/questions/38862208/preferredstatusbarstyle-removed-in-swift-3 [Accessed 11 Dec. 2018].
    //I used this source to get code to change the UI status bar to white since the background is very dark.
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
