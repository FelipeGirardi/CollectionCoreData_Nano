//
//  contactDetails.swift
//  CollectionCoreData_Nano
//
//  Created by Henrique Figueiredo Conte on 07/06/19.
//  Copyright © 2019 Felipe Girardi. All rights reserved.
//

import CoreData
import UIKit

class ContactDetails: UIViewController{
    
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhone: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    var name: String!
    var phone: String!
    var email: String!
    var image: UIImageView!
    
    @IBAction func backToContactScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        contactImage = image
        contactEmail.text = email
        contactPhone.text = phone
        contactName.text = name
        
    }
}
