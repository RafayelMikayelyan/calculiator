//
//  ViewController.swift
//  newVersionOfCalculiator
//
//  Created by Rafayel on 31.08.23.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - proporties
    private var service: CalcService?
    @IBOutlet weak var mainLable: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up your UI elements here
        service = CalcService(displayView: self)
        swipeAction()
    }
    
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.mainLable.text = text
        }
    }
    
    private func swipeAction() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(call))
        swipeGesture.direction = [.left, .right]
        mainLable.addGestureRecognizer(swipeGesture)
        mainLable.isUserInteractionEnabled = true
        
    }
    @objc private func call () {
        service?.removeCharacter()
    }
   
    @IBAction private func buttonIsPressed (_ sender: CustomButton) {
        
        switch sender.tag {
        case 0...9:
            service?.numberAction(number: sender.tag)
        case 11:
            self.mainLable.text = String(service?.leftOperant ?? 0)
            service?.dot()
        case 12:
            service?.makeResult()
        case 13:
            service?.addition()
            self.mainLable.text = String(service?.leftOperant ?? 0)
        case 14:
            service?.substraction()
        case 15:
            service?.multiplication()
        case 16:
            service?.division()
        case 17:
            service?.percent()
        case 18:
            service?.changeSign()
        case 19:
            service?.acAction()
        default:
            break
        }
        
    }
}
