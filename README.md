# YVLegendView

[![CI Status](http://img.shields.io/travis/kanumuri9593/YVLegendView.svg?style=flat)](https://travis-ci.org/kanumuri9593/YVLegendView)
[![Version](https://img.shields.io/cocoapods/v/YVLegendView.svg?style=flat)](http://cocoapods.org/pods/YVLegendView)
[![License](https://img.shields.io/cocoapods/l/YVLegendView.svg?style=flat)](http://cocoapods.org/pods/YVLegendView)
[![Platform](https://img.shields.io/cocoapods/p/YVLegendView.svg?style=flat)](http://cocoapods.org/pods/YVLegendView)

A simple Legend View to categorize and group layers in the map into sections.

Build using Simple callback Api's and custom nib's easy to understand and customize to your requirements.

<img src="https://github.com/kanumuri9593/YVLegendView/blob/master/Images/1.png" width="340px">


<img src="https://github.com/kanumuri9593/YVLegendView/blob/master/Images/2.png" width="340px">


<img src="https://github.com/kanumuri9593/YVLegendView/blob/master/Images/3.png" width="340px">

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

#### Using [CocoaPods](http://cocoapods.org/)

Add `pod 'YVLegendView'` to your `Podfile` and run `pod install`. Also add `use_frameworks!` to the `Podfile`.

```
use_frameworks!
pod 'YVLegendView'
```
#### Manual

Just Clone or download this repo to your desktop
drag and drop **YVLegendView** Folder to your Project, that's it you are ready to use it in your view.

### Support
Written in **Swift 3**
supports from iOS 9 and above
Xcode 8 and above

## Usage

`import YVLegendView` to your ViewController

then follow these three steps:

First simply Initiate a array of Objects (Layer info with icons)

LegendObject is an object which expects a title to display as section header title and a array of layers categorized under it of type infoObject which takes a img and name as parameters
```swift
let MultipleLegendFeed:[LegendObject] = [
LegendObject(name: "Traffic Camera", info: [
infoObject(img: UIImage(named: "map_camera_on"), title: "Camera - On"),
infoObject(img:UIImage(named: "map_camera_off"), title: "Camera - On")
]),
LegendObject(name: "Roadway Weather", info: [
infoObject(img: UIImage(named: "icon_weather_dry"), title: "Dry"),
infoObject(img: UIImage(named: "icon_weather_wet"), title: "Wet"),
infoObject(img: UIImage(named: "icon_weather_ice_watch"), title: "Ice Watch"),
infoObject(img: UIImage(named:"map_weather_sun"), title: "Sun"),
infoObject(img: UIImage(named: "icon_weather_unknown"), title: "Unkonwon")
]),
LegendObject(name: "Water Level", info: [
infoObject(img: UIImage(named: "flooding"), title: "Flooding Occuring"),
infoObject(img: UIImage(named: "flooding-nodata"), title: "No Dota Available")
])
]
```
Add the following method to your ViewController
The frame of the legend View is customizable according to your requirements including the animation you want the view to appear
```swift
internal func AddLegendView(LegendInfoFeed:[LegendObject]){
let  legendView = YVLegendView()
legendView.removeFromSuperview()
legendView.LegendFeed = LegendInfoFeed
legendView.frame = CGRect(x:UIScreen.main.bounds.width - 20.5 , y: 70, width: 219, height:300)
legendView.OpenLegend = { (legendView) in
UIView.animate(withDuration: 1.0, animations: {
legendView.frame = CGRect(x:UIScreen.main.bounds.width - 216 , y: 70, width: 219, height:300)
})
}
legendView.CloseLegend = { (legendView) in
UIView.animate(withDuration: 1.0, animations: {
legendView.frame = CGRect(x:UIScreen.main.bounds.width - 20.5 , y: 70, width: 219, height:300)
})
}
view.addSubview(legendView)
}
```

the call this method in ViewDidLoad

```swift
AddLegendView(LegendInfoFeed:MultipleLegendFeed)
```
It's done you can reuse this View in multiple maps with custom layers and fell free to customize the files according to your need

## Author

**Yeswanth Varma Kanumuri** - [kanumuri9593](https://github.com/kanumuri9593)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

