import UIKit
import MapKit

class PostAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D {
        get {
            return post.location
        }
    }
    var title: String? {
        get {
            return post.title
        }
    }
    var subtitle: String? {
        get {
            return post.description
        }
    }
    var thumbNail: UIImage? {
        get {
            return post.image
        }
    }
    
    var post: Post
    
    init(post: Post)
    {
        self.post = post
    }
}
