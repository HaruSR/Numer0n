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
        self.p1TextF.keyboardType = UIKeyboardType.numberPad
        self.p2TextF.keyboardType = UIKeyboardType.numberPad
        p1TextF.delegate = self
        p2TextF.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func p1SendAction(_ sender: Any) {
        if flag1 == 0 {
            p1 = textFieldDidChange1(p1TextF.text!)
        } else {
            var inputtex:String = textFieldDidChange1(p1TextF.text!)
            var tex:String = ""
            if inputtex != "error input"{
                tex = Numeron(Pnum: p2,num: inputtex)
            }else{
                tex = "error input\n"
            }
            self.p1TextView.text.append(tex)
        }
        p1TextF.text = ""
    }
    
    @IBAction func p2SendAction(_ sender: Any) {
        if flag2 == 0 {
            p2 = textFieldDidChange2(p2TextF.text!)
        }else {
            var inputtex:String = textFieldDidChange2(p2TextF.text!)
            var tex:String = ""
            if inputtex != "error input"{
                tex = Numeron(Pnum: p1,num: inputtex)
            }else{
                tex = "error input\n"
            }
            self.p2TextView.text.append(tex)
        }
        p2TextF.text = ""
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
    
    func textFieldDidChange1(_ text:String) -> String {
        
        var teX:String = ""
        
            if text.characters.count == 3 {
                flag1 = 1
                teX = text.substring(to: text.index(text.startIndex, offsetBy: 3))
            }else {
                teX = "error input"
        }
        return String(teX)
    }
    
    func textFieldDidChange2(_ text:String) -> String {
        
        var teX:String = ""
        
        if text.characters.count == 3 {
            flag2 = 1
            teX = text.substring(to: text.index(text.startIndex, offsetBy: 3))
        }else {
            teX = "error input"
        }
        return String(teX)
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
        
        return num+" "+String(eat)+"EAT-"+String(bite)+"BITE\n"
    }
    
    func textFieldShouldReturn(_ p1TextF: UITextField)->Bool{
        p1TextF.resignFirstResponder()
        return true
    }
    func textFieldShouldReturn2(_ p2TextF: UITextField)->Bool{
        p2TextF.resignFirstResponder()
        return true
    }
}





