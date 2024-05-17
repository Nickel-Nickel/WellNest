import SwiftUI

struct MoodLogView: View {
    @Environment(\.presentationMode) var presentationMode
    var moodLog: [MoodData]

    var body: some View {
        NavigationView {
            VStack {
                Text("Recent Moods")
                    .font(.largeTitle)
                    .padding(.top)
                
                ScrollView {
                    ForEach(moodLog) { moodData in
                        HStack {
                            Image("icon_\(moodData.mood)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 40) // Adjust size as needed
                                .padding(.vertical,-4)
                            Spacer()
                            Text("\(moodData.date, formatter: dateFormatter)")
                            Spacer()
                            Text("\(moodData.time, formatter: timeFormatter)")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline) // Hide the default title
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .font(.title)
                    .foregroundColor(Color(uiColor: .blue))
                    .padding()
            })
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
}

struct MoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        MoodLogView(moodLog: [
            MoodData(mood: "happy", time: Date(), date: Date()),
            MoodData(mood: "sad", time: Date(), date: Date()),
            MoodData(mood: "neutral", time: Date(), date: Date())
        ])
    }
}
