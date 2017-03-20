import UIKit

class ViewPostCardView: CardView
{
    required init() {
        super.init()
        
        backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.7529411765, blue: 0.5725490196, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
