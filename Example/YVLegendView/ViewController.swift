//
//  ViewController.swift
//  YVLegendView
//
//  Created by kanumuri9593 on 07/28/2017.
//  Copyright (c) 2017 kanumuri9593. All rights reserved.
//

import UIKit
import YVLegendView
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let MultipleLegendFeed:[LegendObject] = [
        LegendObject(name: "Traffic Camera", info: [
            infoObject(img: #imageLiteral(resourceName: "map_camera_on"), title: "Camera - On"),
            infoObject(img: #imageLiteral(resourceName: "map_camera_off"), title: "Camera - On")
            ]),
        LegendObject(name: "Roadway Weather", info: [
            infoObject(img: #imageLiteral(resourceName: "icon_weather_dry"), title: "Dry"),
            infoObject(img: #imageLiteral(resourceName: "icon_weather_wet"), title: "Wet"),
            infoObject(img: #imageLiteral(resourceName: "icon_weather_ice_watch"), title: "Ice Watch"),
            infoObject(img: #imageLiteral(resourceName: "map_weather_sun"), title: "Sun"),
            infoObject(img: #imageLiteral(resourceName: "icon_weather_unknown"), title: "Unkonwon")
            ]),
        LegendObject(name: "Water Level", info: [
            infoObject(img: #imageLiteral(resourceName: "flooding"), title: "Flooding Occuring"),
            infoObject(img: #imageLiteral(resourceName: "flooding-nodata"), title: "No Dota Available")
            ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       AddLegendView(LegendInfoFeed:MultipleLegendFeed)
    }

    
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

}

