import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(
        width: Constants.General.roundedViewLength,
        height: Constants.General.roundedViewLength
      )
      .overlay(
        Circle()
          .strokeBorder(
            Color("ButtonStrokeColor"),
            lineWidth: Constants.General.strokeWidth
          )
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(
        width: Constants.General.roundedViewLength,
        height: Constants.General.roundedViewLength
      )
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundedRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .font(.title3)
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .frame(
        width: Constants.General.roundRectViewWidth,
        height: Constants.General.roundRectViewHeight
      )
      .overlay(
        RoundedRectangle(
          cornerRadius: Constants.General.roundRectCornerRadius
        )
        .strokeBorder(
          Color("ButtonStrokeColor"),
          lineWidth: Constants.General.strokeWidth
        )
      )
  }
}

struct RoundedTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .font(.title3)
      .foregroundColor(Color("TextColor"))
      .frame(
        width: Constants.General.roundedViewLength,
        height: Constants.General.roundedViewLength
      )
      .overlay(
        Circle()
          .strokeBorder(
            Color("LeaderboardRowColor"),
            lineWidth: Constants.General.strokeWidth
          )
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewStroked(systemName: "list.dash")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundedRectTextView(text: "999")
      RoundedTextView(text: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
      .preferredColorScheme(.light)
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
