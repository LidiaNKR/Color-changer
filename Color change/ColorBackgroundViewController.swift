//
//  ColorBackgroundViewController.swift
//  Color change
//
//  Created by Лидия Ладанюк on 14.02.2021.
//

import UIKit

class ColorBackgroundViewController: UIViewController {
    
    private var backGrounColorMainView: UIColor
    var deligate: UITextFieldDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController  else { return }
        settingsVC.backGrounColorMainView = backGrounColorMainView
    }
    




}
//
//extension ColorBackgroundViewController {
//    func setNewValues(for backGrounColorMainView: backGrounColorMainView) {
//        UIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: 1)
//
//    }
//}
