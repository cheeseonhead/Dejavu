//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import MapKit

Coordinates.CurrentLocation = Coordinates.Studio65

let tabBarController = GLTabBarController()

PlaygroundPage.current.liveView = tabBarController

var coder = CLGeocoder()

coder.geocodeAddressString("Infinite Loop 2") { (placeMark, error) in
    print(placeMark ?? "")
}
