//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import MapKit

Coordinates.CurrentLocation = Coordinates.ApplePark

let tabBarController = GLTabBarController()

PlaygroundPage.current.liveView = tabBarController

var coder = CLGeocoder()

coder.geocodeAddressString("No. 321 Zhishan Road Section 2 Shihlin District, Taipei City 111 Taiwan") { (placeMark, error) in
    print(placeMark ?? "")
}
