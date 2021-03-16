//
//  Assignment1.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-10.
//

import Foundation

/// 5. evaluate
/// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
/// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
/// - You can use a helper function. (Do not change the original function header)
/// - Use Recursion
/// evaluate("7")                 -> 7
/// evaluate("(2+2)")             -> 4
/// evaluate("(1+(2*4))")         -> 9
/// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluate(_ expr: String) -> Int {
  var i = 0
  return evaluateHelper(expr, &i)
}

func evaluateHelper(_ expr: String, _ i: inout Int) -> Int {
  if Character(expr[i]).isNumber {
    return Int(expr[i])!
  } else {
    i += 1  // skip (
    let left = evaluateHelper(expr, &i) // expr or num
    i += 1
    let op = expr[i]  // operator (+, *)
    i += 1
    let right = evaluateHelper(expr, &i) // expr or num
    i += 1 // skip )
    if op == "+" {
      return left + right
    } else {
      return left * right
    }
  }
}
