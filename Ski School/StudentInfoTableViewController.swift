//
//  StudentInfoTableViewController.swift
//  Ski School
//
//  Created by Andi Setiyadi on 9/3/16.
//  Copyright © 2016 devhubs. All rights reserved.
//

import UIKit
import MessageUI

class StudentInfoTableViewController: UITableViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentAgeTextField: UITextField!
    @IBOutlet weak var sportControl: UISegmentedControl!
    @IBOutlet weak var parentNameTextField: UITextField!
    @IBOutlet weak var parentContactTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var instructorTextField: UITextField!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet var levelButtonCollection: [UIButton]!
    
    
    var coreData: CoreDataStack!
    var student: Student!
    var selectedLevel = ""
    var isNewStudent = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentNameTextField.text = student.name
        studentAgeTextField.text = String(student.age)
        
        if let level = student.level {
            let studentLevel = level
            selectedLevel = studentLevel
        }
        
        if let sport = student.sport {
            let studentSport = sport
            sportControl.selectedSegmentIndex = studentSport == "ski" ? 0 : 1
        }
        
        if let parentName = student.parentName {
            let studentParentName = parentName
            parentNameTextField.text = studentParentName
        }
        
        if let parentContact = student.parentContact {
            let studentParentContact = parentContact
            parentContactTextField.text = studentParentContact
        }
        
        if let instructor = student.instructor {
         let studentInstructor = instructor
         instructorTextField.text = studentInstructor
         }
        
        imageView.layer.cornerRadius = 35
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        
        if isNewStudent {
            deleteButton.isHidden = true
        }
        else {
            deleteButton.isHidden = false
            deleteButton.layer.cornerRadius = 6
            deleteButton.layer.borderWidth = 1
            deleteButton.layer.borderColor = UIColor.white.cgColor
        }
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        resetLevelButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func levelButtonAction(_ sender: UIButton) {
        selectedLevel = (sender.titleLabel?.text)!
        resetLevelButton()
        
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.red.cgColor
    }
    
    func resetLevelButton() {
        for button in levelButtonCollection {
            button.layer.borderWidth = 2
            button.layer.borderColor = button.titleLabel?.text == selectedLevel ? UIColor.red.cgColor : UIColor.gray.cgColor
            button.layer.cornerRadius = 10
        }
    }
    
    @IBAction func phoneAction(sender: UIButton) {
        let phoneNumber = student.parentContact!
        //let phoneURL = NSURL(string: "telprompt://\(phoneNumber)")!
        let phoneURL = URL(string: "telprompt://\(phoneNumber)")
        
        UIApplication.shared.open(phoneURL!, options: Dictionary(), completionHandler: nil)
    }
    
    @IBAction func smsAction(sender: UIButton) {
        let phoneNumber = student.parentContact!
        
        if MFMessageComposeViewController.canSendText() {
            let messageController = MFMessageComposeViewController()
            messageController.recipients = ["\(phoneNumber)"]
            messageController.messageComposeDelegate = self
            
            self.present(messageController, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }

    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        student.name = studentNameTextField.text
        
        if let number = Int16(studentAgeTextField.text!) {
            student.age = number
        }
        
        student.sport = sportControl.titleForSegment(at: sportControl.selectedSegmentIndex)
        student.level = selectedLevel
        student.parentName = parentNameTextField.text
        student.parentContact = parentContactTextField.text
        student.instructor = instructorTextField.text
        
        coreData.saveContext()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Student Info", message: "Are you sure you want to delete \"\(self.student.name!)\" from student list?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (action: UIAlertAction) -> Void in
            self.coreData.persistentContainer.viewContext.delete(self.student)
            self.coreData.saveContext()
            
            self.dismiss(animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
