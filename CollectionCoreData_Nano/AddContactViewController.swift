//
//  AddContactViewController.swift
//  CollectionCoreData_Nano
//
//  Created by Felipe Girardi on 06/06/19.
//  Copyright © 2019 Felipe Girardi. All rights reserved.
//

import CoreData
import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveContactButtonAction(_ sender: CustomButton) {
        
        let persistingContainer = persistentContainer
        
        let contact = Contact(context: persistingContainer!.viewContext)
        contact.name = nameTextField.text ?? ""
        contact.phone = phoneTextField.text ?? ""
        contact.email = emailTextField.text ?? ""
        
        
        if let contactListController = presentingViewController as? ContactListViewController {
            contactListController.receivedName = nameTextField.text ?? ""
            contactListController.contactList.append(contact)
        }
        
        
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

