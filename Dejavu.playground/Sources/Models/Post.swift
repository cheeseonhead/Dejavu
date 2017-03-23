import UIKit
import MapKit

struct Post
{
    static let dateFormatter = { () -> DateFormatter in
        var temp = DateFormatter()
        temp.dateFormat = "yyyy-MM-dd HH:mm"
        return temp
    }()
    
    var title: String
    var description: String
    var date: Date
    var image: UIImage?
    var location: CLLocationCoordinate2D
}
