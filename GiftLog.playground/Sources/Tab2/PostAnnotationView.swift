import UIKit
import MapKit

class PostAnnotationView: MKAnnotationView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?)
    {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.blue
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        print(self)
    }
}
