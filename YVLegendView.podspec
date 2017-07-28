#
# Be sure to run `pod lib lint YVLegendView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YVLegendView'
  s.version          = '0.1.1'
  s.summary          = 'A simple Legend View which slides in to show categorize and group layers in the map into sections.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = '### Installing
Just Clone or download this repo to your desktop
drag and drop **YVLegendView** Folder to your Project, thats it you are ready to use it in your view.

### Prerequisites
Written in **Swift 3**
supports from iOS 9 and above
Xcode 8 and above

## Getting Started

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
Thats it its done you can reuse this View in multiple maps with custom layers and fell free to customize the files according to your need'

  s.homepage         = 'https://github.com/kanumuri9593/YVLegendView'
#s.screenshots     = 'https://github.com/kanumuri9593/YVLegendView/blob/master/Images/1.png', 'https://github.com/kanumuri9593/YVLegendView/blob/master/Images/2.png','https://github.com/kanumuri9593/YVLegendView/blob/master/Images/3.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yeswanth Varma Kanumuri' => 'yeshuRAJ.9593@gmail.com' }
  s.source           = { :git => 'https://github.com/kanumuri9593/YVLegendView.git' , :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YVLegendView/Classes/**/*'
  
   s.resource_bundles = {
    'YVLegendView' => ['YVLegendView/**/*.{xib,png}']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
