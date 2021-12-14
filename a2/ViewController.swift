//
//  ViewController.swift
//  a2
//
//  Created by Matthew Beerens on 19/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var students = [[String]]()
    var student = [String]()
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let studentInfo = segue.destination as? StudentInfo
//        {
//            studentInfo.student = student
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.text = students[indexPath.row][0] + " " + students[indexPath.row][1] + " " + students[indexPath.row][2]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "StudentInfo") as? StudentInfo
        {
            vc.student.append(students[indexPath.row][0])
            vc.student.append(students[indexPath.row][1])
            vc.student.append(students[indexPath.row][2])
            vc.student.append(students[indexPath.row][3])
            vc.student.append(students[indexPath.row][4])
            vc.student.append(students[indexPath.row][5])
            vc.student.append(students[indexPath.row][6])
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBOutlet weak var studentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        students = appDelegate.getStudents()
    }

}

