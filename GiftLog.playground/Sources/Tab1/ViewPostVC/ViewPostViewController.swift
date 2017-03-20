import UIKit

class ViewPostViewController: UIViewController
{
    var scrollView: CardScrollViewWrapperView!
    var cardView: ViewPostCardView = ViewPostCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Post"
        view.backgroundColor = UIColor.brown
        
        scrollView.frame = view.bounds
        scrollView.backgroundColor = UIColor.black
        view.addSubview(scrollView)
    }
}
