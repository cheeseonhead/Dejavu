import UIKit
import MapKit

protocol PostAnnotationViewDelegate: class
{
    func detailButtonTapped(view: PostAnnotationView)
}

class PostAnnotationView: MKPinAnnotationView
{
    var imageView = RoundImageView()
    var detailButton = DetailButton()
    
    weak var delegate: PostAnnotationViewDelegate?
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?)
    {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        setupImageView()
        setupButton()
    }
    
    func setupImageView()
    {
        leftCalloutAccessoryView = imageView
        
        imageView.set(position: CGPoint(x: 0, y: 0), edgeLength: 46)
        imageView.backgroundColor = UIColor.brown
    }
    
    func setupButton()
    {
        rightCalloutAccessoryView = detailButton
        
        detailButton.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        detailButton.addTarget(self, action: #selector(detailButtonTapped), for: .touchUpInside)
    }
    
    func detailButtonTapped()
    {
        delegate?.detailButtonTapped(view: self)
    }
}

class DetailButton: UIButton
{
    override var isHighlighted: Bool {
        didSet {
            if(isHighlighted) {
                imageView?.tintColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
            }
            else {
                imageView?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        let image = UIImage(named: ImageName.rightInCircle.rawValue)?.withRenderingMode(.alwaysTemplate)
        imageView?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setImage(image, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
