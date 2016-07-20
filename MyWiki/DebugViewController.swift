//
//  DebugViewController.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/16.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit
import CoreData

class DebugViewController: UIViewController {

    @IBOutlet var id: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var star: UITextField!
    @IBOutlet var property: UITextField!
    @IBOutlet var type: UITextField!
    @IBOutlet var defence: UITextField!
    @IBOutlet var attack: UITextField!
    @IBOutlet var stamina: UITextField!
    @IBOutlet var speed: UITextField!
    @IBOutlet var skill1: UITextField!
    @IBOutlet var skillMaxLevel1: UITextField!
    @IBOutlet var skillDescription1: UITextField!
    @IBOutlet var skill2: UITextField!
    @IBOutlet var skillMaxLevel2: UITextField!
    @IBOutlet var skillDescription2: UITextField!
    @IBOutlet var skill3: UITextField!
    @IBOutlet var skillMaxLevel3: UITextField!
    @IBOutlet var skillDescription3: UITextField!
    @IBOutlet var skill4: UITextField!
    @IBOutlet var skillMaxLevel4: UITextField!
    @IBOutlet var skillDescription4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(addContent))
        print("debug view")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addContent() {
        let ad = UIApplication.sharedApplication().delegate as! AppDelegate
        let mc = ad.managedObjectContext
        let entity = NSEntityDescription.entityForName("Test", inManagedObjectContext: mc)
        let aTest = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: mc)
        aTest.setValue(1, forKey: "id")
        do {
            try mc.save()
        } catch {
            print("error when svaing to DB")
        }
    }

}
