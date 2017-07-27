//
//  LegendView.swift
//  LegendView
//
//  Created by yeswanth varma on 7/26/17.
//  Copyright © 2017 DSNY. All rights reserved.
//

import UIKit

struct LegendObject {
    var name:String
    var info:[infoObject]
    
}

struct infoObject {
    var img:UIImage
    var title:String
}

@IBDesignable class YVLegendView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabelView: UITableView!
    
    @IBOutlet weak var legendButton: UIButton!
   
    var view:UIView!
    
    var OpenLegend: ((YVLegendView) -> Void)?
    var CloseLegend: ((YVLegendView) -> Void)?
    
    var LegendFeed:[LegendObject] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
    
   
    func instanceFromNib() -> UIView {
        return Bundle.main.loadNibNamed("YVLegendView", owner: self, options: nil)![0] as! UIView
    }
    func xibSetup() {
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
        let nib = UINib(nibName: "YVLegendCell", bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: "YVLegendCell")
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
        xibSetup()
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func LegendButtonTapped(_ sender: Any) {
        OpenLegend?(self)
    }
    
    func swiped(gesture: UISwipeGestureRecognizer){
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            CloseLegend?(self)
        default:
            NSLog("other swipe")
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return LegendFeed.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return LegendFeed[section].name
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor(white: 0, alpha: 0.8)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = .white
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LegendFeed[section].info.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YVLegendCell", for: indexPath) as! YVLegendCell
          let objs = LegendFeed[indexPath.section].info
        cell.backgroundColor = .clear
        cell.Configure(infoObject:objs[indexPath.row])
        return cell
    }
    
}

