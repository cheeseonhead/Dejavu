import UIKit


class AddPostCardView: UIView
{
    struct Style
    {
        static let cornerRadius: CGFloat = 10
    }
    
    var label = UILabel()
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSelf()
    {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.cornerRadius = Style.cornerRadius
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
    }
    
    
    func setupLabel()
    {
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sollicitudin justo eros, ac pretium odio imperdiet sed. In eu quam at purus faucibus mollis. Vestibulum a placerat odio. Nunc condimentum vel erat vitae finibus. Curabitur tincidunt lobortis nibh nec viverra. Ut ultricies consequat iaculis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mattis tortor a tincidunt vulputate. Vivamus in dolor est. Maecenas purus justo, viverra sed quam sit amet, consectetur porttitor ligula. Ut vitae ligula sagittis turpis hendrerit malesuada." +
            
            "Quisque convallis nunc velit, et tempor leo imperdiet id. Fusce vehicula lobortis quam ac rutrum. Nunc egestas, ex quis ultrices varius, nibh orci tincidunt metus, at tristique nisl magna at quam. In blandit scelerisque fermentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean lacinia lectus vitae elit aliquet rhoncus. Quisque erat est, lacinia sit amet lorem at, consectetur posuere eros. Praesent nibh metus, pharetra ac nunc quis, suscipit vestibulum eros. Sed mollis rhoncus vestibulum. Fusce pulvinar eget odio ac lobortis. Sed facilisis, diam eu tristique dictum, ligula nisi bibendum metus, et convallis tortor diam a nunc. Maecenas consectetur sapien ut arcu consectetur, sit amet sollicitudin nulla hendrerit. Nam consequat aliquam pharetra. Donec vitae iaculis sem. Sed a mattis mi." +
            
            "Quisque in elit ipsum. Praesent pretium pharetra consectetur. Fusce rutrum hendrerit leo. Donec risus erat, volutpat finibus ligula at, dapibus dapibus leo. Vestibulum aliquet rutrum mi tincidunt maximus. Cras leo erat, sollicitudin in ultrices nec, commodo dapibus lacus. Donec quis quam dui. Aenean pulvinar felis sem, in cursus magna tincidunt ut. Aliquam posuere iaculis erat quis tincidunt. Quisque eget lectus aliquet ex placerat hendrerit. Donec a elementum velit. Nunc feugiat urna vel ipsum lacinia, nec porttitor nibh pulvinar. Donec faucibus tincidunt dolor, sed cursus lectus lacinia nec. Sed non metus lacus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus." +
            
            "Vivamus justo tortor, gravida id consequat sit amet, egestas sed est. Duis facilisis arcu et felis faucibus consequat. Quisque posuere neque nec ipsum bibendum laoreet. Morbi sagittis vehicula ex vel tincidunt. Nunc luctus felis vitae elementum vulputate. Praesent maximus ipsum volutpat sollicitudin porta. Etiam nunc sem, sollicitudin ac diam sed, venenatis tincidunt mauris. In molestie dapibus eros, vel mattis sapien feugiat posuere." +
            
        "Suspendisse potenti. Etiam egestas egestas eros, a pulvinar justo lacinia eget. Sed nec libero dui. Nam euismod ullamcorper auctor. Nullam eget purus vitae lectus auctor molestie eu nec libero. Quisque odio enim, facilisis porttitor nunc ut, auctor posuere neque. Ut vel hendrerit lectus, consequat congue massa. Phasellus nulla ex, facilisis ac euismod sed, egestas nec dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque luctus iaculis felis sit amet congue. Vivamus ac aliquam felis, sed imperdiet ipsum. Donec sed molestie est."
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        addSubview(label)
        
        let constraints = [
            NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -10),
            NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -10),
            ]
        
        addConstraints(constraints)
    }

}
