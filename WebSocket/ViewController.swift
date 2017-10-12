//
//  ViewController.swift
//  WebSocket
//
//  Created by saul ulises urias guzmàn on 11/10/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var nextButtonItem: UIBarButtonItem!
    @IBOutlet weak var textFieldUserName: UITextField!
    
    //MARK: - Varailabels And Constants
    let segueIdentifier = "goToChatMessage"
    var username = ""
    
    //MARK: - View Life
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == segueIdentifier,
            let viewController = segue.destination as? EmojiViewController else {
                return
        }
        
        viewController.username = username
    }
    
    //MARK: - Actions
    @IBAction func nextButtonPressed(_ sender: Any) {
        if textFieldUserName.text != "" {
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        }
    }
    


}

