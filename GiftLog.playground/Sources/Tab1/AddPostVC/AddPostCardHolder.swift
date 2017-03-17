import UIKit

class AddPostCardHolder: UIView
{
    let verticalPadding: CGFloat = 20
    let sidePadding: CGFloat = 10
    
    var cardView = AddPostCardView()
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        
        setupCard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCard()
    {
        addSubview(cardView)
        
        let constraints = [
            NSLayoutConstraint(item: cardView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: verticalPadding),
            NSLayoutConstraint(item: cardView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -verticalPadding),
            NSLayoutConstraint(item: cardView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: sidePadding),
            NSLayoutConstraint(item: cardView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -sidePadding)
        ]
        
        addConstraints(constraints)
    }
}
