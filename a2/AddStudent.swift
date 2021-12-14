//
//  AddStudent.swift
//  a2
//
//  Created by Matthew Beerens on 19/10/21.
//

import UIKit

class AddStudent: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var age: UIStepper!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var ageOutput: UILabel!
    @IBOutlet weak var studentId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = Int(age.value);
        ageOutput.text = String(a)
        // Do any additional setup after loading the view.
    }
    
    var gen = "M"
    @IBAction func getGender(_ sender: Any)
    {
        switch gender.selectedSegmentIndex
        {
        case 0:
           gen = "M"
            break
        case 1:
            gen = "F"
            break
        default:
            break
        }
    }
    
    @IBAction func getAge(_ sender: Any)
    {
        let a = Int(age.value);
        ageOutput.text = String(a)
    }
    
    @IBAction func createStudent(_ sender: Any)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.storeStudent(fName: fName.text!, lName: lName.text!, gender: gen, age: Int(age.value), address: address.text!, course: course.text!, studentId: Int(studentId.text!)!)
        studentId.text = ""
        fName.text = ""
        lName.text = ""
        gender.selectedSegmentIndex = 0
        age.value = 17
        ageOutput.text = String(Int(age.value))
        course.text = ""
        address.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
