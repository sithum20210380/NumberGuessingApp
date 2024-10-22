//
//  Guess.swift
//  LabPractical
//
//  Created by Sithum Raveesha on 2024-10-09.
//

import SwiftUI

struct Guess: View {
    @AppStorage("points") private var points = 0
    @AppStorage("fontSize") private var fontSize: Double = 16
    @AppStorage("systemColor") private var systemColor = "indigo"
    
    @ObservedObject var viewModel: AppViewModel
    
    @State private var firstOperand = 0
    @State private var secondOperand = 0
    @State private var operation: MathOperation = .addition
    @State private var userAnswer = ""
    @State private var message = ""
    @State private var isSubmitDisabled = false
    
    var body: some View {
        VStack {
            Text("Guess the answer!")
                .font(.system(size: viewModel.fontSize))
                .foregroundColor(Color(viewModel.systemColor.rawValue))
            
            HStack {
                Text("What is \(firstOperand) \(operation.rawValue) \(secondOperand) ?")
                    .font(.title)
            }
            
            HStack {
                TextField("Enter your answer", text: $userAnswer)
                    .padding()
                
                Button("Submit") {
                    checkAnswer()
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                .padding(.trailing,20)
                .disabled(isSubmitDisabled)
            }
            .border(.black)
            
            Text(message)
                .font(.system(size: CGFloat(fontSize)))
            
            Text("\(points)")
                .font(.system(size: 90))
            
            Text("Instructions")
            Text("Submit the correct answer and gain 1 point, Submit a wrong answer or press on 'NEXT' and you will lose 1 point.")
                .multilineTextAlignment(.center)
                
            
            Button("Next") {
                generateNewQuestion()
            }
            .buttonStyle(.bordered)
            .tint(.green)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .onAppear {
            generateNewQuestion()
        }
    }
    
    private func generateNewQuestion() {
        firstOperand = Int.random(in: 0...9)
        secondOperand = Int.random(in: 0...9)
        operation = MathOperation.allCases.randomElement()!
        userAnswer = ""
        message = ""
        isSubmitDisabled = false
    }
    
    private func checkAnswer() {
        guard let answer = Int(userAnswer) else { return }
        
        firstOperand = Int.random(in: 0...9)
        secondOperand = Int.random(in: 0...9)
        operation = MathOperation.allCases.randomElement()!
        userAnswer = ""
        message = ""
        isSubmitDisabled = false
        
        let correctAnswer: Int
        switch operation {
        case .addition:
            correctAnswer = firstOperand + secondOperand
        case .subtraction:
            correctAnswer = firstOperand - secondOperand
        case .multiplication:
            correctAnswer = firstOperand * secondOperand
        case .division:
            correctAnswer = firstOperand / secondOperand
        }
        
        if answer == correctAnswer {
            points += 1
            message = "CORRECT ANSWER! WELL DONE!"
        } else {
            if points > 0 {
                points -= 1
            }
            message = "Incorrect answer! The correct answer is \(correctAnswer)."
        }
        
        isSubmitDisabled = true
    }
}

enum MathOperation: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
}

#Preview {
    Guess(viewModel: AppViewModel())
}
