//
//  ViewController.swift
//  CutthroatCompanion
//
//  Created by Luis Rangel on 2/20/19.
//  Copyright © 2019 Luis Rangel. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    let impact = UIImpactFeedbackGenerator()
   

    @IBOutlet weak var P1_Name_Field: UITextField!
    @IBOutlet weak var player1Table: PlayerTable!
    @IBOutlet weak var P2_Name_Field: UITextField!
    @IBOutlet weak var P3_Name_Field: UITextField!
    @IBOutlet weak var player2Table: PlayerTable!
    @IBOutlet weak var player3Table: PlayerTable!
    @IBOutlet weak var P4_Name_Field: UITextField!
    @IBOutlet weak var player4Table: PlayerTable!
    @IBOutlet weak var P5_Name_Field: UITextField!
    @IBOutlet weak var player5Table: PlayerTable!
    @IBOutlet weak var v_BallController: UIView!
    
    
    //Keeping Track of Player Selections
    @IBOutlet weak var selectSlot1: UILabel!
    @IBOutlet weak var selectSlot2: UILabel!
    @IBOutlet weak var selectSlot3: UILabel!
    @IBOutlet weak var selectSlot4: UILabel!
    @IBOutlet weak var selectSlot5: UILabel!
    
    @IBOutlet weak var p1Select: UILabel!
    @IBOutlet weak var p2Select: UILabel!
    @IBOutlet weak var p3Select: UILabel!
    @IBOutlet weak var p4Select: UILabel!
    @IBOutlet weak var p5Select: UILabel!
    
    //Ball Toggles
    @IBOutlet weak var ball1_toggle: UILabel!
    @IBOutlet weak var ball2_toggle: UILabel!
    @IBOutlet weak var ball3_toggle: UILabel!
    @IBOutlet weak var ball4_toggle: UILabel!
    @IBOutlet weak var ball5_toggle: UILabel!
    @IBOutlet weak var ball6_toggle: UILabel!
    @IBOutlet weak var ball7_toggle: UILabel!
    @IBOutlet weak var ball8_toggle: UILabel!
    @IBOutlet weak var ball9_toggle: UILabel!
    @IBOutlet weak var ball10_toggle: UILabel!
    @IBOutlet weak var ball11_toggle: UILabel!
    @IBOutlet weak var ball12_toggle: UILabel!
    @IBOutlet weak var ball13_toggle: UILabel!
    @IBOutlet weak var ball14_toggle: UILabel!
    @IBOutlet weak var ball15_toggle: UILabel!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var playerToggle: UILabel!
    
    var mode = "three" // This keeps track if the app is in Three Player or Five Player Mode
    
    var threeQ = ["None", "Lo", "Mids", "Hi"]
    var fiveQ = ["None", "LoLo", "HiLo", "Mids", "LoHi", "HiHi"]
    var pos: [Int] = [0, 0, 0, 0, 0]
    var balls = [Bool](repeating:true, count: 15)
    
    var activeField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.isHidden = true;
        P1_Name_Field.delegate = self
        P2_Name_Field.delegate = self
        P3_Name_Field.delegate = self
        P4_Name_Field.delegate = self
        P5_Name_Field.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //Settup all Tap recognizers
        let fivePlayerTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.playerToggled))
        playerToggle.isUserInteractionEnabled = true
        playerToggle.addGestureRecognizer(fivePlayerTap)
        let select1Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.select1Toggled))
        p1Select.isUserInteractionEnabled = true
        p1Select.addGestureRecognizer(select1Tap)
        let select2Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.select2Toggled))
        p2Select.isUserInteractionEnabled = true
        p2Select.addGestureRecognizer(select2Tap)
        let select3Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.select3Toggled))
        p3Select.isUserInteractionEnabled = true
        p3Select.addGestureRecognizer(select3Tap)
        let select4Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.select4Toggled))
        p4Select.isUserInteractionEnabled = true
        p4Select.addGestureRecognizer(select4Tap)
        let select5Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.select5Toggled))
        p5Select.isUserInteractionEnabled = true
        p5Select.addGestureRecognizer(select5Tap)
        
        //Set Up Ball Toggles
        let ball1Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball1Toggled))
        ball1_toggle.addGestureRecognizer(ball1Tap)
        let ball2Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball2Toggled))
        ball2_toggle.addGestureRecognizer(ball2Tap)
        let ball3Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball3Toggled))
        ball3_toggle.addGestureRecognizer(ball3Tap)
        let ball4Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball4Toggled))
        ball4_toggle.addGestureRecognizer(ball4Tap)
        let ball5Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball5Toggled))
        ball5_toggle.addGestureRecognizer(ball5Tap)
        let ball6Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball6Toggled))
        ball6_toggle.addGestureRecognizer(ball6Tap)
        let ball7Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball7Toggled))
        ball7_toggle.addGestureRecognizer(ball7Tap)
        let ball8Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball8Toggled))
        ball8_toggle.addGestureRecognizer(ball8Tap)
        let ball9Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball9Toggled))
        ball9_toggle.addGestureRecognizer(ball9Tap)
        let ball10Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball10Toggled))
        ball10_toggle.addGestureRecognizer(ball10Tap)
        let ball11Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball11Toggled))
        ball11_toggle.addGestureRecognizer(ball11Tap)
        let ball12Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball12Toggled))
        ball12_toggle.addGestureRecognizer(ball12Tap)
        let ball13Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball13Toggled))
        ball13_toggle.addGestureRecognizer(ball13Tap)
        let ball14Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball14Toggled))
        ball14_toggle.addGestureRecognizer(ball14Tap)
        let ball15Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ball15Toggled))
        
        v_BallController.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ball15_toggle.addGestureRecognizer(ball15Tap)
        resetTable()
    }
    
    @objc func playerToggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        mode = mode == "three" ? "five" : "three"
        playerToggle.text = mode == "three" ? "3" : "5"
        resetTable()
    }
    
    @objc func select1Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        selectToggled(buttonID: 0, mode: mode)
    }
    
    @objc func select2Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        selectToggled(buttonID: 1, mode: mode)
    }
    @objc func select3Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        selectToggled(buttonID: 2, mode: mode)
    }
    @objc func select4Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        selectToggled(buttonID: 3, mode: mode)
    }
    @objc func select5Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        selectToggled(buttonID: 4, mode: mode)
    }
    
    //Ball Toggle Recognizers
    @objc func ball1Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[0] = !balls[0]
        ball1_toggle.textColor = balls[0] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball2Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[1] = !balls[1]
        ball2_toggle.textColor = balls[1] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball3Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[2] = !balls[2]
        ball3_toggle.textColor = balls[2] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball4Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[3] = !balls[3]
        ball4_toggle.textColor = balls[3] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball5Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[4] = !balls[4]
        ball5_toggle.textColor = balls[4] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball6Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[5] = !balls[5]
        ball6_toggle.textColor = balls[5] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball7Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[6] = !balls[6]
        ball7_toggle.textColor = balls[6] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball8Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[7] = !balls[7]
        ball8_toggle.textColor = balls[7] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball9Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[8] = !balls[8]
        ball9_toggle.textColor = balls[8] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball10Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[9] = !balls[9]
        ball10_toggle.textColor = balls[9] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball11Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[10] = !balls[10]
        ball11_toggle.textColor = balls[10] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball12Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[11] = !balls[11]
        ball12_toggle.textColor = balls[11] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball13Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[12] = !balls[12]
        ball13_toggle.textColor = balls[12] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball14Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[13] = !balls[13]
        ball14_toggle.textColor = balls[13] ? goldenrod() : insetRed()
        updateField()
    }
    @objc func ball15Toggled(sender:UITapGestureRecognizer){
        impact.impactOccurred()
        balls[14] = !balls[14]
        ball15_toggle.textColor = balls[14] ? goldenrod() : insetRed()
        updateField()
    }
    
    func selectToggled(buttonID: Int, mode: String){
        let upperLimit = mode == "three" ? 3 : 5
        while checkAvail(buttonID: buttonID) != true{
            if(pos[buttonID] > upperLimit){///Making sure the position stays within bounds
                pos[buttonID] = 0
            }
            //print(pos[buttonID])
        }
        switch buttonID {
            case 0:
                p1Select.text = mode == "three" ? threeQ[pos[buttonID]] : fiveQ[pos[buttonID]]
                setupTable(buttonID: buttonID, select: pos[buttonID])
            case 1:
                p2Select.text = mode == "three" ? threeQ[pos[buttonID]] : fiveQ[pos[buttonID]]
                setupTable(buttonID: buttonID, select: pos[buttonID])
            case 2:
                p3Select.text = mode == "three" ? threeQ[pos[buttonID]] : fiveQ[pos[buttonID]]
                setupTable(buttonID: buttonID, select: pos[buttonID])
            case 3:
                p4Select.text = mode == "three" ? threeQ[pos[buttonID]] : fiveQ[pos[buttonID]]
                setupTable(buttonID: buttonID, select: pos[buttonID])
            case 4:
                p5Select.text = mode == "three" ? threeQ[pos[buttonID]] : fiveQ[pos[buttonID]]
                setupTable(buttonID: buttonID, select: pos[buttonID])
            default:
                print("Oh no")
        }
        updateField()
        
    }
    
    func checkAvail(buttonID: Int) -> Bool{
        let upperLimit = mode == "three" ? 3 : 5
        pos[buttonID] = pos[buttonID] == upperLimit ? 0 : pos[buttonID] + 1//Making sure we can't go out of bounds
        for i in 0..<pos.count{
            if(i != buttonID){
                if(pos[buttonID] == pos[i] && pos[i] != 0){//It's okay if the value is 0 as that means nothing is selected, and don't check same player
                    return false //If any other's position matches
                }
            }
        }
        return true
    }
    
    func updateUI(){
        if(mode == "three"){
            //Selection Views
            selectSlot3.text = threeQ[1]
            selectSlot4.text = threeQ[2]
            selectSlot5.text = threeQ[3]
            //Select Toggles
            p1Select.text = threeQ[0]
            p2Select.text = threeQ[0]
            p3Select.text = threeQ[0]
        }
        else{
            //Selection Views
            selectSlot1.text = fiveQ[1]
            selectSlot2.text = fiveQ[2]
            selectSlot3.text = fiveQ[3]
            selectSlot4.text = fiveQ[4]
            selectSlot5.text = fiveQ[5]
            //Select Toggles
            p1Select.text = fiveQ[0]
            p2Select.text = fiveQ[0]
            p3Select.text = fiveQ[0]
            p4Select.text = fiveQ[0]
            p5Select.text = fiveQ[0]
        }
    }
    
    func resetTable(){
        P1_Name_Field.text = ""
        P2_Name_Field.text = ""
        P3_Name_Field.text = ""
        P4_Name_Field.text = ""
        P5_Name_Field.text = ""
        if(mode == "three"){
            //Players
            player1Table.showTableThree()
            player2Table.showTableThree()
            player3Table.showTableThree()
            player4Table.hideTable()
            P4_Name_Field.isHidden = true
            player5Table.hideTable()
            P5_Name_Field.isHidden = true
            
            //Selection Views
            selectSlot1.isHidden = true
            selectSlot2.isHidden = true
            selectSlot3.text = threeQ[1]
            selectSlot4.text = threeQ[2]
            selectSlot5.text = threeQ[3]
            //Select Toggles
            p1Select.text = threeQ[0]
            p2Select.text = threeQ[0]
            p3Select.text = threeQ[0]
            p4Select.isHidden = true
            p5Select.isHidden = true
            
            pos = [0, 0, 0, 0, 0]
        }
        else{
            //Players
            player1Table.showTableFive()
            player2Table.showTableFive()
            player3Table.showTableFive()
            player4Table.showTableFive()
            P4_Name_Field.isHidden = false
            player5Table.showTableFive()
            P5_Name_Field.isHidden = false
            
            //Selection Views
            selectSlot1.text = fiveQ[1]
            selectSlot1.isHidden = false
            selectSlot2.text = fiveQ[2]
            selectSlot2.isHidden = false
            selectSlot3.text = fiveQ[3]
            selectSlot4.text = fiveQ[4]
            selectSlot5.text = fiveQ[5]
            //Select Toggles
            p1Select.text = fiveQ[0]
            p2Select.text = fiveQ[0]
            p3Select.text = fiveQ[0]
            p4Select.text = fiveQ[0]
            p4Select.isHidden = false
            p5Select.text = fiveQ[0]
            p5Select.isHidden = false
            pos = [0, 0, 0, 0, 0]
        }
        resetBalls()
        resetScoreboard()
    }
    
    func resetBalls(){
        for b in 0...balls.count - 1{//Reset the balls
            balls[b] = true
        }
        ball1_toggle.textColor = goldenrod()
        ball2_toggle.textColor = goldenrod()
        ball3_toggle.textColor = goldenrod()
        ball4_toggle.textColor = goldenrod()
        ball5_toggle.textColor = goldenrod()
        ball6_toggle.textColor = goldenrod()
        ball7_toggle.textColor = goldenrod()
        ball8_toggle.textColor = goldenrod()
        ball9_toggle.textColor = goldenrod()
        ball10_toggle.textColor = goldenrod()
        ball11_toggle.textColor = goldenrod()
        ball12_toggle.textColor = goldenrod()
        ball13_toggle.textColor = goldenrod()
        ball14_toggle.textColor = goldenrod()
        ball15_toggle.textColor = goldenrod()
    }
    
    
    func setupTable(buttonID: Int, select: Int){
        switch(select){
            case 0:
                if(mode == "three"){
                    getTable(buttonID: buttonID).showTableThree()
                }
                else{
                    getTable(buttonID: buttonID).showTableFive()
                    
            }
            case 1:
                if(mode == "three"){
                    getTable(buttonID: buttonID).lows()
                }
                else{
                    getTable(buttonID: buttonID).lowestLows()
                    
                }
            case 2:
                if(mode == "three"){
                    getTable(buttonID: buttonID).mids()
                }
                else{
                    getTable(buttonID: buttonID).higherLows()
                    
                }
            case 3:
                if(mode == "three"){
                    getTable(buttonID: buttonID).highs()
                }
                else{
                    getTable(buttonID: buttonID).middestMids()
                    
                }
            case 4:
                    getTable(buttonID: buttonID).lowestHighs()
            case 5:
                    getTable(buttonID: buttonID).highestHighs()
            default:
                if(mode == "three"){
                    getTable(buttonID: buttonID).showTableThree()
                }
                else{
                    getTable(buttonID: buttonID).showTableFive()
            }
        }
        updateScoreBoard()
    }
        
        func getTable(buttonID: Int) -> PlayerTable{
            switch buttonID {
            case 0:
                return player1Table
            case 1:
                return player2Table
            case 2:
                return player3Table
            case 3:
                return player4Table
            case 4:
                return player5Table
            default:
                print("oof")
                return player1Table
            }
        }
    
    func updateScoreBoard(){
        var avail = [true, true, true, true, true]
        for i in 0..<pos.count{
            if(pos[i] == 1){
                if(mode == "three"){
                    avail[2] = false
                }
                else{
                    avail[0] = false
                }
            }
            if(pos[i] == 2){
                if(mode == "three"){
                    avail[3] = false
                }
                else{
                    avail[1] = false
                }
            }
            if(pos[i] == 3){
                if(mode == "three"){
                    avail[4] = false
                }
                else{
                    avail[2] = false
                }
            }
            if(pos[i] == 4){
                avail[3] = false
            }
            if(pos[i] == 5){
                avail[4] = false
            }
        }
        if(mode == "three"){
            selectSlot3.textColor = avail[2] ? UIColor.white : insetRed()
            selectSlot4.textColor = avail[3] ? UIColor.white : insetRed()
            selectSlot5.textColor = avail[4] ? UIColor.white : insetRed()
        }
        else{
            selectSlot1.textColor = avail[0] ? UIColor.white : insetRed()
            selectSlot2.textColor = avail[1] ? UIColor.white : insetRed()
            selectSlot3.textColor = avail[2] ? UIColor.white : insetRed()
            selectSlot4.textColor = avail[3] ? UIColor.white : insetRed()
            selectSlot5.textColor = avail[4] ? UIColor.white : insetRed()
        }
    }
    
    func resetScoreboard(){
        selectSlot1.textColor = UIColor.white
        selectSlot2.textColor = UIColor.white
        selectSlot3.textColor = UIColor.white
        selectSlot4.textColor = UIColor.white
        selectSlot5.textColor = UIColor.white
    }
    
    func updateField(){
        for i in 0...pos.count - 1{
            getTable(buttonID: i).updateTable(ballStates: getballGroup(select: pos[i]))
        }
    }
    
    func getballGroup(select: Int) -> [Bool]{
        var ballGroup: [Bool]
        switch(select){
        case 0:
            ballGroup = [true, true, true, true, true]
        case 1:
            if(mode == "three"){
                ballGroup = [balls[0], balls[1], balls[2], balls[3], balls[4]]
            }
            else{
                ballGroup = [balls[0], balls[1], balls[2], false, false]
            }
        case 2:
            if(mode == "three"){
                ballGroup = [balls[5], balls[6], balls[7], balls[8], balls[9]]
            }
            else{
                ballGroup = [balls[3], balls[4], balls[5], false, false]
            }
        case 3:
            if(mode == "three"){
                ballGroup = [balls[10], balls[11], balls[12], balls[13], balls[14]]
            }
            else{
                ballGroup = [balls[6], balls[7], balls[8], false, false]
            }
        case 4:
            ballGroup = [balls[9], balls[10], balls[11], false, false]
        case 5:
            ballGroup = [balls[12], balls[13], balls[14], false, false]
        default:
            ballGroup = [true, true, true, true, true]
        }
            
            return ballGroup
    }
    
    //Keyboard Stuff
    
    //Mark: textField Stuff
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        activeField = nil
//    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let distanceToBottom = self.scrollView.frame.size.height - (activeField.frame.origin.y) - (activeField.frame.size.height)
            let collapseSpace = keyboardSize.height - distanceToBottom
            if collapseSpace < 0 {
                // no collapse
                return
            }
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
//        if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
//            [self.scrollView scrollRectToVisible:activeField.frame animated:YES];
//        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
            self.view.frame.origin.y = 0//Have to reset or the view will act weird
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterNotifications()
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
//    @objc func keyboardWillShow(notification: NSNotification){
//        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//        scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification){
//        scrollView.contentInset.bottom = 0
//    }
    
    
    func goldenrod() -> UIColor{
        return UIColor.init(red: 248 / 255, green: 185 / 255, blue: 28 / 255, alpha: 1.0)    }
    
    func insetRed() -> UIColor{
        return UIColor.init(red: 64 / 255, green: 6 / 255, blue: 11 / 255, alpha: 1.0)    }
}

