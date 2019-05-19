//
//  DoneViewController.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 19/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var copyButton: UIButton!
    @IBAction func copyToClipboard(_ sender: Any) {
        UIPasteboard.general.string = copyButton.titleLabel?.text ?? ""
    }
    
    var promo: Promo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if let promo = promo {
            self.configure(promo)
        } else {
            AppProvider.shared.getPromo(value: 10.0) { promo in
                self.configure(promo)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.modalTransitionStyle = .coverVertical
        self.modalPresentationStyle = .overCurrentContext
    }
    
    func configure(_ promo: Promo) {
        self.copyButton.setTitle(promo.code, for: .normal)
    }
}
