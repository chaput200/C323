/*
 CASSANDRA CHAPUT | CCHAPUT
 MICHAEL BUZIL | MBUZIL
 CONNECT-4
 4/28/2023
 */
import UIKit

class GameOverViewController: UIViewController {
    var appDelegate: AppDelegate?
    var gameSession: Connect4Model?
    
    @IBOutlet weak var gameOverLabel:UILabel!
    
    @IBAction func newGameButton(_ sender: UIButton){
        // GO TO GAME MODE VIEW CONTROLLER
        self.gameSession?.clearResults()
    }
    
    @IBAction func newPlayersbutton(_ sender: UIButton){
        // GO TO GAME MODE VIEW CONTROLLER
        self.gameSession?.newPlayers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.gameSession = self.appDelegate?.game
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
