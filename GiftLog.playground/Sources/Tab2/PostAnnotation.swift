import UIKit
import MapKit

class PostAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var thumbNail: UIImage?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, thumbNail: UIImage)
    {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.thumbNail = thumbNail
    }
}
