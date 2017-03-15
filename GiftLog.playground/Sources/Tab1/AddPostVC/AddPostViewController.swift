import UIKit

class AddPostViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = "Add Post"
        view.backgroundColor = UIColor.cyan
        
        print(navigationItem)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
    }
    
    func cancelButtonPressed()
    {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
