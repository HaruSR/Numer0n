//
//  ViewController.swift
//  Numer0n
//
//  Created by 石川陽貴 on 2017/02/26.
//  Copyright © 2017年 石川陽貴. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var p1 = ""
    var p2 = ""
    var flag1 = 0
    var flag2 = 0
    
    
    
    @IBOutlet weak var p1TextF: UITextField!
    @IBOutlet weak var p2TextF: UITextField!
    @IBOutlet weak var p1Send: UIButton!
    @IBOutlet weak var p2Send: UIButton!
    @IBOutlet weak var p1TextView: UITextView!
    @IBOutlet weak var p2TextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.fi
        p1TextF.delegate = self
        p1TextF.returnKeyType = .done
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func p1SendAction(_ sender: Any) {
        if flag1 == 0 {
            p1 = textFieldDidChange(p1TextF.text!)
//            p1 = p1TextF.text!
            self.p1TextView.text.append("\(p1)\n")
            
        } else {
            self.p1TextView.text.append(textFieldDidChange(p1TextF.text!)+"\n")
            
//          self.p1TextView.text = numeron(p1TextF.text!)
        }
    }
    @IBAction func p2SendAction(_ sender: Any) {
        
    }
    func p1TextFShouldReturn(_ textField: UITextField) -> Bool {
        p1TextF.resignFirstResponder()
        
        return true
    }
    func p2TextFShouldReturn(_ textField: UITextField) -> Bool {
        p2TextF.resignFirstResponder()
        
        return true
    }
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
    
    func textFieldDidChange(_ text:String) -> String {
        
        var teX:String = ""
        
            if text.characters.count == 3 {
                flag1 = 1
                teX = text.substring(to: text.index(text.startIndex, offsetBy: 3))
            }else {
                teX = "error input"
        }
        return String(teX)
    }
    
}





