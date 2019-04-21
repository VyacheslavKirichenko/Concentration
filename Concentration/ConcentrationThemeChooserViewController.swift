//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by VyacheslavKrivoi on 4/11/19.
//  Copyright © 2019 Michel Deiman. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController,UISplitViewControllerDelegate {

    var emojiThemes: [ConcentrationViewController.Theme] = [
        ConcentrationViewController.Theme(name: "Fruits",
              emojis:["🍏", "🍊", "🍓", "🍉", "🍇", "🍒", "🍌", "🥝", "🍆", "🍑", "🍋"],
              viewColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),
              cardColor: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)),
        ConcentrationViewController.Theme(name: "Faces",
              emojis:["😀", "😂", "🤣", "😃", "😄", "😅", "😆", "😉", "😊", "😋", "😎"],
              viewColor: #colorLiteral(red: 1, green: 0.8999392299, blue: 0.3690503591, alpha: 1),
              cardColor: #colorLiteral(red: 0.5519944677, green: 0.4853407859, blue: 0.3146183148, alpha: 1)),
        ConcentrationViewController.Theme(name: "Activity",
              emojis:["⚽️", "🏄‍♂️", "🏑", "🏓", "🚴‍♂️","🥋", "🎸", "🎯", "🎮", "🎹", "🎲"],
              viewColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),
              cardColor: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))

    ]
    
//    @IBAction func changeTheme(_ sender: Any) {
//        if let cvc = splitViewDetailConcentrationViewController {
//        if let themeName = (sender as? UIButton)?.currentTitle  {
//            for i in 0...emojiThemes.count-1 {
//
//                if  emojiThemes[i].name == themeName {
//                    let theme = emojiThemes[i]
//                        cvc.emojiThemes = [theme]
//                }
//            }
//        } else {
//            performSegue(withIdentifier: "Choose Theme", sender: sender)
//            }
//        }
//    }
//    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
//        return splitViewController?.viewControllers.last as? ConcentrationViewController
//    }
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle {
                
                for i in 0...emojiThemes.count-1 {
                    if emojiThemes[i].name==themeName{
                        let theme = emojiThemes[i]
                        cvc.emojiThemes = [theme]
                    }
                }
            }
        }else
            if let cvc = lastSeguedToConcentrationViewController {
                if let themeName = (sender as? UIButton)?.currentTitle {
                    for i in 0...emojiThemes.count-1 {
                        if emojiThemes[i].name==themeName {
                            let theme = emojiThemes[i]
                            cvc.emojiThemes = [theme]
                        }
                    }
                }
                navigationController?.pushViewController(cvc, animated: true)
            } else {
                performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSeguedToConcentrationViewController:ConcentrationViewController?
    
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController
        ) -> Bool
    {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            return cvc.emojiThemes == nil                                      //<------------
        }
        return false
    }
    
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle {
                for i in 0...emojiThemes.count-1 {
                    if  emojiThemes[i].name == themeName {
                        let theme = emojiThemes[i]
                        if let cvc = segue.destination as? ConcentrationViewController {
                            cvc.emojiThemes = [theme]
                            lastSeguedToConcentrationViewController = cvc
                        }
                    }
                }
            }
        }
    }

}
