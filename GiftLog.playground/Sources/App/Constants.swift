import Foundation
import MapKit

enum Padding: CGFloat
{
    typealias RawValue = CGFloat

    case edgePadding = 8
}

enum TitleConstant: String
{
    case mapVC = "Map"
    case postListVC = "Dejavu"
}

enum ImageName: String
{
    case marker = "Marker.png"
    case savingBook = "SavingBook.png"
    case winter = "winter-solstice.jpg"
    case dog = "dog.jpg"
    case camera = "camera.png"
    case placeHolder = "placeholder.png"
}

struct Coordinates
{
    static let ApplePark = CLLocationCoordinate2D(latitude: 37.331863, longitude: -122.029524)
    static let InfiniteLoop1 = CLLocationCoordinate2D(latitude: 37.331413, longitude: -122.030484)
    static let InfiniteLoop2 = CLLocationCoordinate2D(latitude: 37.33270825, longitude: -122.03030010)
    static let InfiniteLoop3 = CLLocationCoordinate2D(latitude: 37.33311010, longitude: -122.02941910)
}

struct DummyData
{
    static var existingPosts = [
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.winter.rawValue), location: Coordinates.InfiniteLoop1),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.dog.rawValue), location: Coordinates.InfiniteLoop2),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.winter.rawValue), location: Coordinates.InfiniteLoop3),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.winter.rawValue), location: Coordinates.InfiniteLoop1),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.winter.rawValue), location: Coordinates.InfiniteLoop1)
    ]
}
