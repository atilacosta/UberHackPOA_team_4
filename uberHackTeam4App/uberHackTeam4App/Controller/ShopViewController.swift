//
//  ShopViewController.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 19/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import UIKit
import TransitionButton

class ShopViewController: UIViewController {

    @IBOutlet weak var creditsLabel: UILabel!
    
    @IBOutlet weak var buy5Button: TransitionButton! {
        didSet {
            buy5Button.layer.borderWidth = 2.0
            buy5Button.layer.borderColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0).cgColor
            buy5Button.setTitleColor(.lightGray, for: .disabled)
            buy5Button.layer.zPosition = 100
        }
    }
    @IBOutlet weak var buy10Button: TransitionButton! {
        didSet {
            buy10Button.layer.borderWidth = 2.0
            buy10Button.setTitleColor(.lightGray, for: .disabled)
            buy10Button.layer.borderColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0).cgColor
        }
    }
    @IBOutlet weak var buy15Button: TransitionButton! {
        didSet {
            buy15Button.layer.borderWidth = 2.0
            buy15Button.setTitleColor(.lightGray, for: .disabled)
            buy15Button.layer.borderColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0).cgColor
        }
    }
    @IBOutlet weak var buy20Button: TransitionButton! {
        didSet {
            buy20Button.layer.borderWidth = 2.0
            buy20Button.setTitleColor(.lightGray, for: .disabled)
            buy20Button.layer.borderColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0).cgColor
        }
    }
    
    @IBAction func buy5(_ sender: Any) {
        buy5Button.startAnimation()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.buy5Button.backgroundColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0)
        })
        
        AppProvider.shared.getPromo(value: 5.0) { promo in
            AppProvider.shared.updateCredits(value: (self.user?.credits ?? 5.0) - 5.0)
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationController?.navigationBar.alpha = 0.0
            }, completion: { result in
                self.buy5Button.stopAnimation(animationStyle: .expand, revertAfterDelay: 0.5) {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "done")
                    viewController.modalTransitionStyle = .crossDissolve
                    self.present(viewController, animated: true, completion: nil)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.buy5Button.backgroundColor = .white
                })
            })
            
        }
    }
    @IBAction func buy10(_ sender: Any) {
        buy5Button.startAnimation()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.buy10Button.backgroundColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0)
        })
        
        AppProvider.shared.getPromo(value: 5.0) { promo in
            AppProvider.shared.updateCredits(value: (self.user?.credits ?? 10.0) - 10.0)
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationController?.navigationBar.alpha = 0.0
            }, completion: { result in
                self.buy10Button.stopAnimation(animationStyle: .expand, revertAfterDelay: 0.5) {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "done")
                    viewController.modalTransitionStyle = .crossDissolve
                    self.present(viewController, animated: true, completion: nil)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.buy10Button.backgroundColor = .white
                })
            })
            
        }
    }
    @IBAction func buy15(_ sender: Any) {
        buy15Button.startAnimation()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.buy15Button.backgroundColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0)
        })
        
        AppProvider.shared.getPromo(value: 5.0) { promo in
            AppProvider.shared.updateCredits(value: (self.user?.credits ?? 15.0) - 15.0)
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationController?.navigationBar.alpha = 0.0
            }, completion: { result in
                self.buy5Button.stopAnimation(animationStyle: .expand, revertAfterDelay: 0.5) {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "done")
                    viewController.modalTransitionStyle = .crossDissolve
                    self.present(viewController, animated: true, completion: nil)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.buy15Button.backgroundColor = .white
                })
            })
            
        }
    }
    @IBAction func buy20(_ sender: Any) {
        buy20Button.startAnimation()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.buy20Button.backgroundColor = UIColor(red: 67.0/255.0, green: 198.0/255.0, blue: 158/255.0, alpha: 1.0)
        })
        
        AppProvider.shared.getPromo(value: 5.0) { promo in
            AppProvider.shared.updateCredits(value: (self.user?.credits ?? 20.0) - 20.0)
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationController?.navigationBar.alpha = 0.0
            }, completion: { result in
                self.buy5Button.stopAnimation(animationStyle: .expand, revertAfterDelay: 0.5) {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "done")
                    viewController.modalTransitionStyle = .crossDissolve
                    self.present(viewController, animated: true, completion: nil)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.buy20Button.backgroundColor = .white
                })
            })
            
        }
    }
    
    @IBAction func buy(_ sender: Any) {
        guard let credit = (sender as? UIView)?.tag, let creditType = Credits(rawValue: credit) else {
            fatalError("(DEBUG) :- No such credit")
        }
        
        switch creditType {
            case .yellow5:
                AppProvider.shared.updateCredits(value: (user?.credits ?? 5.0) - 5.0)
                self.performSegue(withIdentifier: Segues.presentDone.rawValue, sender: creditType)
            case .yellow10:
                AppProvider.shared.updateCredits(value: (user?.credits ?? 10.0) - 10.0)
                self.performSegue(withIdentifier: Segues.presentDone.rawValue, sender: creditType)
            case .yellow20:
                AppProvider.shared.updateCredits(value: (user?.credits ?? 20.0) - 20.0)
                self.performSegue(withIdentifier: Segues.presentDone.rawValue, sender: creditType)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DoneViewController, let promo = sender as? Promo {
            dest.promo = promo
        }
    }
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        // Do any additional setup after loading the view.
        AppProvider.shared.getUser { user in
            self.user = user
            self.creditsLabel.text = String(format: "R$ %.2f", user.credits)
            if user.credits >= 20 {
                self.buy20Button.isEnabled = true
                self.buy15Button.isEnabled = true
                self.buy10Button.isEnabled = true
                self.buy5Button.isEnabled = true
            } else if user.credits >= 15 {
                self.buy20Button.isEnabled = false
                self.buy15Button.isEnabled = true
                self.buy10Button.isEnabled = true
                self.buy5Button.isEnabled = true
            } else if user.credits >= 10 {
                self.buy20Button.isEnabled = false
                self.buy15Button.isEnabled = false
                self.buy10Button.isEnabled = true
                self.buy5Button.isEnabled = true
            } else if user.credits >= 5 {
                self.buy20Button.isEnabled = false
                self.buy15Button.isEnabled = false
                self.buy10Button.isEnabled = false
                self.buy5Button.isEnabled = true
            } else {
                self.buy20Button.isEnabled = false
                self.buy15Button.isEnabled = false
                self.buy10Button.isEnabled = false
                self.buy5Button.isEnabled = false
            }
            
        }
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
