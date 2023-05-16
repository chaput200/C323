/*
 CASSANDRA CHAPUT | CCHAPUT
 MICHAEL BUZIL | MBUZIL
 CONNECT-4
 4/28/2023
 */

import CoreHaptics
import UIKit

class GameBoardView: UIView {
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    var engine: CHHapticEngine!
    let hapticDict = [
        CHHapticPattern.Key.pattern: [
            [CHHapticPattern.Key.event: [
                CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticContinuous,
                CHHapticPattern.Key.time: CHHapticTimeImmediate,
                CHHapticPattern.Key.eventDuration: 1.5]
            ]
        ]
    ]
    
    var game:[[Int]] = [[0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0]]
    
    var numChipsCol0:Int = 6
    var numChipsCol1:Int = 6
    var numChipsCol2:Int = 6
    var numChipsCol3:Int = 6
    var numChipsCol4:Int = 6
    var numChipsCol5:Int = 6
    var numChipsCol6:Int = 6
    var winner:Int = 0
    var firstMove:Bool = true
    var player1Turn:Bool = true
    var x:CGFloat = 30
    var y:CGFloat = 30
    
    var redChipColor: UIColor = UIColor.red {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var greenChipColor: UIColor = UIColor.green {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var yellowChipColor: UIColor = UIColor.yellow {
        didSet {
            self.setNeedsDisplay()
        }
    }
    //let lightBlue = UIColor(named: "#0096FF")
    var blueChipColor: UIColor = UIColor(red: 0, green: 150, blue: 255, alpha: 255) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var myChipPlacement: CGPoint = CGPoint(x: 0, y: 0){
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    func prepareHaptics(){
        do {
            engine = try CHHapticEngine()
            try engine.start()
        } catch let error {
            fatalError("Engine Creation Error: \(error)")
        }
    }
    
    func playHaptics(){
        do {
            let pattern = try CHHapticPattern(dictionary: hapticDict)
            let player = try engine.makePlayer(with: pattern)
            try player.start(atTime: 0)
            print("HAPTICS PLAYED")
        }catch let error{
            fatalError("ERROR PLAYING HAPTICS: \(error)")
        }
    }
    
    func checkConnect4(){
        print("\n")
        for row in self.game{
            print("\(row[0]),\(row[1]),\(row[2]),\(row[3]),\(row[4]),\(row[5]),\(row[6])")
            
            // CHECK ROW FOR 4 IN A ROW
            // PLAYER 1 HAS 4 IN A ROW
            if row[0] == 1 && row[1] == 1 && row[2] == 1 && row[3] == 1 {
                self.winner = 1
                
            }
            // PLAYER 1 HAS 4 IN A ROW
            if row[1] == 1 && row[2] == 1 && row[3] == 1 && row[4] == 1 {
                self.winner = 1
                
            }
            // PLAYER 1 HAS 4 IN A ROW
            if row[2] == 1 && row[3] == 1 && row[4] == 1 && row[5] == 1 {
                self.winner = 1
                
            }
            // PLAYER 1 HAS 4 IN A ROW
            if row[3] == 1 && row[4] == 1 && row[5] == 1 && row[6] == 1 {
                self.winner = 1
                
            }
            // PLAYER 2 HAS 4 IN A ROW
            if row[0] == 2 && row[1] == 2 && row[2] == 2 && row[3] == 2 {
                self.winner = 2
                
            }
            // PLAYER 2 HAS 4 IN A ROW
            if row[1] == 2 && row[2] == 2 && row[3] == 2 && row[4] == 2 {
                self.winner = 2
                
            }
            // PLAYER 2 HAS 4 IN A ROW
            if row[2] == 2 && row[3] == 2 && row[4] == 2 && row[5] == 2 {
                self.winner = 2
                
            }
            // PLAYER 2 HAS 4 IN A ROW
            if row[3] == 2 && row[4] == 2 && row[5] == 2 && row[6] == 2 {
                self.winner = 2
                
            }
        }
        
        // CHECK COLUMNS FOR 4 IN A COLUMN
        for i in 0...6{
            //IF CONNECT 4 IN COL i BY P1
            if self.game[5][i] == 1 && self.game[4][i] == 1 && self.game[3][i] == 1 && self.game[2][i] == 1{
                self.winner = 1
                
            }
            if self.game[4][i] == 1 && self.game[3][i] == 1 && self.game[2][i] == 1 && self.game[1][i] == 1{
                self.winner = 1
                
            }
            if self.game[3][i] == 1 && self.game[2][i] == 1 && self.game[1][i] == 1 && self.game[0][i] == 1{
                self.winner = 1
                
            }
            //IF CONNECT 4 IN COL i BY P2
            if self.game[5][i] == 2 && self.game[4][i] == 2 && self.game[3][i] == 2 && self.game[2][i] == 2{
                self.winner = 2
                
            }
            if self.game[4][i] == 2 && self.game[3][i] == 2 && self.game[2][i] == 2 && self.game[1][i] == 2{
                self.winner = 2
                
            }
            if self.game[3][i] == 2 && self.game[2][i] == 2 && self.game[1][i] == 2 && self.game[0][i] == 2{
                self.winner = 2
                
            }
        }
        
        //CHECKING FOR DIAGONAL CONNECT 4
        // ROW 3 DIAGONAL START
        if self.game[3][0] == 1 && self.game[2][1] == 1 && self.game[1][2] == 1 && self.game[0][3] == 1{
            self.winner = 1
        }
        if self.game[3][1] == 1 && self.game[2][2] == 1 && self.game[1][3] == 1 && self.game[0][4] == 1{
            self.winner = 1
        }
        if self.game[3][2] == 1 && self.game[2][3] == 1 && self.game[1][4] == 1 && self.game[0][5] == 1{
            self.winner = 1
        }
        if self.game[3][3] == 1 && self.game[2][4] == 1 && self.game[1][5] == 1 && self.game[0][6] == 1{
            self.winner = 1
        }
        //SLANT TOP LEFT TO BOTTOM RIGHT
        if self.game[3][6] == 1 && self.game[2][5] == 1 && self.game[1][4] == 1 && self.game[0][3] == 1{
            self.winner = 1
        }
        if self.game[3][5] == 1 && self.game[2][4] == 1 && self.game[1][3] == 1 && self.game[0][2] == 1{
            self.winner = 1
        }
        if self.game[3][4] == 1 && self.game[2][3] == 1 && self.game[1][2] == 1 && self.game[0][1] == 1{
            self.winner = 1
        }
        if self.game[3][3] == 1 && self.game[2][2] == 1 && self.game[1][1] == 1 && self.game[0][0] == 1{
            self.winner = 1
        }
        //ROW 4 START DIAGONAL
        if self.game[4][0] == 1 && self.game[3][1] == 1 && self.game[2][2] == 1 && self.game[1][3] == 1{
            self.winner = 1
        }
        if self.game[4][1] == 1 && self.game[3][2] == 1 && self.game[2][3] == 1 && self.game[1][4] == 1{
            self.winner = 1
        }
        if self.game[4][2] == 1 && self.game[3][3] == 1 && self.game[2][4] == 1 && self.game[1][5] == 1{
            self.winner = 1
        }
        if self.game[4][3] == 1 && self.game[3][4] == 1 && self.game[2][5] == 1 && self.game[1][6] == 1{
            self.winner = 1
        }
        //SLANT TOP LEFT TO BOTTOM RIGHT
        if self.game[4][6] == 1 && self.game[3][5] == 1 && self.game[2][4] == 1 && self.game[1][3] == 1{
            self.winner = 1
        }
        if self.game[4][5] == 1 && self.game[3][4] == 1 && self.game[2][3] == 1 && self.game[1][2] == 1{
            self.winner = 1
        }
        if self.game[4][4] == 1 && self.game[3][3] == 1 && self.game[2][2] == 1 && self.game[1][1] == 1{
            self.winner = 1
        }
        if self.game[4][3] == 1 && self.game[3][2] == 1 && self.game[2][1] == 1 && self.game[1][0] == 1{
            self.winner = 1
        }
        //ROW 5 START DIAGONAL
        //SLANT TOP RIGHT TO BOTTOM LEFT
        if self.game[5][0] == 1 && self.game[4][1] == 1 && self.game[3][2] == 1 && self.game[2][3] == 1{
            self.winner = 1
        }
        if self.game[5][1] == 1 && self.game[4][2] == 1 && self.game[3][3] == 1 && self.game[2][4] == 1{
            self.winner = 1
        }
        if self.game[5][2] == 1 && self.game[4][3] == 1 && self.game[3][4] == 1 && self.game[2][5] == 1{
            self.winner = 1
        }
        if self.game[5][3] == 1 && self.game[4][4] == 1 && self.game[3][5] == 1 && self.game[2][6] == 1{
            self.winner = 1
        }
        //SLANT TOP LEFT TO BOTTOM RIGHT
        if self.game[5][6] == 1 && self.game[4][5] == 1 && self.game[3][4] == 1 && self.game[2][3] == 1{
            self.winner = 1
        }
        if self.game[5][5] == 1 && self.game[4][4] == 1 && self.game[3][3] == 1 && self.game[2][2] == 1{
            self.winner = 1
        }
        if self.game[5][4] == 1 && self.game[4][3] == 1 && self.game[3][2] == 1 && self.game[2][1] == 1{
            self.winner = 1
        }
        if self.game[5][3] == 1 && self.game[4][2] == 1 && self.game[3][1] == 1 && self.game[2][0] == 1{
            self.winner = 1
        }
        
        //CHECKING FOR DIAGONAL CONNECT 4
        //FOR PLAYER 2
        // ROW 3 DIAGONAL START
        if self.game[3][0] == 2 && self.game[2][1] == 2 && self.game[1][2] == 2 && self.game[0][3] == 2{
            self.winner = 2
        }
        if self.game[3][1] == 2 && self.game[2][2] == 2 && self.game[1][3] == 2 && self.game[0][4] == 2{
            self.winner = 2
        }
        if self.game[3][2] == 2 && self.game[2][3] == 2 && self.game[1][4] == 2 && self.game[0][5] == 2{
            self.winner = 2
        }
        if self.game[3][3] == 2 && self.game[2][4] == 2 && self.game[1][5] == 2 && self.game[0][6] == 2{
            self.winner = 2
        }
        //SLANT TOP LEFT TO BOTTOM RIGHT
        if self.game[3][6] == 2 && self.game[2][5] == 2 && self.game[1][4] == 2 && self.game[0][3] == 2{
            self.winner = 2
        }
        if self.game[3][5] == 2 && self.game[2][4] == 2 && self.game[1][3] == 2 && self.game[0][2] == 2{
            self.winner = 2
        }
        if self.game[3][4] == 2 && self.game[2][3] == 2 && self.game[1][2] == 2 && self.game[0][1] == 2{
            self.winner = 2
        }
        if self.game[3][3] == 2 && self.game[2][2] == 2 && self.game[1][1] == 2 && self.game[0][0] == 2{
            self.winner = 2
        }
        //ROW 4 START DIAGONAL
        if self.game[4][0] == 2 && self.game[3][1] == 2 && self.game[2][2] == 2 && self.game[1][3] == 2{
            self.winner = 2
        }
        if self.game[4][1] == 2 && self.game[3][2] == 2 && self.game[2][3] == 2 && self.game[1][4] == 2{
            self.winner = 2
        }
        if self.game[4][2] == 2 && self.game[3][3] == 2 && self.game[2][4] == 2 && self.game[1][5] == 2{
            self.winner = 2
        }
        if self.game[4][3] == 2 && self.game[3][4] == 2 && self.game[2][5] == 2 && self.game[1][6] == 2{
            self.winner = 2
        }
        //SLANT TOP LEFT TO BOTTOM RIGHT
        if self.game[4][6] == 2 && self.game[3][5] == 2 && self.game[2][4] == 2 && self.game[1][3] == 2{
            self.winner = 2
        }
        if self.game[4][5] == 2 && self.game[3][4] == 2 && self.game[2][3] == 2 && self.game[1][2] == 2{
            self.winner = 2
        }
        if self.game[4][4] == 2 && self.game[3][3] == 2 && self.game[2][2] == 2 && self.game[1][1] == 2{
            self.winner = 2
        }
        if self.game[4][3] == 2 && self.game[3][2] == 2 && self.game[2][1] == 2 && self.game[1][0] == 2{
            self.winner = 2
        }
        //ROW 5 START DIAGONAL
        //SLANT TOP RIGHT TO BOTTOM LEFT
        if self.game[5][0] == 2 && self.game[4][1] == 2 && self.game[3][2] == 2 && self.game[2][3] == 2{
            self.winner = 2
        }
        if self.game[5][1] == 2 && self.game[4][2] == 2 && self.game[3][3] == 2 && self.game[2][4] == 2{
            self.winner = 2
        }
        if self.game[5][2] == 2 && self.game[4][3] == 2 && self.game[3][4] == 2 && self.game[2][5] == 2{
            self.winner = 2
        }
        if self.game[5][3] == 2 && self.game[4][4] == 2 && self.game[3][5] == 2 && self.game[2][6] == 2{
            self.winner = 2
        }
        //SLANT TOP LEFT TO BOTTOM RIGHT
        if self.game[5][6] == 2 && self.game[4][5] == 2 && self.game[3][4] == 2 && self.game[2][3] == 2{
            self.winner = 2
        }
        if self.game[5][5] == 2 && self.game[4][4] == 2 && self.game[3][3] == 2 && self.game[2][2] == 2{
            self.winner = 2
        }
        if self.game[5][4] == 2 && self.game[4][3] == 2 && self.game[3][2] == 2 && self.game[2][1] == 2{
            self.winner = 2
        }
        if self.game[5][3] == 2 && self.game[4][2] == 2 && self.game[3][1] == 2 && self.game[2][0] == 2{
            self.winner = 2
        }
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        //let drawingBounds = self.bounds
        //let w = drawingBounds.width
        //print("DRAWING BOUNDS WIDTH = \(drawingBounds.width)")
        let r:CGFloat = 20
        let space:CGFloat = 45
        //print("(ROW, COL) CIRCLE CENTER: (X, Y)")
        
        for row in 0...6{
            for col in 0...5{
                /* let emptySlot = UIBezierPath()
                 emptySlot.addArc(withCenter:CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space),
                 radius: r,
                 startAngle: 0,
                 endAngle: 6.28,
                 clockwise: true)
                 UIColor.white.setFill()
                 emptySlot.fill()
                 emptySlot.stroke()
                 print("(\(row), \(col)) CIRCLE CENTER: \(CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space))")
                 */
                let emptySlot = UIBezierPath()
                if self.game[col][row] == 0{
                    emptySlot.addArc(withCenter: CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space),
                                     radius: r,
                                     startAngle: 0,
                                     endAngle: 6.28,
                                     clockwise: true)
                    UIColor.white.setFill()
                    emptySlot.fill()
                    emptySlot.stroke()
                    //print("(\(row), \(col)) CIRCLE CENTER: \(CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space))")
                }
                else if self.game[col][row] == 1{
                    emptySlot.addArc(withCenter: CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space),
                                     radius: r,
                                     startAngle: 0,
                                     endAngle: 6.28,
                                     clockwise: true)
                    
                    
                     if self.appDelegate!.game.p1Color == "green"{
                     self.greenChipColor.setFill()
                     }
                     else if self.appDelegate!.game.p1Color == "red"{
                     self.redChipColor.setFill()
                     }
                     else if self.appDelegate!.game.p1Color == "blue"{
                     self.blueChipColor.setFill()
                     }
                     else if self.appDelegate!.game.p1Color == "yellow"{
                     self.yellowChipColor.setFill()
                     }
                     else{
                     self.redChipColor.setFill()
                     }
                    
                    //self.redChipColor.setFill()
                    emptySlot.fill()
                    emptySlot.stroke()
                    //print("(\(row), \(col)) CIRCLE CENTER: \(CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space))")
                }
                else if self.game[col][row] == 2{
                    emptySlot.addArc(withCenter: CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space),
                                     radius: r,
                                     startAngle: 0,
                                     endAngle: 6.28,
                                     clockwise: true)
                    
                     if self.appDelegate!.game.p2Color == "green"{
                     self.greenChipColor.setFill()
                     }
                     else if self.appDelegate!.game.p2Color == "red"{
                     self.redChipColor.setFill()
                     }
                     else if self.appDelegate!.game.p2Color == "blue"{
                     self.blueChipColor.setFill()
                     }
                     else if self.appDelegate!.game.p2Color == "yellow"{
                     self.yellowChipColor.setFill()
                     }
                     else{
                         self.yellowChipColor.setFill()
                     }
                     
                    
                    //self.yellowChipColor.setFill()
                    emptySlot.fill()
                    emptySlot.stroke()
                    //print("(\(row), \(col)) CIRCLE CENTER: \(CGPoint(x:x+CGFloat(row)*space, y:y+CGFloat(col)*space))")
                }
            }
        }
        checkConnect4()
        prepareHaptics()
        if self.winner != 0{
            do {
                let pattern = try CHHapticPattern(dictionary: hapticDict)
                let player = try engine.makePlayer(with: pattern)
                try player.start(atTime: 0)
                print("HAPTICS PLAYED")
            }catch let error{
                fatalError("ERROR PLAYING HAPTICS: \(error)")
            }
            if self.winner == 1{
                //gameSession?.setResults(won:1, lost:2)
                self.appDelegate?.game.setResults(won:1, lost:2)
            }
            if self.winner == 2{
                //appDelegate?.game.setResults(won:2, lost:1)
                //appDelegate?.game.setResults(won: 2, lost: 1)
                self.appDelegate?.game.setResults(won: 2, lost: 1)
            }
            print("\n !!!!! WINNER IS \(self.appDelegate!.game.winner) !!!!!\n")
            print("P1: \(self.appDelegate!.game.p1Name)\nP2: \(self.appDelegate!.game.p2Name)")
            //print("is descendant : \(self.isDescendant(of: (window?.viewWithTag(1))!))")
            //window?.viewWithTag(1)?.inputViewController?.performSegue(withIdentifier: "showDetail", sender: nil)
            
            //shouldPerformSegue(withIdentifier: "showDetail", sender: Any?)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("TOUCHES BEGAN")
        if let myMove = event {
            let firstTouch = myMove.allTouches!.first
            let startingPoint = firstTouch?.location(in: self)
            //print("TOUCH LOCATION \(startingPoint!.x), \(startingPoint!.y)")
            self.firstMove = false
            var temp:Int = 0
            var color:Int = 0
            if self.player1Turn{
                color = 1
            }
            else{
                color = 2
            }
            //LOCATION OF COLUMN TO PLACE CHIP
            //MAKE CIRCLE APPEAR IN LINE W OTHERS BY USING COORDINATE OF BOARD
            switch startingPoint!.x {
                //IF TOUCH IS IN COL 0
            case 0...52.5:
                self.myChipPlacement.x = 30
                self.numChipsCol0-=1
                temp = self.numChipsCol0
                self.game[self.numChipsCol0][0] = color
                //COL 1
            case 52.6...97.5:
                self.myChipPlacement.x = 75
                self.numChipsCol1-=1
                temp = self.numChipsCol1
                self.game[self.numChipsCol1][1] = color
            //COL 2
            case 97.6...142.5:
                self.myChipPlacement.x = 120
                self.numChipsCol2-=1
                temp = self.numChipsCol2
                self.game[numChipsCol2][2] = color
            //COL 3
            case 142.6...187.5:
                self.myChipPlacement.x = 165
                self.numChipsCol3-=1
                temp = self.numChipsCol3
                self.game[numChipsCol3][3] = color
            //COL 4
            case 187.5...232.5:
                self.myChipPlacement.x = 210
                self.numChipsCol4-=1
                temp = self.numChipsCol4
                self.game[numChipsCol4][4] = color
            //COL 5
            case 232.6...277.5:
                self.myChipPlacement.x = 255
                self.numChipsCol5-=1
                temp = self.numChipsCol5
                self.game[numChipsCol5][5] = color
            //COL 6
            /*case 277.6...322.5:
                self.myChipPlacement.x = 300
                self.numChipsCol6+=1
                 */
            default:
                self.myChipPlacement.x = 300
                self.numChipsCol6-=1
                temp = self.numChipsCol6
                self.game[numChipsCol6][6] = color
            }
            player1Turn = !(player1Turn)
            switch temp {
            //6 CHIPS IN COL
            case 6:
                self.myChipPlacement.y = 30
            //5 CHIPS IN COL
            case 5:
                self.myChipPlacement.y = 75
            //4 CHIPS IN COL
            case 4:
                self.myChipPlacement.y = 120
            //3 CHIPS IN COL
            case 3:
                self.myChipPlacement.y = 165
            //2 CHIPS IN COL
            case 2:
                self.myChipPlacement.y = 210
            //FIRST CHIP IN COL
            default:
                self.myChipPlacement.y = 255
            }
        }
    }
    
}
