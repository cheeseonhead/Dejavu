import UIKit

class AddPostViewController: UIViewController
{
    var groupView = BrownView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = "Add Post"
        view.backgroundColor = UIColor.cyan
        
        print(navigationItem)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        
        view.addSubview(groupView)
        
        let constraints = [
            NSLayoutConstraint(item: groupView, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: groupView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: -10),
            NSLayoutConstraint(item: groupView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: groupView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -10),
        ]
        
        view.addConstraints(constraints)
    }
    
    func cancelButtonPressed()
    {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
