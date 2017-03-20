import UIKit

class AddPostScrollViewWrapperView: UIView
{
    var scrollView: UIScrollView!
    var contentView: AddPostCardHolder!
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        selfSetup()
        setupScrollView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selfSetup()
    {
        backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.5411764706, blue: 0.537254902, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupScrollView()
    {
        scrollView = UIScrollView(frame: CGRect.zero)
        scrollView.backgroundColor = UIColor.clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        addSubview(scrollView)
        
        var constraints = [
            NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        ]
        
        addConstraints(constraints)
        
        contentView = AddPostCardHolder()
        scrollView.addSubview(contentView)
        
        // May need to add constraints contentView->ScrollView
        constraints = [
            NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .left, relatedBy: .equal, toItem: scrollView, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .right, relatedBy: .equal, toItem: scrollView, attribute: .right, multiplier: 1.0, constant: 0)
        ]
        
        addConstraints(constraints)
        
        constraints = [
            NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        ]
        
        addConstraints(constraints)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        print(contentView)
    }
}
