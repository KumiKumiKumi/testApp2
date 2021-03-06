//
//  ViewController.swift
//  testApp
//
//  Created by Haruka Ono on 2015/04/20.
//  Copyright (c) 2015年 maximum80. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let divineButton: UIButton = UIButton()
    
    let resultLabel: UILabel = UILabel()
    
    enum Omikuji: Int {
        case Daikichi = 0
        case Kichi
        case Cyukichi
        case Syokichi
        case Kyo
        case Daikyo
    
        func getStatus() -> (String, UIColor) {
            switch self {
            case .Daikichi:
                return ("大吉", UIColor.redColor())//表示する文字と色を同時に返す
            case .Kichi:
                return ("吉", UIColor.orangeColor())
            case .Cyukichi:
                return ("中吉", UIColor.yellowColor())
            case .Syokichi:
                return ("小吉", UIColor.greenColor())
            case .Kyo:
                return ("凶", UIColor.grayColor())
            case .Daikyo:
                return ("大凶", UIColor.blueColor())
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        titleLabel.backgroundColor = UIColor.blueColor() //変更
        titleLabel.text = "あなたの運勢は．．．"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 200)
        self.view.addSubview(titleLabel)
        
        resultLabel.frame = CGRectMake(0,0,200,80)
        resultLabel.layer.borderColor = UIColor.blackColor().CGColor
        resultLabel.layer.borderWidth = 2.0
        resultLabel.layer.cornerRadius = 30
        
        resultLabel.text = "????"
        resultLabel.textAlignment = NSTextAlignment.Center
        resultLabel.font = UIFont.boldSystemFontOfSize(64)
        resultLabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 300)
        self.view.addSubview(resultLabel)
        
        divineButton.frame = CGRectMake(0,0,200,40)
        divineButton.backgroundColor = UIColor.redColor()
        divineButton.layer.masksToBounds = true
        
        divineButton.setTitle("運勢を占う", forState: UIControlState.Normal)
        divineButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        divineButton.layer.cornerRadius = 10.0
        divineButton.layer.position = CGPoint(x: self.view.frame.width / 2,y : 400)
        divineButton.tag = 1
        divineButton.addTarget(self, action: "onClickDivineButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(divineButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onClickDivineButton(sender: UIButton) {
        let random = Int(arc4random_uniform(UInt32(Omikuji.Daikyo.rawValue + 1)))
        if let r = Omikuji(rawValue: random) {
            let(msg,color) = r.getStatus() //getStatus()で２つの宣言を同時に呼び出す
            resultLabel.textColor = color
            resultLabel.text = msg
        }
    }
}



