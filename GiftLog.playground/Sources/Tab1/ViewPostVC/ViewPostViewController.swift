import UIKit

class ViewPostViewController: UIViewController
{
    var scrollView: CardScrollViewWrapperView!
    var cardView: ViewPostCardView = ViewPostCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Post"
        view.backgroundColor = UIColor.brown
        
        scrollView = CardScrollViewWrapperView(cardView: cardView)
        
        view.addSubview(scrollView)
        
        let constraints = [
            NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0)
        ]
        
        view.addConstraints(constraints)
    }
}
