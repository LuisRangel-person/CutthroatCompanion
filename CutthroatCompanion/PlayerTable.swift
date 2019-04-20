//
//  PlayerTable.swift
//  CutthroatCompanion
//
//  Created by Luis Rangel on 2/20/19.
//  Copyright © 2019 Luis Rangel. All rights reserved.
//

import UIKit

class PlayerTable: UIStackView {
    
    let fontSize : CGFloat = 30.0
    let cellHeight : CGFloat = 45.0
    let cellWidth : CGFloat = 45.0
    let impact = UIImpactFeedbackGenerator()
    let ball1 = UILabel()
    let ball2 = UILabel()
    let ball3 = UILabel()
    let ball4 = UILabel()
    let ball5 = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupLabels()
    }
    
    public func clearTable(){
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
    
    //For Three Person Games
    
    public func lows(){
        groupOfFive(first: "1", second: "2", third: "3", fourth: "4", fifth: "5")
    }
    
    public func mids(){
        groupOfFive(first: "6", second: "7", third: "8", fourth: "9", fifth: "10")
    }
    
    public func highs(){
        groupOfFive(first: "11", second: "12", third: "13", fourth: "14", fifth: "15")
    }
    //For Five Person Games
    public func lowestLows(){
        groupOfThree(first: "1", second: "2", third: "3")
    }
    public func higherLows(){
        groupOfThree(first: "4", second: "5", third: "6")
    }
    public func middestMids(){
        groupOfThree(first: "7", second: "8", third: "9")
    }
    public func lowestHighs(){
        groupOfThree(first: "10", second: "11", third: "12")
    }
    public func highestHighs(){
        groupOfThree(first: "13", second: "14", third: "15")
    }
    
    
    public func hideTable(){
        ball1.text = ""
        ball1.isUserInteractionEnabled = false
        ball2.text = ""
        ball2.isUserInteractionEnabled = false
        ball3.text = ""
        ball3.isUserInteractionEnabled = false
        ball4.text = ""
        ball5.isUserInteractionEnabled = false
        ball5.text = ""
    }
    
    public func updateTable(ballStates: [Bool]){
        ball1.textColor = ballStates[0] ? UIColor.white : insetGreen()
        ball2.textColor = ballStates[1] ? UIColor.white : insetGreen()
        ball3.textColor = ballStates[2] ? UIColor.white : insetGreen()
        ball4.textColor = ballStates[3] ? UIColor.white : insetGreen()
        ball5.textColor = ballStates[4] ? UIColor.white : insetGreen()
    }
    
    public func showTableThree(){
        groupOfFive(first: "-", second: "-", third: "-", fourth: "-", fifth: "-")
    }
    public func showTableFive(){
        groupOfThree(first: "-", second: "-", third: "-")
    }
    
    private func groupOfThree(first: String, second: String, third: String){
        ball1.text = first
        ball1.textColor = UIColor.white
        ball2.text = second
        ball2.textColor = UIColor.white
        ball3.text = third
        ball3.textColor = UIColor.white
        ball4.text = ""
        ball5.text = ""
    }
    
    private func groupOfFive(first: String, second: String, third: String, fourth: String, fifth: String){
        ball1.text = first
        ball1.textColor = UIColor.white
        ball2.text = second
        ball2.textColor = UIColor.white
        ball3.text = third
        ball3.textColor = UIColor.white
        ball4.text = fourth
        ball4.textColor = UIColor.white
        ball5.text = fifth
        ball5.textColor = UIColor.white
    }
    
    private func setupLabels(){
        //First Ball
        ball1.text = "-"
        ball1.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize)
        ball1.textColor = UIColor.white
        ball1.translatesAutoresizingMaskIntoConstraints = false
        ball1.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        ball1.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        addArrangedSubview(ball1)
        //Ball
        
        ball2.text = "-"
        ball2.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize)
        ball2.textColor = UIColor.white
        ball2.translatesAutoresizingMaskIntoConstraints = false
        ball2.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        ball2.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        addArrangedSubview(ball2)
        //Ball
        
        ball3.text = "-"
        ball3.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize)
        ball3.textColor = UIColor.white
        ball3.translatesAutoresizingMaskIntoConstraints = false
        ball3.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        ball3.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        addArrangedSubview(ball3)
        //Ball
        
        ball4.text = "-"
        ball4.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize)
        ball4.textColor = UIColor.white
        ball4.translatesAutoresizingMaskIntoConstraints = false
        ball4.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        ball4.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        addArrangedSubview(ball4)
        //Ball
        
        ball5.text = "-"
        ball5.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize)
        ball5.textColor = UIColor.white
        ball5.translatesAutoresizingMaskIntoConstraints = false
        ball5.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        ball5.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        addArrangedSubview(ball5)
    }
    
    func goldenrod() -> UIColor{
        return UIColor.init(red: 248 / 255, green: 185 / 255, blue: 28 / 255, alpha: 1.0)    }
    
    func insetGreen() -> UIColor{
        return UIColor.init(red: 21 / 255, green: 39 / 255, blue: 16 / 255, alpha: 1.0)    }
}
