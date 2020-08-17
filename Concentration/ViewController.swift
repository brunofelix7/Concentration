import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsCards: (cardButtons.count + 1) / 2)
    
    //  MARK: Conta os flips dos cards
    var flipCount = 0 {
        //  MARK: Executa a cada alteração de valor
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //  MARK: Outlets
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    //  MARK: Ação do card
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        //  MARK: Identifica qual botão foi tocado
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃","🕷","🐶","🧑🏻‍💻","👿","🍎","😎"]
    
    var emojis = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emojis[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojis[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojis[card.identifier] ?? "?"
    }
    
}
