//
//  EditTopicViewController.swift
//  Exercise3_Mandapatu_Likhitha
//
//  Created by student on 9/12/22.
//

import UIKit

protocol EditTopicDelegate {
    func topicNameEdited(newTitle: String, index: Int)
}

class EditTopicViewController: UIViewController {

    var topicIndex: Int!
    var topicTitleText: String?
    var delegate: EditTopicDelegate?
    
    @IBOutlet weak var topicTitle: UILabel!
    @IBOutlet weak var newTopicTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topicTitle.text = topicTitleText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        if let newTopicTitle = newTopicTextField.text, !newTopicTitle.isEmpty {
            self.delegate?.topicNameEdited(newTitle: newTopicTitle, index: topicIndex)
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
