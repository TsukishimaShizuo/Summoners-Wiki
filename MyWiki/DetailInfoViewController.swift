//
//  DetailInfoViewController.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/12.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit
import CoreData

class DetailInfoViewController: UIViewController {
    
    var initialized : Bool = false
    
    var pictureView : UIImageView!
    var nameView : UILabel!
    var starView : UILabel!
    var propertyView : UILabel!
    var typeView : UILabel!
    var staminaView : UILabel!
    var attackView : UILabel!
    var defenseView : UILabel!
    var speedView : UILabel!
    var skillView1 : UILabel!
    
    var basicPropterLabel : UILabel!
    var staminaLabel : UILabel!
    var attackLabel : UILabel!
    var defenseLabel : UILabel!
    var speedLabel : UILabel!
    var skillSummaryLabel : UILabel!
    var skillLabel1 : UILabel!
    var skillLabel2 : UILabel!
    var skillLabel3 : UILabel!
    var skillLabel4 : UILabel!
    
    var id : Int = 0
    var name : String = ""
    var star : Int = 0
    var property : EireiProperty = EireiProperty.Unknown
    var type : EireiType = EireiType.Unknown
    var stamina : Int = 0
    var attack : Int = 0
    var defence : Int = 0
    var speed : Int = 0
    var skill1 : EireiSkill = EireiSkill()
    var skill2 : EireiSkill = EireiSkill()
    var skill3 : EireiSkill = EireiSkill()
    var skill4 : EireiSkill = EireiSkill()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (!initialized) {
            addToView()
        }
        layoutView()
        
