import Foundation
import MapKit

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
}

struct Coordinates
{
    static let ApplePark = CLLocationCoordinate2D(latitude: 37.331863, longitude: -122.029524)
    static let InfiniteLoop1 = CLLocationCoordinate2D(latitude: 37.331413, longitude: -122.030484)
}

struct DummyData
{
    static let existingPosts = [
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.", image: nil, location: Coordinates.InfiniteLoop1)
    ]
}
