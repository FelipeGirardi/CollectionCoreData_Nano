//
//  contactListCollectionViewCell.swift
//  CollectionCoreData_Nano
//
//  Created by Felipe Girardi on 06/06/19.
//  Copyright © 2019 Felipe Girardi. All rights reserved.
//
import UIKit

class contactListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var contactName: UILabel! = UILabel()
    @IBOutlet weak var contactImage: UIImageView!
    var contactPhone: String!
    var contactEmail: String!

    
    
}
