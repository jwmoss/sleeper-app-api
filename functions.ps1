function Get-SLLeague ($LeagueID) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID"
}

function Get-SLLeagueRosters ($LeagueID) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID/rosters"
}

function Get-SLLeagueUsers ($LeagueID) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID/users"
}

function Get-SLLeagueUser ($UserID) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/user/$userid"
} 

function Get-SLLeagueMatchups ($LeagueID, $Week) {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/league/$leagueID/matchups/$week"
}

function Get-SLNFLState {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/state/nfl"
}

function Get-SLPlayers {
    Invoke-RestMethod -Uri "https://api.sleeper.app/v1/players/nfl"
}

function Get-SLScoreBoard ($LeagueID) {

}

function Get-SLHighScore ($LeagueID) {

}

function Get-SLLowScore ($LeagueID) {

}

function Get-SLTrending {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Hashtable]
        $playerLookup
    )

    $add = Invoke-RestMethod -Uri "https://api.sleeper.app/v1/players/nfl/trending/add?lookback_hours=48"
    $drop = Invoke-RestMethod -Uri "https://api.sleeper.app/v1/players/nfl/trending/drop?lookback_hours=48"
    foreach ($u in $add) {
        [PSCustomObject]@{
            ID = $u.player_id
            Name = $playerLookup[$u.player_id].full_name
            Count = $u.count 
            Type = "Add"
        }
    }
    foreach ($u in $drop) {
        [PSCustomObject]@{
            ID = $u.player_id
            Name = $playerLookup[$u.player_id].full_name
            Count = $u.count 
            Type = "Drop"
        }
    }
}