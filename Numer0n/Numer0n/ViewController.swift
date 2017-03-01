//
//  ViewController.swift
//  Numer0n
//
//  Created by 石川陽貴 on 2017/02/26.
//  Copyright © 2017年 石川陽貴. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var p1TextF: UITextField!
    @IBOutlet weak var p2TextF: UITextField!
    @IBOutlet weak var p1Send: UIButton!
    @IBOutlet weak var p2Send: UIButton!
    @IBOutlet weak var p1TextView: UITextView!
    @IBOutlet weak var p2TextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.fi
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func p1SendAction(_ sender: Any) {
    }
    @IBAction func p2SendAction(_ sender: Any) {
    }
    
    func Numeron(Pnum:String,num:String)->String{
        var bite:Int = 0
        var eat:Int = 0
        
        let num1:String = num.substring(to: num.index(after: num.startIndex))
        let num2:String = num.substring(with: num.index(num.startIndex, offsetBy: 1)..<num.index(num.endIndex, offsetBy: -1))
        let num3:String = num.substring(from: num.index(before: num.endIndex))
    
        if Pnum.contains(num1){
            bite+=1
        }
        if Pnum.contains(num2){
            bite+=1
        }
        if Pnum.contains(num3){
            bite+=1
        }
        
        if Pnum.hasPrefix(num1){
            eat+=1
        }
        if Pnum.substring(with: Pnum.index(num.startIndex, offsetBy: 1)..<num.index(num.endIndex,offsetBy:-1)).hasPrefix(num2){
            eat+=1
        }
        if Pnum.hasSuffix(num3){
            eat+=1
        }
        
        bite = bite - eat
        
        return String(eat)+"EAT-"+String(bite)+"BITE"
    }
}
