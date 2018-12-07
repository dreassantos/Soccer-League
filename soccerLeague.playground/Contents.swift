/*
 Athor: Andrea Santos
 Project: Unit one project
 Last updtead 12/07/2018
 Project Desctiption: "You have volunteered to be the coordinator for your town’s youth soccer league. As part of your job you need to divide the 18 children who have signed up for the league into three even teams — Dragons, Sharks, and Raptors. In years past, the teams have been unevenly matched, so this year you are doing your best to fix that." - treehouse. Sort into 3 teams that are equal in experience then print letters for each player.
 */

var experiencedPlayers:[[String:String]] = []
var inexperiencedPlayers:[[String:String]] = []
var teamDragon:[[String:String]] = []
var teamShark:[[String:String]] = []
var teamRaptor:[[String:String]] = []
var theLeague = [teamDragon,teamShark,teamRaptor]

//saved players in a immutable collection
let players:[[String : String]] = [[   "name" : "Joe Smith",
                                       "height" : "42",
                                       "experience" : "true",
                                       "gardians" : "Jim and Jan Smith"],
                                   [   "name" : "Jill Tanner",
                                       "height" : "36",
                                       "experience" : "true",
                                       "gardians" : "Clara Tanner"],
                                   [   "name" : "Bill Bon",
                                       "height" : "43",
                                       "experience" : "true",
                                       "gardians" : "Sara and Jenny Bon"],
                                   [   "name" : "Eva Gordon",
                                       "height" : "45",
                                       "experience" : "false",
                                       "gardians" : "Wendy and Mike Gordon"],
                                   [   "name" : "Matt Gill",
                                       "height" : "40",
                                       "experience" : "false",
                                       "gardians" : "Charles and Sylvia Gill"],
                                   [   "name" : "Kimmy Stein",
                                       "height" : "41",
                                       "experience" : "false",
                                       "gardians" : "Bill and Hillary Stein"],
                                   [   "name" : "Sammy Adams",
                                       "height" : "45",
                                       "experience" : "false",
                                       "gardians" : "Jeff Adams"],
                                   [   "name" : "Karl Saygan",
                                       "height" : "42",
                                       "experience" : "true",
                                       "gardians" : "Heather Bledsoe"],
                                   [   "name" : "Suzane Greenberg",
                                       "height" : "44",
                                       "experience" : "true",
                                       "gardians" : "Henrietta Dumas"],
                                   [   "name" : "Sal Dali",
                                       "height" : "41",
                                       "experience" : "false",
                                       "gardians" : "Gala Dali"],
                                   [   "name" : "Joe Kavalier",
                                       "height" : "39",
                                       "experience" : "false",
                                       "gardians" : "Sam and Elaine Kavalier"],
                                   [   "name" : "Ben Finkelstein",
                                       "height" : "44",
                                       "experience" : "false",
                                       "gardians" : "Aaron and Jill Finkelstein"],
                                   [   "name" : "Diego Soto",
                                       "height" : "41",
                                       "experience" : "true",
                                       "gardians" : "Robin and Sarika Soto"],
                                   [   "name" : "Chloe Alaska",
                                       "height" : "47",
                                       "experience" : "false",
                                       "gardians" : "David and Jamie Alaska"],
                                   [   "name" : "Arnold Willis",
                                       "height" : "43",
                                       "experience" : "false",
                                       "gardians" : "Claire Willis"],
                                   [   "name" : "Phillip Helm",
                                       "height" : "44",
                                       "experience" : "true",
                                       "gardians" : "Thomas Helm and Eva Jones"],
                                   [   "name" : "Les Clay",
                                       "height" : "42",
                                       "experience" : "true",
                                       "gardians" : "Wynonna Brown"],
                                   [   "name" : "Herschel Krustofski",
                                       "height" : "45",
                                       "experience" : "true",
                                       "gardians" : "Hyman and Rachel Krustofski"]]

//seperating all of the players by experience
for player in players{
    if player["experience"] == "true"{
        experiencedPlayers.append(player)
    }else{
        inexperiencedPlayers.append(player)
    }
}


// function to organize both dictionaries by player height Source PG 322 in Swift book provided
// Using a force unwraping because I know the specific values im providing wont trigger a responese of nil. www.hackingwithswift.com/articles/136/the-complete-guide-to-optionals-in-swift this is a good article!
func sortPlayers(dictionary: [[String:String]], heightOrder: Character) -> [[String:String]]{ //character used to make check what order the height should be arranged.
    let sortedDictionary = dictionary.sorted{(player1: [String : String], player2: [String : String]) -> Bool in
        let p1Height = (Double(player1["height"]!)!) //convert the height to a double. cant do math with strings
        let p2Height = (Double(player2["height"]!)!)
        if heightOrder == ">" {
            return p1Height > p2Height  // sorts the dictionary with the tallest people first
        }else{
            return p1Height < p2Height // sorts the dictionary with the shortest people first.
        }
    }
    return sortedDictionary //retruns the sorted dictionary
}
let sortedExPlayer = sortPlayers(dictionary: experiencedPlayers , heightOrder: ">") //saved sorted Exp/Inexp player into their own collections
let sortedInexPlayer = sortPlayers(dictionary: inexperiencedPlayers, heightOrder: "<")


//function to assign players of each experience type into the 3 groups.
func teamAssignment(playerGroup: [[String:String]]){
    for player in playerGroup{ //this will sort players by adding the player to the smallest team. It will accept all the players given.
        if teamDragon.count <= teamShark.count && teamDragon.count <= teamRaptor.count{
            teamDragon.append(player)
        }
        else if teamShark.count <= teamRaptor.count{
            teamShark.append(player)
        }
        else{
            teamRaptor.append(player)
        }
    }
}
teamAssignment(playerGroup: sortedExPlayer)
teamAssignment(playerGroup: sortedInexPlayer)

//saving the teams to the league.
theLeague = [teamDragon, teamShark, teamRaptor]

//variables for sending letters
var letters: [String] = []
var meetingDate = ""
var teamName = ""
var teamIndex = 0

//loop through each team in the league
for team in theLeague{
    switch teamIndex{
    case 0:
        teamName = "Dragons"
        meetingDate = "March 17, 1pm"
    case 1:
        teamName = "Sharks"
        meetingDate = "March 17, 3pm"
    case 2:
        teamName = "Raptors"
        meetingDate = "March 18, 1pm"
    default: print("Team information not found")
    }
    //creating a message for each player through interpolation.
    for player in team{
        let letter = ("Congratulations \(player["gardians"]!),\nyour child \(player["name"]!) has been accepted into team \(teamName).\nYour childs team will be meeting on \(meetingDate). Welcome to the league!\n")
        print(letter)
        letters.append(letter)
    }
    teamIndex += 1
}

//function to check the average height of the teams.
func checkAverageHeight(of team: [[String: String]]) -> Double {
    var totalHeight = 0.0
    for player in team {
        let playerHeight = Double(player["height"]!)!
        totalHeight += playerHeight// add all player heights together
    }
    let averageHeight = totalHeight / Double(team.count) //needed the teams length as a double b/c you cant divide double by an integer.
    return averageHeight
}
print("The average height of team Dragon is: \(checkAverageHeight(of: teamDragon)) inches\n")
print("The average height of team Shark  is: \(checkAverageHeight(of: teamShark)) inches\n")
print("The average height of team Raptor is: \(checkAverageHeight(of: teamRaptor)) inches\n")

