//
//  ViewController.swift
//  2048
//
//  Created by Student on 8/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
   @IBOutlet weak var myLabel: UILabel!
    var board = [[2,2,2,2],[2,2,2,2],[2,2,2,2],[2,2,2,2]]
    
    //func override viewDidLoad() {
    //    super.viewDidLoad()
    //}
    
    func printBoard(){
        var buffer: String = ""
        for row in 0...3{
            for col in 0...3{
                buffer += String(board[row][col]) + " "
            }
            if row != 3 {
                buffer += "\n"
            }
        }
        myLabel.text = buffer
    }
    
    func hide(sender: AnyObject){
        myLabel.text = "Hello"
    }
    
    func addToBoard(sender: AnyObject){
        var empty = 0
        for k in 0...15{
            if board[k/4][k%4] == 0{
                empty += 1
            }
        }
        print(empty)
        
        let placement = arc4random_uniform(UInt32(empty))
        print(placement)
        
        var count = 0
        for k in 0...15{
            if board[k/4][k%4] == 0{
                if UInt(count) == placement {
                    board[k/4][k%4] = 2
                    break
                }
                count += 1
            }
        }
        printBoard()
    }
    @IBAction func moveDown(){
        collapse(direction: 0)
        for col in 0...3{
            for irow in 0...2{
                if board[3-irow][col] == board[2-irow][col]{
                    board[3-irow][col] *= 2
                    board[2-irow][col] = 0
                }
            }
        }
        collapse(direction: 0)
        printBoard()
    }
    func collapse(direction: Int){
        if direction == 0{
            for col in 0...3{
                for i in 1...3{
                    for row in i...3{
                        if board[row][col] == 0{
                            board[row][col] = board[row-1][col]
                            board[row-1][col] = 0
                        }
                    }
                }
            }
        }
    }
}
