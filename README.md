# RiotKit

![Build Status](https://git.hexplo.it/RiotKit/RiotKit/badges/develop/build.svg) [![coverage report](https://git.hexplo.it/RiotKit/RiotKit/badges/develop/coverage.svg)](https://git.hexplo.it/RiotKit/RiotKit/commits/develop)

RiotKit is a Swift framework written to server as a wrapper around the Riot Games API.
The API provides access into many of the League of Legends stats/game information including player details and match history.

## Tasklist 

- [ ] Champions
- [ ] Summoner
- [ ] Champion Mastery
- [ ] Matches
- [ ] Match Data
- [ ] API Status
- [ ] Callbacks/Protocol for parent apps
- [ ] Ranks/Leagues


For example, champion data is now pulled, and populated into an array of [Champion](RiotKit/RiotKit/Champion.swift) structs:-


![Champion Struct Example](Screenshots/ChampionStruct.png)

```
(lldb) po champRequest?.champions[67]
▿ Optional<Champion>
  ▿ some : Champion
    - id : 67
    - name : "Vayne"
    - active : true
    - botEnabled : false
    - botMMEnabled : true
    - freeEnabled : false
    - rankedEnabled : true
    ▿ icon : Optional<UIImage>
```
