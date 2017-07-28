//
//  LegendView.swift
//  LegendView
//
//  Created by yeswanth varma on 7/26/17.
//  Copyright © 2017 DSNY. All rights reserved.
//

import UIKit

public class LegendObject {
    public  var name:String = ""
    public  var info:[infoObject]
    public init (name:String, info:[infoObject]){
        self.name = name
        self.info = info
    }
    
}

public class infoObject {
    public var img:UIImage
    public var title:String = ""
    public init (img:UIImage, title:String){
        self.img = img
        self.title = title
    }
}

public class YVLegendView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabelView: UITableView!
    
    @IBOutlet weak var legendButton: UIButton!
      let bundle = Bundle(for: YVLegendView.self)
    var view:UIView!
    
    public var OpenLegend: ((YVLegendView) -> Void)?
    public var CloseLegend: ((YVLegendView) -> Void)?
    
    public var LegendFeed:[LegendObject] = []
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    public func instanceFromNib() -> UIView {
      
        let xibView = UINib(nibName: "YVLegendView",
                            bundle: bundle).instantiate(withOwner: self,
                                                        options: nil)[0] as? UIView
        return xibView!//Bundle.main.loadNibNamed("YVLegendView", owner: self, options: nil)![0] as! UIView
    }
    public func xibSetup() {
        view = instanceFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        self.addGestureRecognizer(swipeRight)
        tabelView.backgroundColor = .clear
        tabelView.tableFooterView = UIView()
        let nib = UINib(nibName: "YVLegendCell", bundle: bundle)
        tabelView.register(nib, forCellReuseIdentifier: "YVLegendCell")
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func LegendButtonTapped(_ sender: Any) {
        OpenLegend?(self)
    }
    
    public func swiped(gesture: UISwipeGestureRecognizer){
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            CloseLegend?(self)
        default:
            NSLog("other swipe")
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return LegendFeed.count
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return LegendFeed[section].name
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor(white: 0, alpha: 0.8)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = .white
        
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LegendFeed[section].info.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YVLegendCell", for: indexPath) as! YVLegendCell
        let objs = LegendFeed[indexPath.section].info
        cell.backgroundColor = .clear
        cell.Configure(infoObject:objs[indexPath.row])
        return cell
    }
    
}

