//
//  StudentInfo.swift
//  a2
//
//  Created by Matthew Beerens on 19/10/21.
//

import UIKit

class StudentInfo: UIViewController {

    @IBOutlet weak var studentId: UILabel!
    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var delete: UIButton!
    
    var student = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentId.text = "student id: " + student[0]
        fName.text = "first name: " + student[1]
        lName.text = "last name: " + student[2]
        gender.text = "gender: " + student[3]
        age.text = "age: " + student[4]
        course.text = "course: " + student[5]
        address.text = "address: " + student[6]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let updateStudent = segue.destination as? UpdateStudent {
            updateStudent.student.append(student[1])
            updateStudent.student.append(student[2])
            updateStudent.student.append(student[3])
            updateStudent.student.append(student[4])
            updateStudent.student.append(student[5])
            updateStudent.student.append(student[6])
            updateStudent.student.append(student[0])
        }
    }
    

    @IBAction func deleteStudent(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.removeStudent(id: student[0])
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func viewExams(_ sender: Any)
    {
        
    }
   
}
