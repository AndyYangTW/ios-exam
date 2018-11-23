//
//  DetailVC.swift
//  ios-exam
//
//  Created by Andy Yang on 2018/11/23.
//  Copyright © 2018 Andy Yang. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var mobile: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var contactperson: UILabel!
    @IBOutlet weak var contactpersonphone: UILabel!
    
    var thePerson: Person?
    
    static func instance(person: Person) -> DetailVC {
        let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        newVC.thePerson = person
        return newVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpContent()
    }
    
    private func setUpContent() {
        self.firstname.text = "First Name: \(thePerson?.name?.first ?? "")"
        self.lastname.text = "Last Name: \(thePerson?.name?.last ?? "")"
        
        let format1 = DateFormatter()
        format1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let formattedDob = format1.date(from: thePerson?.dob?.date ?? "")
        format1.dateFormat = "yyyy/MM/dd"
        self.dob.text = "Birthday: \(format1.string(from: formattedDob!))"
        self.age.text = "Age: \(self.getAge(birthday: formattedDob!))"
        self.email.text = "E-mail: \(thePerson?.email ?? "")"
        self.mobile.text = "Mobile: \(thePerson?.cell ?? "")"
        self.address.text = "Address: \(thePerson?.location?.state ?? "") \(thePerson?.location?.city ?? "") \(thePerson?.location?.street ?? "")"
        self.contactperson.text = "Contact Person: \(thePerson?.name?.first ?? "") \(thePerson?.name?.last ?? "")"
        self.contactpersonphone.text = "Contact Person Mobile: \(thePerson?.phone ?? "")"
    }
    
    private func getAge(birthday: Date) -> Int {
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year
        return age!
    }
}
