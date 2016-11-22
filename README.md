# RiotKit

[![Build Status](https://travis-ci.org/RiotKit/RiotKit.svg?branch=master)](https://travis-ci.org/RiotKit/RiotKit)
[![codecov.io](https://codecov.io/gh/RiotKit/RiotKit/branch/master/graphs/badge.svg)](https://codecov.io/gh/RiotKit/RiotKit/branch/master)
[![MIT licensed](https://img.shields.io/badge/license-MIT-FF0000.svg?style=flat)](https://github.com/RiotKit/RiotKit/blob/master/LICENSE)
[![GitHub version](https://badge.fury.io/gh/RiotKit%2FRiotKit.svg?style=flat)](https://badge.fury.io/gh/RiotKit%2FRiotKit)
[![Documentation](http://docstatus.riotkit.xyz/)](https://riotkit.github.io/RiotKit/)
[![Twitter](https://img.shields.io/badge/twitter-@Hexploitable-0099FF.svg?style=flat)](http://twitter.com/Hexploitable)
[![Discord][discord-badge]][discord]

RiotKit is a Swift framework written to serve as a wrapper around the Riot Games API.
The API provides access into many of the League of Legends stats/game information including player details and match history.


There is still a ton of work to do, even just creating the models. Some progress has been made, for example - champion data is now pulled, and populated into  [Champion](RiotKit/RiotKit/Champion.swift) structs:-


![Champion Struct Example](Screenshots/ChampionStruct.png)

```
(lldb) po ChampionRequest.champions[67]
▿ Optional<Champion>
  ▿ some : Champion
    - id : 67
    - name : "Vayne"
    - active : true
    - botEnabled : false
    - botMMEnabled : true
    - freeEnabled : false
    - rankedEnabled : true
    - icon : nil
    ▿ championData : Optional<ChampionData>
      ▿ some : ChampionData
        ▿ allytips : 3 elements
          - 0 : "Tumble has many uses, but it cannot pass over walls."
          - 1 : "Condemn can be used to both pin targets to walls to ensure a kill, or to escape a pursuer."
          - 2 : "Don\'t go in first to a large teamfight. Wait for your teammates to initiate."
        - blurb : "..."
        ▿ enemytips : 2 elements
          - 0 : "Vayne is fragile - turn the pressure up on her and she will be forced to play cautiously."
          - 1 : "Deny Vayne the opportunity to pin you against walls."
        - id : 67
        ▿ image : ImageData
          - w : 48
          - full : "Vayne.png"
          - sprite : "champion3.png"
          - group : "champion"
          - h : 48
          - x : 192
        ▿ info : ChampionInfo
          - defense : 1
          - magic : 1
          - difficulty : 8
          - attack : 10
        - key : "Vayne"
        - lore : "..."
        - name : "Vayne"
        - partype : "MP"
        ▿ passive : PassiveSpell
          - sanitizedDescription : "Vayne ruthlessly hunts evil-doers. She gains 30 Movement Speed when moving toward nearby enemy champions."
          - description : "Vayne ruthlessly hunts evil-doers. She gains 30 Movement Speed when moving toward nearby enemy champions."
          - name : "Night Hunter"
          ▿ image : ImageData
            - w : 48
            - full : "Vayne_NightHunter.png"
            - sprite : "passive3.png"
            - group : "passive"
            - h : 48
            - x : 192
        ▿ stats : ChampionStats
          - attackrange : 550.0
          - mpperlevel : 35.0
          - mp : 231.80000000000001
          - attackdamage : 55.880000000000003
          - hp : 498.44
          - hpperlevel : 83.0
          - attackdamageperlevel : 1.6599999999999999
          - armor : 19.012
          - mpregenperlevel : 0.40000000000000002
          - hpregen : 5.4199999999999999
          - critperlevel : 0.0
          - spellblockperlevel : 0.0
          - mpregen : 6.9699999999999998
          - attackspeedperlevel : 4.0
          - spellblock : 30.0
          - attackspeedoffset : -0.050000000000000003
          - crit : 0.0
          - hpregenperlevel : 0.55000000000000004
          - armorperlevel : 3.3999999999999999
        ▿ tags : 2 elements
          - 0 : "Marksman"
          - 1 : "Assassin"
        - title : "the Night Hunter"
```

## Attribution
```
RiotKit isn't endorsed by Riot Games and doesn't reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.
```

[discord-badge]: https://img.shields.io/badge/Discord-join%20chat%20%E2%86%92-738bd7.svg?style=flat&label=discord
[discord]: https://discord.gg/KRNsGRF
