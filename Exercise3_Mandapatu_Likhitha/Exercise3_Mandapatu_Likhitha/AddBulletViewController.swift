//
//  AddBulletViewController.swift
//  Exercise3_Mandapatu_Likhitha
//
//  Created by student on 9/12/22.
//

import UIKit

protocol AddBulletDelegate {
    func addBullet(bulletText: String, index: Int)
}

class AddBulletViewController: UIViewController {
    
    var delegate : AddBulletDelegate?
    
    var labelInput : String?
    var addBulletInput : String?
    
    var topicIndex: Int!
    var topicTitleText: String?
    
    @IBOutlet weak var topicTitle: UILabel!
    @IBOutlet weak var text1: UITextView!
    
    
    @IBAction func save(_ sender: Any) {
        if let updatedText = text1.text, !updatedText.isEmpty {
            self.delegate?.addBullet(bulletText: updatedText, index: topicIndex)
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ADD BULLET"
        self.topicTitle.text = topicTitleText
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
