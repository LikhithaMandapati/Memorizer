//
//  ViewController.swift
//  Exercise3_Mandapatu_Likhitha
//
//  Created by student on 9/11/22.
//

import UIKit

class ViewController: UIViewController, EditTopicDelegate, AddBulletDelegate {
    
    var topics = ["UIAlertController", "UIKit", "View Controller"]
    
    let images = [UIImage(named:"alertControllerImage.png"),
                  UIImage(named:"uiKitImage.png"),
                  UIImage(named:"viewControllerImage.png")]
    
    var content = [
        """
        ☆ configure alerts and action sheets
        ☆ intended to be used as-is
        ☆ does not support subclassing
        ☆ inherits from UIViewController
        ☆ support text fields to the alert interface
        ☆ maintains a reference to each text field
        """,
        """
        ☆ provides required iOS infrastructure
        ☆ window and view architecture
        ☆ event handling for multi-touch and etc
        ☆ manages interaction with system
        ☆ a lot of features incl. resource mgmnt
        ☆ v classes only from main thread
        """,
        """
        ☆ defines the behavior for common VCs
        ☆ updates the content of the view
        ☆ responding to user interactions
        ☆ resizing views and layout mgmnt
        ☆ coordinating with other objects
        ☆ VC are UIResponder objects
        """
    ]
    
    //
    var topicIndex = 0
    
    @IBOutlet weak var topicImage: UIImageView!
    @IBOutlet weak var topicTitle: UILabel!
    @IBOutlet weak var listItemView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showTopic()
    }
    
    func showTopic() {
        topicImage.image = images[topicIndex]
        topicTitle.text = topics[topicIndex]
        listItemView.text = content[topicIndex]
    }
    
    @IBAction func nextTopic(_ sender: Any) {
        if topicIndex >= topics.count-1 {
            topicIndex = 0
        } else {
            topicIndex += 1
        }
        self.showTopic()
    }
    
    @IBAction func topicSelector(_ sender: Any) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: "Pick a Topic", preferredStyle: .actionSheet)

        let firstAction: UIAlertAction = UIAlertAction(title: self.topics[0], style: .default) { action -> Void in
            self.topicIndex = 0
            self.showTopic()
        }

        let secondAction: UIAlertAction = UIAlertAction(title: self.topics[1], style: .default) { action -> Void in
            self.topicIndex = 1
            self.showTopic()
        }
        
        let thirdAction: UIAlertAction = UIAlertAction(title: self.topics[2], style: .default) { action -> Void in
            self.topicIndex = 2
            self.showTopic()
        }

        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }

        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(thirdAction)
        actionSheetController.addAction(cancelAction)

        present(actionSheetController, animated: true)
    }
    
    @IBAction func addBullet(_ sender: Any) {
        if let addBulletVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "AddBulletViewController") as? AddBulletViewController {
            addBulletVC.topicTitleText = topics[topicIndex]
            addBulletVC.topicIndex = self.topicIndex
            addBulletVC.delegate = self
            self.present(addBulletVC, animated: true)
        }
    }
    
    @IBAction func editTopicName(_ sender: Any) {
        if let editTopicVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "EditTopicViewController") as? EditTopicViewController {
            editTopicVC.topicTitleText = self.topics[topicIndex]
            editTopicVC.topicIndex = self.topicIndex
            editTopicVC.delegate = self
            self.present(editTopicVC, animated: true)
        }
    }
    
    func topicNameEdited(newTitle: String, index: Int) {
        topics[index] = newTitle
        self.showTopic()
    }
    
    func addBullet(bulletText: String, index: Int) {
        let updatedText = "\n☆ " + bulletText
        content[index].append(contentsOf: updatedText)
        showTopic()
    }
}

