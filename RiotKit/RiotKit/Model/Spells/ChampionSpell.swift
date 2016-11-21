//
//  ChampionSpell.swift
//  RiotKit
//
//  Created by Grant Douglas on 18/11/2016.
//  Copyright © 2016 Reconditorium Ltd. All rights reserved.
//

import Foundation

/*
  "leveltip": {
 "effect": [
 "{{ e1 }} -> {{ e1NL }}",
 "{{ cooldown }} -> {{ cooldownnNL }}"
 ],
 "label": [
 "Damage",
 "Cooldown"
 ]
 },
 "resource": "{{ e3 }}% of current Health ",
 "maxrank": 5,
 "effectBurn": [
 "",
 "70/115/160/205/250",
 "22/20/18/16/14",
 "10",
 "225",
 "1"
 ],
 "image": {
 "w": 48,
 "full": "AatroxQ.png",
 "sprite": "spell0.png",
 "group": "spell",
 "h": 48,
 "y": 48,
 "x": 192
 },
 "cooldown": [
 16,
 15,
 14,
 13,
 12
 ],
 "cost": [
 0,
 0,
 0,
 0,
 0
 ],
 "vars": [{
 "link": "bonusattackdamage",
 "coeff": [0.6],
 "key": "a1"
 }],
 "sanitizedDescription": "Aatrox takes flight and slams down at a targeted location, dealing damage and knocking up enemies at the center of impact.",
 "rangeBurn": "25000",
 "costType": "pofcurrentHealth",
 "effect": [
 null,
 [
 70,
 115,
 160,
 205,
 250
 ],
 [
 22,
 20,
 18,
 16,
 14
 ],
 [
 10,
 10,
 10,
 10,
 10
 ],
 [
 225,
 225,
 225,
 225,
 225
 ],
 [
 1,
 1,
 1,
 1,
 1
 ]
 ],
 "cooldownBurn": "16/15/14/13/12",
 "description": "Aatrox takes flight and slams down at a targeted location, dealing damage and knocking up enemies at the center of impact.",
 "name": "Dark Flight",
 "sanitizedTooltip": "Aatrox takes flight and slams down at target location, dealing {{ e1 }} (+{{ a1 }}) physical damage and knocking up enemies at the center of impact for {{ e5 }} second.",
 "key": "AatroxQ",
 "costBurn": "0",
 "tooltip": "Aatrox takes flight and slams down at target location, dealing {{ e1 }}<span class=\"colorF88017\"> (+{{ a1 }})<\/span> physical damage and knocking up enemies at the center of impact for {{ e5 }} second."
 },
 {
 "range": [
 1,
 1,
 1,
 1,
 1
 ],
 "leveltip": {
 "effect": [
 "{{ e3 }} -> {{ e3NL }}",
 "{{ e2 }} -> {{ e2NL }}"
 ],
 "label": [
 "Heal",
 "Bonus Damage"
 ]
 },
 "resource": "No Cost",
 "maxrank": 5,
 "effectBurn": [
 "",
 "200",
 "60/95/130/165/200",
 "20/25/30/35/40",
 "25",
 "50",
 "0.5"
 ],
 "image": {
 "w": 48,
 "full": "AatroxW.png",
 "sprite": "spell0.png",
 "group": "spell",
 "h": 48,
 "y": 48,
 "x": 240
 },
 "cooldown": [
 0.5,
 0.5,
 0.5,
 0.5,
 0.5
 ],
 "cost": [
 0,
 0,
 0,
 0,
 0
 ],
 "vars": [
 {
 "link": "bonusattackdamage",
 "coeff": [0.25],
 "key": "a1"
 },
 {
 "link": "bonusattackdamage",
 "coeff": [1],
 "key": "a2"
 }
 ],
 "sanitizedDescription": "While toggled on Aatrox deals bonus damage every third subsequent attack at the expense of his own Health. While toggled off Aatrox restores Health every third subsequent attack.",
 "rangeBurn": "1",
 "costType": "NoCost",
 "effect": [
 null,
 [
 200,
 200,
 200,
 200,
 200
 ],
 [
 60,
 95,
 130,
 165,
 200
 ],
 [
 20,
 25,
 30,
 35,
 40
 ],
 [
 25,
 25,
 25,
 25,
 25
 ],
 [
 50,
 50,
 50,
 50,
 50
 ],
 [
 0.5,
 0.5,
 0.5,
 0.5,
 0.5
 ]
 ],
 "cooldownBurn": "0.5",
 "description": "While toggled on Aatrox deals bonus damage every third subsequent attack at the expense of his own Health. While toggled off Aatrox restores Health every third subsequent attack.",
 "name": "Blood Thirst / Blood Price",
 "sanitizedTooltip": "Toggle Off: Blood Thirst: Every third attack, Aatrox restores {{ e3 }} (+{{ a1 }}) Health, increased by {{ e1 }}% ({{ f5 }}) when below half Health. Toggle On: Blood Price: Every third attack, Aatrox deals {{ e2 }} (+{{ a2 }}) bonus physical damage and loses {{ f4 }} Health.",
 "key": "AatroxW",
 "costBurn": "0",
 "tooltip": "<span class=\"colorFF9900\">Toggle Off:<\/span><span class=\"colore60000\"> Blood Thirst: <\/span>Every third attack, Aatrox restores {{ e3 }}<span class=\"colorF88017\"> (+{{ a1 }})<\/span> Health, increased by {{ e1 }}% ({{ f5 }}) when below half Health.<br><br><span class=\"colorFF9900\">Toggle On:<\/span><span class=\"color9900ff\"> Blood Price: <\/span>Every third attack, Aatrox deals {{ e2 }}<span class=\"colorF88017\"> (+{{ a2 }})<\/span> bonus physical damage and loses <span class=\"colorCC3300\">{{ f4 }}<\/span> Health."
 },
 {
 "range": [
 1000,
 1000,
 1000,
 1000,
 1000
 ],
 "leveltip": {
 "effect": [
 "{{ e1 }} -> {{ e1NL }}",
 "{{ e4 }} -> {{ e4NL }}",
 "{{ cooldown }} -> {{ cooldownnNL }}"
 ],
 "label": [
 "Damage",
 "Slow Duration",
 "Cooldown"
 ]
 },
 "resource": "{{ e5 }}% of current Health ",
 "maxrank": 5,
 "effectBurn": [
 "",
 "75/110/145/180/215",
 "40",
 "15",
 "1.75/2/2.25/2.5/2.75",
 "5"
 ],
 "image": {
 "w": 48,
 "full": "AatroxE.png",
 "sprite": "spell0.png",
 "group": "spell",
 "h": 48,
 "y": 48,
 "x": 288
 },
 "cooldown": [
 12,
 11,
 10,
 9,
 8
 ],
 "cost": [
 0,
 0,
 0,
 0,
 0
 ],
 "vars": [
 {
 "link": "spelldamage",
 "coeff": [0.6],
 "key": "a1"
 },
 {
 "link": "bonusattackdamage",
 "coeff": [0.6],
 "key": "a2"
 }
 ],
 "sanitizedDescription": "Aatrox unleashes the power of his blade, dealing damage to enemies hit and slowing them.",
 "rangeBurn": "1000",
 "costType": "pofcurrentHealth",
 "effect": [
 null,
 [
 75,
 110,
 145,
 180,
 215
 ],
 [
 40,
 40,
 40,
 40,
 40
 ],
 [
 15,
 15,
 15,
 15,
 15
 ],
 [
 1.75,
 2,
 2.25,
 2.5,
 2.75
 ],
 [
 5,
 5,
 5,
 5,
 5
 ]
 ],
 "cooldownBurn": "12/11/10/9/8",
 "description": "Aatrox unleashes the power of his blade, dealing damage to enemies hit and slowing them.",
 "name": "Blades of Torment",
 "sanitizedTooltip": "Aatrox unleashes the power of his blade, dealing {{ e1 }} (+{{ a1 }}) (+{{ a2 }}) Magic Damage to enemies hit and slowing them by {{ e2 }}% for {{ e4 }} seconds.",
 "key": "AatroxE",
 "costBurn": "0",
 "tooltip": "Aatrox unleashes the power of his blade, dealing {{ e1 }} <span class=\"color99FF99\">(+{{ a1 }}) <span class=\"colorF88017\">(+{{ a2 }})<\/span><\/span> Magic Damage to enemies hit and slowing them by {{ e2 }}% for {{ e4 }} seconds."
 },
 {
 "range": [
 550,
 550,
 550
 ],
 "leveltip": {
 "effect": [
 "{{ e2 }} -> {{ e2NL }}",
 "{{ e3 }}% -> {{ e3NL }}%",
 "{{ cooldown }} -> {{ cooldownnNL }}"
 ],
 "label": [
 "Damage",
 "Attack Speed",
 "Cooldown"
 ]
 },
 "resource": "No Cost",
 "maxrank": 3,
 "effectBurn": [
 "",
 "12",
 "200/300/400",
 "40/50/60",
 "10",
 "175",
 "50/65/80",
 "20",
 "12"
 ],
 "image": {
 "w": 48,
 "full": "AatroxR.png",
 "sprite": "spell0.png",
 "group": "spell",
 "h": 48,
 "y": 48,
 "x": 336
 },
 "cooldown": [
 100,
 85,
 70
 ],
 "cost": [
 0,
 0,
 0
 ],
 "vars": [{
 "link": "spelldamage",
 "coeff": [1],
 "key": "a1"
 }],
 "sanitizedDescription": "Aatrox draws in the blood of his foes, damaging all nearby enemy champions around him and gaining increased Attack Speed and bonus Attack Range for a short duration.",
 "rangeBurn": "550",
 "costType": "NoCost",
 "effect": [
 null,
 [
 12,
 12,
 12
 ],
 [
 200,
 300,
 400
 ],
 [
 40,
 50,
 60
 ],
 [
 10,
 10,
 10
 ],
 [
 175,
 175,
 175
 ],
 [
 50,
 65,
 80
 ],
 [
 20,
 20,
 20
 ],
 [
 12,
 12,
 12
 ]
 ],
 "cooldownBurn": "100/85/70",
 "description": "Aatrox draws in the blood of his foes, damaging all nearby enemy champions around him and gaining increased Attack Speed and bonus Attack Range for a short duration.",
 "name": "Massacre",
 "sanitizedTooltip": "Aatrox draws in the blood of his foes, dealing {{ e2 }} (+{{ a1 }}) magic damage to nearby enemy champions. Massacre fills Aatrox's Blood Well by {{ e7 }}% for each champion hit and grants him {{ e3 }}% attack speed and {{ e5 }} attack range for {{ e8 }} seconds.",
 "key": "AatroxR",
 "costBurn": "0",
 "tooltip": "Aatrox draws in the blood of his foes, dealing {{ e2 }} <span class=\"color99FF99\">(+{{ a1 }})<\/span> magic damage to nearby enemy champions. Massacre fills Aatrox's Blood Well by {{ e7 }}% for each champion hit and grants him {{ e3 }}% attack speed and {{ e5 }} attack range for {{ e8 }} seconds."
 }
 ],
 
 */

public struct ChampionSpell {
    public let range: [Int];
    
}
