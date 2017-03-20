import UIKit

class ViewPostCardView: CardView
{
    var blurImage = UIImageView()
    
    required init() {
        super.init()
        
        setupSelf()
        setupBlurImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSelf()
    {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
