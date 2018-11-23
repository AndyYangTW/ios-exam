//
//  ViewController.swift
//  ios-exam
//
//  Created by Andy Yang on 2018/11/23.
//  Copyright © 2018 Andy Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personList: UITableView!
    var personData: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
    }
    
    private func loadData() {
        let url = "https://randomuser.me/api/?results=50&inc=name,dob,email,cell,location,phone,id"
        TheManager().callAPIWithDecoderMethod(VC: self, url: url, method: .get) { (data) in
            do {
                let result = try JSONDecoder().decode(PersonListResult.self, from: data)
                self.personData = result.results ?? []
                self.personList.reloadData()
            } catch let err {
                //Show Error Msg
                print(err.localizedDescription)
            }
        }
    }
    
    private func registerTableView() {
        self.personList.delegate = self
        self.personList.dataSource = self
        self.personList.register(UINib(nibName: "PersonListCell", bundle: nil), forCellReuseIdentifier: "PERSONLISTCELL")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.personList.dequeueReusableCell(withIdentifier: "PERSONLISTCELL") as! PersonListCell
        let person = self.personData?[indexPath.item]
        cell.name.text = "\(person?.name?.title ?? "") \(person?.name?.first ?? "") \(person?.name?.last ?? "")"
        return cell
    }
}
