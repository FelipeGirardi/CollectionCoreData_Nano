//
//  ContactListViewController.swift
//  CollectionCoreData_Nano
//
//  Created by Felipe Girardi on 06/06/19.
//  Copyright © 2019 Felipe Girardi. All rights reserved.
//

import CoreData
import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet weak var contactCollectionView: UICollectionView!
    

    
    @IBAction func addContactButtonAction(_ sender: CustomButton) {
        defaults.set(contactNames, forKey: "contactsKey")
        
        performSegue(withIdentifier: "GoToAddContactScreen", sender: nil)
    }
    let defaults = UserDefaults.standard        // UserDefaults para salvar os nomes sem CoreData (pode tirar quando pôr CoreData)
    var contactList:[Contact] = []

    var receivedName: String?
    var contactNames: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactCollectionView.delegate = self
        contactCollectionView.dataSource = self
        fetchContacts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if(receivedName != nil) {

            contactNames = defaults.object(forKey:"contactsKey") as? [String] ?? [String]()
            contactNames.append(receivedName ?? "")     // adiciona nome no array de nomes
            let indexPath = [IndexPath(item: contactList.count - 1, section: 0)]
            contactCollectionView.insertItems(at: indexPath)
            try? persistentContainer?.viewContext.save()
            receivedName = nil
        }
    }
    
    func fetchContacts() {
        guard let persistentContainer = persistentContainer else { return }
        
        let fetchRequest = NSFetchRequest<Contact>(entityName: "\(Contact.self)")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        guard let contacts = try? persistentContainer.viewContext.fetch(fetchRequest) else { return }
        
        self.contactList.append(contentsOf: contacts)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let contactDetailsScreen = segue.destination as? ContactDetails {

            if let contactDetails = sender as? contactListCollectionViewCell {
                
                contactDetailsScreen.name = contactDetails.contactName.text
                contactDetailsScreen.email = contactDetails.contactEmail
                contactDetailsScreen.phone = contactDetails.contactPhone
                contactDetailsScreen.image = contactDetails.contactImage
            }
            
        }
        
    }

}

extension UIViewController {
    var persistentContainer: NSPersistentContainer? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer
    }
}


extension ContactListViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCell", for: indexPath as IndexPath) as! contactListCollectionViewCell
        
        let possibleContactImages = [UIImage(named: "blue"), UIImage(named: "red"), UIImage(named: "yellow"), UIImage(named: "green")]
        
//        //cell.layer.borderWidth = 2
//        cell.layer.borderColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0).cgColor
//        cell.layer.cornerRadius = 9
        
        cell.contactName?.text = self.contactList[indexPath.row].name       // coloca nome na label da CollectionViewCell
        cell.contactEmail = self.contactList[indexPath.row].email
        cell.contactPhone = self.contactList[indexPath.row].phone
        cell.contactImage.image = possibleContactImages.randomElement()!
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "contactDetail", sender: nil)
    }
    

}
