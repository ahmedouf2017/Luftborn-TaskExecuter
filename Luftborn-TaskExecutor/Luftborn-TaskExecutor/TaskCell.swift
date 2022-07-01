//
//  TaskCell.swift
//  Luftborn-TaskExecutor
//
//  Created by Ahmed Ouf on 01/07/2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
