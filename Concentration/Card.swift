import Foundation

//  MARK: Structs nao herdam
//  MARK: Structs são tipos, são copiados
struct Card {
    
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
