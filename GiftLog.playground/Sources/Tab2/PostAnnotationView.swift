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
        
        leftCalloutAccessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        leftCalloutAccessoryView?.backgroundColor = UIColor.brown
        
        print(self)
    }
}
