import UIKit

class AlertViewController: UIViewController
{
    struct Style
    {
        static let cardHeight: CGFloat = 350
        static let sidePadding: CGFloat = 10
    }
    
    var alertCard: AlertCard!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.8)
        
        setupAlertCard()
        setupAlertMessage()
    }
    
    func setupAlertMessage()
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Did this just happen?"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = UIColor.white
        label.sizeToFit()
        view.addSubview(label)
        
        let constraints = [
            NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: alertCard, attribute: .top, multiplier: 1.0, constant: -20),
        ]
        
        view.addConstraints(constraints)
    }
    
    func setupAlertCard()
    {
        alertCard = AlertCard(with: DummyData.existingPosts[0])
        view.addSubview(alertCard)
        
        let constraints = [
            NSLayoutConstraint(item: alertCard, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: -2*Style.sidePadding),
            NSLayoutConstraint(item: alertCard, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: alertCard, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0),
        ]
        
        view.addConstraints(constraints)
    }
}
