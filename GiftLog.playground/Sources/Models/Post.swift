import UIKit
import MapKit

struct Post
{
    static let dateFormatter = { () -> DateFormatter in
        var temp = DateFormatter()
        temp.dateFormat = "MM-dd-yyyy HH:mm"
        return temp
    }()
    
    var title: String
    var description: String
    var date: Date
    var image: UIImage?
    var location: CLLocationCoordinate2D
}
