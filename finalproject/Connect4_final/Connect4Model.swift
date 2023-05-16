/*
 CASSANDRA CHAPUT | CCHAPUT
 MICHAEL BUZIL | MBUZIL
 CONNECT-4
 4/28/2023
 */


import Foundation
import CoreData

class Connect4Model {
    var gameHistory = [Int: [String]]()
    var board = [[Int]]()
    var numGames:Int
    var p1Name:String
    var p2Name:String
    var p1Color:String
    var p2Color:String
    var winner:String
    var loser:String
    
    init(){
        self.p1Name = ""
        self.p2Name = ""
        self.p1Color = ""
        self.p2Color = ""
        self.winner = ""
        self.loser = ""
        //IE JESSICA WAS WINNER AND KEVIN WAS LOSER
        self.gameHistory[1] = ["Jessica", "Kevin"]
        //IE SAMMY WAS WINNER AND LAUREN WAS LOSER
        self.gameHistory[2] = ["Sammy", "Lauren"]
        self.numGames = 2
    }
    
    
    func setPlayer1(name:String, color:String){
        //SAVE THE NAME AND COLOR INTO THE MODEL FOR P1
        self.p1Name = name
        self.p1Color = color
    }
    
    
    func setPlayer2(name:String, color:String){
        //SAVE THE NAME AND COLOR INTO THE MODEL FOR P2
        self.p2Name = name
        self.p2Color = color
    }
    
    func clearResults(){
        self.winner = ""
        self.loser = ""
    }
    func newPlayers(){
        self.p1Name = ""
        self.p2Name = ""
        self.p1Color = ""
        self.p2Color = ""
        self.winner = ""
        self.loser = ""
    }
    
    func setResults(won:Int, lost:Int){
        if won == 1{
            self.winner = self.p1Name
            self.loser = self.p2Name
        }
        if won == 2{
            self.winner = self.p2Name
            self.loser = self.p1Name
        }
        self.numGames = self.numGames + 1
        self.gameHistory[self.numGames] = [self.winner, self.loser]
        
    }
    
}
