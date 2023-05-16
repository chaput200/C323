/*
 CASSANDRA CHAPUT | CCHAPUT
 MICHAEL BUZIL | MBUZIL
 CONNECT-4
 4/28/2023
 */

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var winnerLabel:UILabel!
    @IBOutlet weak var loserLabel:UILabel!
    
    @IBOutlet weak var winnerName:UILabel!
    @IBOutlet weak var loserName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
