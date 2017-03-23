//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import MapKit

Coordinates.CurrentLocation = Coordinates.ApplePark

let tabBarController = GLTabBarController()

PlaygroundPage.current.liveView = tabBarController

var coder = CLGeocoder()

coder.geocodeAddressString("Apple Inc. 2 Infinite Loop Cupertino, CA 95014-2083 United States") { (placeMark, error) in
    print(placeMark ?? "")
}
