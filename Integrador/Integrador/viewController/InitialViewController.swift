//
//  InitialViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 17/09/2021.
//

import UIKit

protocol ParticipantsInitialDelegate {
    func didUpdateParticipants(participant: Int) -> Int
}

class InitialViewController: UIViewController {

    @IBOutlet weak var numberOfParticipantsTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    
    private var delegate : ParticipantsInitialDelegate?
    private var participant: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = startButton.bounds.height/8
    }

    @IBAction func termsAndConditionsButtonTapped(_ sender: Any) {
        let vc = TermsAndConditionViewController(nibName:"TermsAndConditionViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
        
    @IBAction func startButtonTaped(_ sender: Any) {
        if let amountText = numberOfParticipantsTextField.text, let amountNum = Int(amountText), amountNum > 0 {
            
            let vc = TabBarController(nibName: "TabBarController", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)
            
        } else {
            let message = "Please enter the number of participants"
            let alert = UIAlertController(title: "Start", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
//    func setup(participant: Int, delegate: ParticipantsInitialDelegate) {
//        if let amountText = numberOfParticipantsTextField.text, let amountNum = Int(amountText), amountNum != 0 {
//            delegate.didUpdateParticipants(participant: amountNum)
//        }
//        self.delegate = delegate
//        self.participant = participant
//    }

}
