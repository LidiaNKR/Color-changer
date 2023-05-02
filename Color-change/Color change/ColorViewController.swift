//
//  ColorViewController.swift
//  Color change
//
//  Created by Лидия Ладанюк on 14.02.2021.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class ColorViewController: UIViewController {
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.delegate = self
        settingsVC.colorMainView = view.backgroundColor
    }
}

// MARK: - ColorDelegate
extension ColorViewController: ColorViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

