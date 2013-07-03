# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What You Want To Public
# License, Version 3, as published by Devin Weaver. See
# http://tritarget.org/wywtpl/COPYING for more details.
gm = require "gm"

class DiePlaque
  constructor: (data) ->
    @dice = DiePlaque.destructDieCode(data.dice)
    @player_name = data.player_name
  getPNG: ->
    throw "Not implemented yet"
  @destructDieCode: (die_code) ->
    dice = die_code.split("")
    table_dice = []
    player_dice = new Array(6)
    player_pos = 2
    next = false
    add_to_player_dice = (die, dice_slot) ->
      if dice_slot? and not player_dice[dice_slot]?
        player_dice[dice_slot] = die
      else
        player_dice[player_pos++] = die
    for die in dice
      if next
        table_dice.push die
      else
        switch die
          when "-"
            next = true
          when "1"
            add_to_player_dice(die, 0)
          when "4"
            add_to_player_dice(die, 1)
          else
            add_to_player_dice(die)
    return {
      player_dice: player_dice
      table_dice:  table_dice
    }

module.exports = DiePlaque
