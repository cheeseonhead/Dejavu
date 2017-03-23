import UIKit

class ViewPostCardView: CardView
{
    var post: Post
    
    var contentView: ViewPostCardContentView!
    
    required init(with post: Post) {
        self.post = post
        super.init()
        
        setupContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    func setupContentView()
    {
        contentView = ViewPostCardContentView(with: post)
        addSubview(contentView)
        
        let constraints = [
            NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
        ]
        
        addConstraints(constraints)
    }
}
