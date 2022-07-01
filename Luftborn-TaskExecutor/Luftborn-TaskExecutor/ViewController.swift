//
//  ViewController.swift
//  Luftborn-TaskExecutor
//
//  Created by Ahmed Ouf on 01/07/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tasksSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var tableItems: [Task] = []
    
    let dateFormatter : DateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        //Date Formatter format
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        //Segment Controller selected text color
        tasksSegmentedControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        tasksSegmentedControl.tintColor = UIColor.clear

        //Table view setup
        self.tasksTableView.delegate = self
        self.tasksTableView.dataSource = self
        self.tasksTableView.separatorStyle = .none
        self.tasksTableView.layer.borderColor = UIColor.gray.cgColor
        self.tasksTableView.layer.borderWidth = 1.0

        // Register TableView Cell
        self.tasksTableView.register(TaskCell.nib, forCellReuseIdentifier: TaskCell.identifier)

        // Update TableView with the data
        self.tasksTableView.reloadData()
    }
    
    //Segment Controller segment changed
    @IBAction func taskSelected(_ sender: Any) {
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        let tag = Int64(Date().timeIntervalSince1970 * 1000)
        switch tasksSegmentedControl.selectedSegmentIndex{
        case 0:
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2, execute: {
                self.tableItems.append(Task(startTime: dateString, taskName: "Task 1",taskTag: tag))
                DispatchQueue.main.async {
                    self.tasksTableView.reloadData()
                    self.tasksTableView.layoutIfNeeded()
                }
            })
            break
        case 1:
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 4, execute: {
                self.tableItems.append(Task(startTime: dateString, taskName: "Task 2",taskTag: tag))
                DispatchQueue.main.async {
                    self.tasksTableView.reloadData()
                    self.tasksTableView.layoutIfNeeded()
                }
            })
            break
        case 2:
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 6, execute: {
                self.tableItems.append(Task(startTime: dateString, taskName: "Task 3",taskTag: tag))
                DispatchQueue.main.async {
                    self.tasksTableView.reloadData()
                    self.tasksTableView.layoutIfNeeded()
                }
            })
            break
        case 3:
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 8, execute: {
                self.tableItems.append(Task(startTime: dateString, taskName: "Task 4", taskTag: tag))
                DispatchQueue.main.async {
                    self.tasksTableView.reloadData()
                    self.tasksTableView.layoutIfNeeded()
                }
            })
            break
        default: break
        }
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as? TaskCell else { fatalError("xib doesn't exist") }

        cell.startTimeLabel.text = self.tableItems[indexPath.row].startTime
        cell.taskNameLabel.text = self.tableItems[indexPath.row].taskName
        return cell
    }
    
}
