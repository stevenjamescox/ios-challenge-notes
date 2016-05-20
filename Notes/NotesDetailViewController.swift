//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Steve Cox on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {

    @IBOutlet weak var bodyField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
    }
}
