//
//  ViewController.swift
//  popupPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 11/27/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickhereButtonPressed(_ sender: AnyObject) {
        let btn = sender as? UIButton
        self.present(popupViewController(initialPopupPoint: btn!.center), animated: true, completion: nil)
    }

}

