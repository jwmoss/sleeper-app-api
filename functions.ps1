function Get-SLLeague ($LeagueID) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID"
}

function Get-SLLeagueRosters ($LeagueID) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID/rosters"
}

function Get-SLLeagueUsers ($LeagueID) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID/users"
}

function Get-SLLeagueMatchups ($LeagueID,$Week) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID/matchups/$week"
}

function Get-SLNFLState {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/state/nfl"
}

function Get-SLPlayers {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/players/nfl"
}