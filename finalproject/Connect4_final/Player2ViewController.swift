/*
 CASSANDRA CHAPUT | CCHAPUT
 MICHAEL BUZIL | MBUZIL
 CONNECT-4
 4/28/2023
 */

import UIKit

class Player2ViewController: UIViewController {
    var appDelegate: AppDelegate?
    var gameSession: Connect4Model?
    
    
    @IBOutlet weak var playerNumberLabel:UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var colorLabel:UILabel!
    @IBOutlet weak var nameTextField:UITextField!
    var p1Set = true
    
    
    @IBAction func red(_ sender: UIButton){
        //SEND CHOICE TO MODEL FOR PLAYER INFO
        if(p1Set == false){
            let color = "red"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer1(name: name, color: color)
            }
        }
        else{
            let color = "red"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer2(name: name, color: color)
            }
        }
        if let lNavigationController = self.navigationController {
            let lSiblingViewControllers = lNavigationController.viewControllers
            lSiblingViewControllers[0].loadView()
        }
    }
    
    @IBAction func green(_ sender: UIButton){
        //SEND CHOICE TO MODEL FOR PLAYER INFO
        if(p1Set == false){
            let color = "green"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer1(name: name, color: color)
            }
        }
        else{
            let color = "green"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer2(name: name, color: color)
            }
        }
        if let lNavigationController = self.navigationController {
            let lSiblingViewControllers = lNavigationController.viewControllers
            lSiblingViewControllers[0].loadView()
        }
    }
    
    @IBAction func blue(_ sender: UIButton){
        //SEND CHOICE TO MODEL FOR PLAYER INFO
        if(p1Set == false){
            let color = "blue"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer1(name: name, color: color)
            }
        }
        else{
            let color = "blue"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer2(name: name, color: color)
            }
        }
        if let lNavigationController = self.navigationController {
            let lSiblingViewControllers = lNavigationController.viewControllers
            lSiblingViewControllers[0].loadView()
        }
    }
    
    @IBAction func yellow(_ sender: UIButton){
        //SEND CHOICE TO MODEL FOR PLAYER INFO
        if(p1Set == false){
            let color = "yellow"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer1(name: name, color: color)
            }
        }
        else{
            let color = "yellow"
            if let name = self.nameTextField?.text{
                self.gameSession?.setPlayer2(name: name, color: color)
            }
        }
    }
    
    @IBAction func startGame(_ sender: UIButton){
        if let name = self.nameTextField?.text{
            self.gameSession?.setPlayer2(name: name, color: "yellow")
        }
        //CHANGE TO GAME MODE
        print("P2 INFO: \(self.gameSession!.p2Name) \(self.gameSession!.p2Color)\n")
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
            textfield.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.gameSession = self.appDelegate?.game
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
