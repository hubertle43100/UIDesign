//
//  ErrorView.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 3/21/22.
//

import SwiftUI

struct ErrorView: View {
    //inject error in view
    internal init(error: Error,
                  handler: @escaping ErrorView.ErrorViewActionHandler) {
                    //^ to use handler outside of the scope we use @escaping
        self.error = error
        self.handler = handler
    }
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
            Text("Ooopss")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            Button {
                //trigger a closure to do something
                handler()
            } label: {
                Text("Retry")
            }.padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.system(size: 15,weight: .heavy))
                .cornerRadius(10)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.DecodingError) {} //throw back a completion handler after pressing the "retry" button
    }
}