        // Do any additional setup after loading the view.
    }
    
    func loadContent() {
        print("clicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func addToView() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        pictureView = UIImageView(frame: CGRectZero)
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        nameView = UILabel(frame: CGRectZero)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        starView = UILabel(frame: CGRectZero)
        starView.translatesAutoresizingMaskIntoConstraints = false
        propertyView = UILabel(frame: CGRectZero)
        propertyView.translatesAutoresizingMaskIntoConstraints = false
        typeView = UILabel(frame: CGRectZero)
        typeView.translatesAutoresizingMaskIntoConstraints = false
        staminaView = UILabel(frame: CGRectZero)
        staminaView.translatesAutoresizingMaskIntoConstraints = false
        attackView = UILabel(frame: CGRectZero)
        attackView.translatesAutoresizingMaskIntoConstraints = false
        defenseView = UILabel(frame: CGRectZero)
        defenseView.translatesAutoresizingMaskIntoConstraints = false
        speedView = UILabel(frame: CGRectZero)
        speedView.translatesAutoresizingMaskIntoConstraints = false
        skillView1 = UILabel(frame: CGRectZero)
        skillView1.translatesAutoresizingMaskIntoConstraints = false
        
        basicPropterLabel = UILabel(frame: CGRectZero)
        basicPropterLabel.translatesAutoresizingMaskIntoConstraints = false
        basicPropterLabel.backgroundColor = UIColor.clearColor()
        basicPropterLabel.text = "基本属性（Max Lv.）"
        basicPropterLabel.textAlignment = NSTextAlignment.Center
        staminaLabel = UILabel(frame: CGRectZero)
        staminaLabel.translatesAutoresizingMaskIntoConstraints = false
        staminaLabel.backgroundColor = UIColor.clearColor()
        staminaLabel.text = "体力"
        staminaLabel.textAlignment = NSTextAlignment.Center
        attackLabel = UILabel(frame: CGRectZero)
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        attackLabel.backgroundColor = UIColor.clearColor()
        attackLabel.text = "攻撃力"
        attackLabel.textAlignment = NSTextAlignment.Center
        defenseLabel = UILabel(frame: CGRectZero)
        defenseLabel.translatesAutoresizingMaskIntoConstraints = false
        defenseLabel.backgroundColor = UIColor.clearColor()
        defenseLabel.text = "防衛力"
        defenseLabel.textAlignment = NSTextAlignment.Center
        speedLabel = UILabel(frame: CGRectZero)
        speedLabel.translatesAutoresizingMaskIntoConstraints = false
        speedLabel.backgroundColor = UIColor.clearColor()
        speedLabel.text = "スピード"
        speedLabel.textAlignment = NSTextAlignment.Center
        
        skillSummaryLabel = UILabel(frame: CGRectZero)
        skillSummaryLabel.translatesAutoresizingMaskIntoConstraints = false
        skillSummaryLabel.backgroundColor = UIColor.clearColor()
        skillSummaryLabel.text = "スキル"
        skillSummaryLabel.textAlignment = NSTextAlignment.Center
        skillLabel1 = UILabel(frame: CGRectZero)
        skillLabel1.translatesAutoresizingMaskIntoConstraints = false
        skillLabel1.backgroundColor = UIColor.clearColor()
        skillLabel1.text = skill1.name
        skillLabel1.textAlignment = NSTextAlignment.Center
        skillLabel1.adjustsFontSizeToFitWidth = true
        skillLabel1.numberOfLines = 0
        skillLabel2 = UILabel(frame: CGRectZero)
        skillLabel2.translatesAutoresizingMaskIntoConstraints = false
        skillLabel2.backgroundColor = UIColor.clearColor()
        skillLabel2.text = skill2.name
        skillLabel2.textAlignment = NSTextAlignment.Center
        skillLabel2.adjustsFontSizeToFitWidth = true
        skillLabel2.numberOfLines = 0
        skillLabel3 = UILabel(frame: CGRectZero)
        skillLabel3.translatesAutoresizingMaskIntoConstraints = false
        skillLabel3.backgroundColor = UIColor.clearColor()
        skillLabel3.text = skill3.name
        skillLabel3.textAlignment = NSTextAlignment.Center
        skillLabel3.adjustsFontSizeToFitWidth = true
        skillLabel3.numberOfLines = 0
        skillLabel4 = UILabel(frame: CGRectZero)
        skillLabel4.translatesAutoresizingMaskIntoConstraints = false
        skillLabel4.backgroundColor = UIColor.clearColor()
        skillLabel4.text = skill4.name
        skillLabel4.textAlignment = NSTextAlignment.Center
        skillLabel4.adjustsFontSizeToFitWidth = true
        skillLabel4.numberOfLines = 0
        
        pictureView.backgroundColor = UIColor.clearColor()
        let aImage  = UIImage(named: "monster_" + String(id) + ".png")
        pictureView.contentMode = UIViewContentMode.ScaleAspectFit
        pictureView.image = aImage
        
        nameView.backgroundColor = UIColor.clearColor()
        nameView.text = name
        nameView.textAlignment = NSTextAlignment.Center
        
        starView.backgroundColor = UIColor.clearColor()
        starView.text = String(star)
        starView.textAlignment = NSTextAlignment.Center
        
        propertyView.backgroundColor = UIColor.clearColor()
        propertyView.text = property.getDescription()
        propertyView.textAlignment = NSTextAlignment.Center
        
        typeView.backgroundColor = UIColor.clearColor()
        typeView.text = type.getDescription()
        typeView.textAlignment = NSTextAlignment.Center
        
        staminaView.backgroundColor = UIColor.clearColor()
        staminaView.text = String(stamina)
        
        attackView.backgroundColor = UIColor.clearColor()
        attackView.text = String(attack)
        
        defenseView.backgroundColor = UIColor.clearColor()
        defenseView.text = String(defence)
        
        speedView.backgroundColor = UIColor.clearColor()
        speedView.text = String(speed)
        
        skillView1.backgroundColor = UIColor.clearColor()
        skillView1.text = skill1.description
        skillView1.numberOfLines = 0
        skillView1.adjustsFontSizeToFitWidth = true
        
        view.addSubview(pictureView)
        view.addSubview(nameView)
        view.addSubview(starView)
        view.addSubview(propertyView)
        view.addSubview(typeView)
        
        view.addSubview(basicPropterLabel)
        view.addSubview(staminaLabel)
        view.addSubview(attackLabel)
        view.addSubview(defenseLabel)
        view.addSubview(speedLabel)
        view.addSubview(skillSummaryLabel)
        view.addSubview(skillLabel1)
        view.addSubview(skillLabel2)
        view.addSubview(skillLabel3)
        view.addSubview(skillLabel4)
        
        view.addSubview(staminaView)
        view.addSubview(attackView)
        view.addSubview(defenseView)
        view.addSubview(speedView)
        view.addSubview(skillView1)
        
        initialized = true
    }
    
    func layoutView() {
        for aConstraint in view.constraints {
            view.removeConstraint(aConstraint)
        }
        
        view.addConstraint(NSLayoutConstraint(item: pictureView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.4, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: pictureView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.4, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: pictureView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: topLayoutGuide, attribute: NSLayoutAttribute.Bottom , multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: pictureView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: nameView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.6, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: nameView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.1, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: nameView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: nameView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.6, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.1, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: nameView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: propertyView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.6, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: propertyView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.1, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: propertyView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: starView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: propertyView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: typeView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.6, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: typeView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.1, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: typeView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: propertyView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: typeView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: basicPropterLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: basicPropterLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: pictureView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: basicPropterLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: staminaLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: staminaLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Height, multiplier: 0.5, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: staminaLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: staminaLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: staminaView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: staminaView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: staminaView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: staminaView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel,
            attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: attackLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: attackLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: attackLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: attackLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: staminaView,
            attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: attackView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: attackView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: attackView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: attackView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: attackLabel,
            attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: defenseLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: defenseLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Height, multiplier: 0.5, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: defenseLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: defenseLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: defenseView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: defenseView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: defenseLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: defenseView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: defenseView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: defenseLabel,
            attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: speedLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: speedLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: defenseLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: speedLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: speedLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: defenseView,
            attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: speedView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: speedView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: defenseLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: speedView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: staminaLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: speedView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: speedLabel,
            attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: skillSummaryLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillSummaryLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillSummaryLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: defenseLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillSummaryLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: skillLabel1, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.3, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel1, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel1, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: skillSummaryLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel1, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: skillView1, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.7, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillView1, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: skillLabel1, attribute: NSLayoutAttribute.Height, multiplier: 4.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillView1, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: skillSummaryLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillView1, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: skillLabel1,
            attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: skillLabel2, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.3, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel2, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel2, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: skillLabel1, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel2, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: skillLabel3, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.3, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel3, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel3, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: skillLabel2, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel3, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: skillLabel4, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.3, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel4, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: basicPropterLabel, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel4, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: skillLabel3, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel4, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: skillLabel4, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view,
            attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
        
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if (id == 481) {
            let dbgv = TableViewController()
            navigationController?.pushViewController(dbgv, animated: true)
            print("shaking")
        }
    }

}
