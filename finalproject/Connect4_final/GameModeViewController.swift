/*
 CASSANDRA CHAPUT | CCHAPUT
 MICHAEL BUZIL | MBUZIL
 CONNECT-4
 4/28/2023
 */

import UIKit
import CoreData
import CoreHaptics
import CoreGraphics

class GameModeViewController: UIViewController{
    var appDelegate: AppDelegate?
    var gameSession: Connect4Model?
    var gameBoard: GameBoardView?
    
    @IBOutlet weak var board:GameBoardView!
    @IBOutlet weak var connect4Label:UILabel!
    //@IBOutlet var gameBoard:UIView!
    //@IBOutlet weak var p1Name:UILabel!
    //@IBOutlet weak var p2Name:UILabel!
    
    var firstMove:Bool = true
    var player1Turn:Bool = true
    
    @IBAction func endGameButton(_ sender:Any){
        if let lNavigationController = self.navigationController {
            let lSiblingViewControllers = lNavigationController.viewControllers
            lSiblingViewControllers[0].loadView()
        }
    }
    
    //NEED FUNC FOR DROPPING CHIPS AND CHECKING IF 4 CONNECTED
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.gameSession = self.appDelegate?.game
        self.view.addSubview(GameBoardView())
        self.gameBoard = GameBoardView.init(frame: self.view.subviews[0].bounds)
        super.viewDidLayoutSubviews()
        //print("GMVC P1 IS: \(self.gameSession?.p1Name)")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}




