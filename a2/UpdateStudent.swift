//
//  UpdateStudent.swift
//  a2
//
//  Created by Matthew Beerens on 21/10/21.
//

import UIKit

class UpdateStudent: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var age: UIStepper!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var edit: UIButton!
    
    var student = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fName.text! = student[0]
        lName.text! = student[1]
        
        if student[2] == "M"
        {
            gender.selectedSegmentIndex = 0
        } else {
            gender.selectedSegmentIndex = 1
        }
        
        age.value = Double(Int(student[3]) ?? 0)
        address.text! = student[5]
        course.text! = student[4]
        ageLabel.text! = String(Int(age.value))
    }
    @IBAction func incAge(_ sender: Any) {
        ageLabel.text = String(Int(age.value))
    }
    
    @IBAction func changeGender(_ sender: Any) {
        if gender.selectedSegmentIndex == 0 {
            student[2] = "M"
        } else {
            student[2] = "F"
        }
    }
    @IBAction func editStudent(_ sender: Any) {
        student[0] = fName.text!
        student[1] = lName.text!
        student[4] = course.text!
        student[5] = address.text!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.updateStudent(fName: student[0], lName: student[1], age: Int(age.value), gender: student[2], address: student[5], course: student[4], id: student[6])
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
