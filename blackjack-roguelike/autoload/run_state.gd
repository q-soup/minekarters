extends Node

signal hp_changed(hp, max_hp)

const START_HP = 100

var max_hp = START_HP
var hp = START_HP
var money = 0
var deck: Array = [] #will change once someone finishes the card resource
var beaten_bosses: Array[String] = []
var flags: Array[String] = []

func reset_run():
	max_hp = START_HP
	hp = max_hp
	money = 0
	deck.clear()
	beaten_bosses.clear()
	flags.clear()
	hp_changed.emit(hp, max_hp)

func take_damage(amount):
	hp = max(hp - amount, 0)
	hp_changed.emit(hp, max_hp)

func has_flag(flag): #pass in a string
	return flags.has(flag)
