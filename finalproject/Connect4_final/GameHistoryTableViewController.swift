/*
 CASSANDRA CHAPUT | CCHAPUT
 MICHAEL BUZIL | MBUZIL
 CONNECT-4
 4/28/2023
 */

import UIKit
import CoreData

class GameHistoryTableViewController: UITableViewController {

    var appDelegate: AppDelegate?
    var gameSession: Connect4Model?
    
    var i:Int = 1
    
    @IBOutlet weak var gameHistoryTable:UITableView!
    
    /*func getData(){
        let container = self.appDelegate!.persistentContainer
        let context = container.viewContext
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        //self.gameHistoryTable.reloadData()
        if let tempMyTableView = self.view as? UITableView {
            tempMyTableView.reloadData()
        }
        tableView.rowHeight = 101
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.gameSession = self.appDelegate?.game
        let container = self.appDelegate!.persistentContainer
        let context = container.viewContext
        let myGame:NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Game", into: context)
        for i in self.gameSession!.gameHistory{
            let result = i.value
            myGame.setValue(result[0], forKey: "winner")
            myGame.setValue(result[1], forKey: "loser")
            print("SESSION IS : \(myGame)")
            print("I is : \(i)")
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let numSect = self.gameSession?.numGames{
            return numSect
        }
        else{
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Gamecell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTableViewCell
        //self.getData()
        
        
        if let playerList = self.gameSession?.gameHistory[i]{
            print("WINNER: \(playerList[0]) LOSER: \(playerList[1])")
            Gamecell.winnerName.text = playerList[0]
            Gamecell.loserName.text = playerList[1]
            i=i+1
        }
        // Configure the cell...
        return Gamecell
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
