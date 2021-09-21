//
//  InitialViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 17/09/2021.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var numberOfParticipantsTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    @IBOutlet weak var aceptTermsSwitch: UISwitch!
    
    private var participant: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aceptTermsSwitch.isOn = false
        startButton.layer.cornerRadius = startButton.bounds.height/8
        startButton.isEnabled = true
    }

    @IBAction func termsAndConditionsButtonTapped(_ sender: Any) {
        let vc = TermsAndConditionViewController(nibName:"TermsAndConditionViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
        
    @IBAction func startButtonTaped(_ sender: Any) {
        if validateInputText() {
            //TAB BAR
            let vc = TabBarController(nibName: "TabBarController", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        } else {
            let message = "Please enter the number of participants to continue"
            let alert = UIAlertController(title: "Start", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        numberOfParticipantsTextField.text = ""
        startButton.isEnabled = true            
    }
    
    func validateInputText() -> Bool{
        if let amountText = numberOfParticipantsTextField.text, let amountNum = Int(amountText), amountNum > 0 && numberOfParticipantsTextField.hasText {
//          aceptTermsSwitch.isOn
            self.participant = amountNum
            startButton.backgroundColor = .systemBlue
            return true
        } else {
            startButton.isEnabled = false
            startButton.backgroundColor = .systemPink
        }
        return false
    }
            
    
}


