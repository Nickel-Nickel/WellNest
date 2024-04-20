//
//  RedOneView.swift
//  WellNest
//
//  Created by Brandon Struble on 4/17/24.
//

import SwiftUI

struct Quote: Codable {
    let text: String
    let author: String
    
    var quoteAuthor: String {
            let components = author.components(separatedBy: ",")
            if let firstComponent = components.first {
                return firstComponent
            } else {
                return author
            }
        }
}

class QuoteViewModel: ObservableObject {
    @Published var quote: Quote?
    
    func fetchQuote() {
        guard let url = URL(string: "https://type.fit/api/quotes") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching quote: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let fetchedQuotes = try JSONDecoder().decode([Quote].self, from: data)
                if let randomQuote = fetchedQuotes.randomElement() {
                    DispatchQueue.main.async {
                        self.quote = randomQuote
                    }
                }
            } catch {
                print("Error decoding quote: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct HomeView: View{
    @ObservedObject var viewModel = QuoteViewModel()
    /* its a common convention to use 'body'
     to represent our current view */
    
    /*body  will return some type that conform to the view
     protocol but it not specifying an exact type. This allows
     us to return different kinds of views without knowing their
     exact type */
    var body: some View{
        //PLACE HOLDER
        /*ZStack is a SwiftUI container view
         that stacks its contents on top of each other.
         In this case, it stacks a Circle and a Text view.*/
        VStack {
                if let quote = viewModel.quote {
                    Text(quote.text)
                        .font(.headline)
                    Text("- \(quote.quoteAuthor)")
                        .font(.subheadline)
                } else {
                    ProgressView()
                }
            }
            .onAppear {
                viewModel.fetchQuote()
            }
        
    }
    
}


