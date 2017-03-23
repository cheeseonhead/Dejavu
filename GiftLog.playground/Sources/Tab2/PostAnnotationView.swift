import UIKit
import MapKit

class PostAnnotationView: MKPinAnnotationView
{
    var imageView = RoundImageView()
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?)
    {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        canShowCallout = true
        
        setupImageView()
        
    }
    
    func setupImageView()
    {
        leftCalloutAccessoryView = imageView
        
        imageView.set(position: CGPoint(x: 0, y: 0), edgeLength: 46)
        imageView.backgroundColor = UIColor.brown
    }
}
