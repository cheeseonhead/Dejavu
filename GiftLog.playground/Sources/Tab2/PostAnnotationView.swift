import UIKit
import MapKit

class PostAnnotationView: MKPinAnnotationView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?)
    {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        let image = RoundImageView()
        leftCalloutAccessoryView = image
        
        image.set(position: CGPoint(x: 0, y: 0), edgeLength: 100)
        image.backgroundColor = UIColor.brown
        
        print(self)
    }
}
