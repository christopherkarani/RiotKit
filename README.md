# RiotKit

[![Build Status](https://travis-ci.org/RiotKit/RiotKit.svg?branch=master)](https://travis-ci.org/RiotKit/RiotKit)
[![codecov.io](https://codecov.io/gh/RiotKit/RiotKit/branch/master/graphs/badge.svg)](https://codecov.io/gh/RiotKit/RiotKit/branch/master)
[![Twitter](https://img.shields.io/badge/twitter-@Hexploitable-blue.svg?style=flat)](http://twitter.com/Hexploitable)

RiotKit is a Swift framework written to server as a wrapper around the Riot Games API.
The API provides access into many of the League of Legends stats/game information including player details and match history.


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
