//
//  AddContactViewController.swift
//  CollectionCoreData_Nano
//
//  Created by Felipe Girardi on 06/06/19.
//  Copyright © 2019 Felipe Girardi. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToContactList" {
            if let contactListController = segue.destination as? ContactListViewController {
                contactListController.receivedName = nameTextField.text ?? ""       // manda nome para String receivedName da ContactListViewController
                
            }
        }
    }
    
    @IBAction func saveContactButtonAction(_ sender: CustomButton) {
        performSegue(withIdentifier: "GoToContactList", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
