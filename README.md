*Cassandra Chaput*

*Indiana University*

*CSCI-C323 | iOS App Development*

*Spring 2023*

# CONNECT-4 iOS APP

## SUMMARY:

### MVC ARCHITECTURAL PATTERN
- MODEL: Connect4Model.swift 
    - saves the game number of games and the winner and loser from that game
    - saves the player1's name
    - saves the player2's name
    - clears the player's names for new player's button 
- CONTROLLER: GameTableViewController.swift, playerInfoViewController, etc.
    - all of these controllers manage views in the storyboard
    - allows user interaction (like textfields) to store into the model (ex: player1 & player2's names) 
- VIEW: GameBoardView.swift, main storyboard
    - the GameBoardView was a UIView that we used to draw the connect-4 board
    - the main storyboard is the view the user will see and it is controlled by the viewControllers

### USER INTERFACE 
- INPUT: 
    - GameBoardView.swift contains the code to interpret touch 
    - playerInfoViewController.swift contains code for UITextfields and UIButtons 
- OUTPUT:
    - GameBoardView.swift contains the code to draw CoreGraphics to make the connect-4 board & allows the device to recieve haptics 
- VIEWS:
    - tableView with a table view controller to display game history
    - UIView for connect-4 drawing
    - tabView containing tableView and GameOverView
    - Connect 4 was never done in class!
    - core data used to make game history ppersistent & appear in the table view

### FRAMEWORKS
- CoreData to save game results
- CoreGraphics to draw the game board
- CoreHaptics used to notify that someone connected 4

