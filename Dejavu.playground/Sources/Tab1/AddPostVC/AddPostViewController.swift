import UIKit

class AddPostViewController: UIViewController
{
    var scrollView: CardScrollViewWrapperView!
    var cardView = AddPostCardView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = "Add Post"
        view.backgroundColor = UIColor.cyan
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
        
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
    
    func cancelButtonPressed()
    {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func saveButtonPressed()
    {
        let post = cardView.generatePost()
        DummyData.existingPosts.append(post)
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
