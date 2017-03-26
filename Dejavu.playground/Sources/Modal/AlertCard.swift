import UIKit

class AlertCard: CardView
{
    required init()
    {
        super.init()
        
        
        setupSelf()
    }
    
    func setupSelf()
    {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
