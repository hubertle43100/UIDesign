//
//  UserInputGoalView.swift
//  Seven
//
//  Created by Hubert Le on 9/11/23.
//

import SwiftUI
import OpenAI

struct UserInputGoalView: View {
    @State private var promptText: String = ""
    @State private var generatedText: String = ""
    @State private var message: String = ""
    @Binding var messageTemp: String
    @Binding var storedTexts: [String]
    @Binding var isScrollViewVisible: Bool
    @State private var offset: CGFloat = 0
    
    @State private var isLoading = false
    
    @Binding var isFullScreenPresented: Bool
    
    typealias StoredTextsCallback = ([String],String) -> Void
    var onDismiss: StoredTextsCallback?
    private let openAI = OpenAI(apiToken: "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")
    
    var body: some View {
        VStack {
            Text("Create goals")
                .font(.system(size: 30, weight: .semibold, design: .default))
                .padding()
            Text("Presets")
                .font(.system(size: 20, weight: .semibold, design: .default))
                .padding(.top, 20)
            VStack(spacing: 20) {
                BoxTextView(iconName: "scalemass", text: "Lose weight and maintain a healthy lifestyle.", message: $message)
                BoxTextView(iconName: "dollarsign.circle", text: "Save money and build a strong financial foundation", message: $message)
                BoxTextView(iconName: "heart.circle", text: "Prioritize self-care and nurture emotional well-being.", message: $message)
            }
            .frame(maxWidth: .infinity)
            .padding()
            HStack {
                TextField("Type your message...", text: $message)
                    .padding()
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                            self.moveView(up: true, keyboardHeight: keyboardFrame.height)
                        }
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                        self.moveView(up: false)
                    }
                    .onTapGesture {
                        // Dismiss the keyboard when tapping outside of the text field
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.trailing)
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
        }
    }
    private func sendMessage() {
        isLoading = true
        // Fetch generated text
        fetchGeneratedText()
        
        messageTemp = message
        
        // Clear the message
        message = ""
        
        isScrollViewVisible = true
        
    }
    func fetchGeneratedText() {
        let query = CompletionsQuery(model: .textDavinci_003, prompt: "Generate specific goals for 7 days for this goal and one sentence for each day for this goal and make it a bit difficult: \(message)", temperature: 0, maxTokens: 200, topP: 1, frequencyPenalty: 0, presencePenalty: 0, stop: ["\\n"])
        openAI.completions(query: query) { result in
            switch result {
            case .success(let completionResponse):
                if let generatedChoice = completionResponse.choices.first {
                    generatedText = generatedChoice.text
                    let modifiedText = generatedText.replacingOccurrences(of: "\n\n", with: "")
                    let daysArray = modifiedText.components(separatedBy: "Day ")
                    let trimmedArray = daysArray.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    storedTexts.append(contentsOf: trimmedArray)
                    print("Choosing goals: \(storedTexts)")
                    storedTexts.removeFirst()
                    saveGeneratedTexts()
                    isLoading = false
                } else {
                    generatedText = "No generated text found."
                }
            case .failure(let error):
                generatedText = "Error: \(error.localizedDescription)"
            }
        }
    }
    func saveGeneratedTexts() {
        // You can use UserDefaults, Core Data, or any other storage mechanism here
        // For simplicity, let's use UserDefaults as an example:
        UserDefaults.standard.set(messageTemp, forKey: "messageTemp")
        UserDefaults.standard.set(storedTexts, forKey: "generatedTexts")
    }
    private func moveView(up: Bool, keyboardHeight: CGFloat = 0) {
        if up {
            self.offset = keyboardHeight * 0.9 // Adjust the offset as needed
        } else {
            self.offset = 0
        }
    }
}

struct BoxTextView: View {
    var iconName: String
    var text: String
    @Binding var message: String
    
    var body: some View {
        Button(action: {
            message = text
        }) {
            ZStack {
                Color(UIColor.systemGray5)
                    .cornerRadius(10)
                
                HStack {
                    Image(systemName: iconName)
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding(.leading, 30)
                        .padding(.trailing, 10)
                    
                    Text(text)
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 10)
                    Spacer()
                }
            }
            .frame(height: 80)
        }
    }
}
