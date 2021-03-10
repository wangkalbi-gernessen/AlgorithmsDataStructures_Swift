//
//  Assignment1.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-10.
//

import Foundation

// 5. evaluate

func evaluate(_ formula: String) -> Int {
    if !formula.contains("+") && !formula.contains("-") && !formula.contains("*") && !formula.contains("/") {
        return Int(formula)!
    }
    return evaluateHelper(formula)
}

func evaluateHelper(_ formula: String) -> Int {
    
    let reversedFormula:String = String(formula.reversed())
    
    var i: Int
    
    for index in 0...reversedFormula.count {
        let index = reversedFormula.index(reversedFormula.startIndex, offsetBy: index)
        if reversedFormula[index] == "+" || reversedFormula[index] == "-" {
            break
        } else if reversedFormula[index] == "*" || reversedFormula[index] == "/" {
            break
        }
    }
    
    let leftSubString = formula.dropFirst(i)
    let left = String(leftSubString)
    
    
    
    switch
    
    
    
    return 5
}


