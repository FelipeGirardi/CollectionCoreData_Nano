//
//  ContactListViewController.swift
//  CollectionCoreData_Nano
//
//  Created by Felipe Girardi on 06/06/19.
//  Copyright © 2019 Felipe Girardi. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet weak var contactCollectionView: UICollectionView!
    
    let defaults = UserDefaults.standard        // UserDefaults para salvar os nomes sem CoreData (pode tirar quando pôr CoreData)
    
    @IBAction func addContactButtonAction(_ sender: CustomButton) {
        defaults.set(contactNames, forKey: "contactsKey")
        
        performSegue(withIdentifier: "GoToAddContactScreen", sender: nil)
    }
    
    var receivedName: String?
    var contactNames: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactCollectionView.delegate = self
        contactCollectionView.dataSource = self

        if(receivedName != nil) {
            contactNames = defaults.object(forKey:"contactsKey") as? [String] ?? [String]()
            contactNames.append(receivedName ?? "")     // adiciona nome no array de nomes
        }
    }


}

extension ContactListViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCell", for: indexPath as IndexPath) as! contactListCollectionViewCell
        
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0).cgColor
        cell.layer.cornerRadius = 9
        
        cell.contactName?.text = self.contactNames[indexPath.row]       // coloca nome na label da CollectionViewCell
        
        return cell
    }
    

}
