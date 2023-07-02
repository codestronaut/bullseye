import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      updateLeaderboard(points: 100)
      updateLeaderboard(points: 200)
      updateLeaderboard(points: 300)
      updateLeaderboard(points: 400)
      updateLeaderboard(points: 500)
    }
  }
  
  /// Used for calculating the rewarded points with some conditions:
  /// - Give the user 100 bonus points when they get a perfect score (200 points rewarded).
  /// - Give the user 50 bonus points when the are 1 or 2 off (98 points will get extra 50 points, 148 points rewarded).
  /// - Otherwise, give the user the exact points.
  ///
  /// - Parameter sliderValue: slider value guess by user
  /// - Returns: return the calculated awarded points
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    var bonus: Int
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    
    return 100 - difference + bonus
  }
  
  
  /// Used for starting new game round and increment the current score
  /// This method is a mutating func which indicate that this method will change the struct's values
  /// - Parameter points: awarded points in the current round
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    updateLeaderboard(points: points)
    target = Int.random(in: 1...100)
  }
  
  
  /// User for record the game leaderboard that display awarded points and dates sorted by the points
  /// - Parameter points: awarded points the the current round
  mutating func updateLeaderboard(points: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
    leaderboardEntries = leaderboardEntries.sorted { entry1, entry2 in
      entry1.score > entry2.score
    }
  }
  
  /// Used for reset the game
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
}

struct LeaderboardEntry {
  let score: Int
  let date: Date
}
