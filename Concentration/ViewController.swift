import UIKit

class ViewController: UIViewController {
    
    //  MARK: Conta os flips dos cards
    var flipCount = 0 {
        //  MARK: Executa a cada alteração de valor
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //  MARK: Array de emojis
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    //  MARK: Outlets
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    //  MARK: Ação do card
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        //  MARK: Identifica qual botão foi tocado
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }
    
    //  MARK: Ação para virar o card
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}
