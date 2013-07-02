# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What You Want To Public
# License, Version 3, as published by Devin Weaver. See
# http://tritarget.org/wywtpl/COPYING for more details.
express = require "express"
DiePlaque = require "./die_plaque"

app = express()

app.use express.static("#{__dirname}/../public")

app.get "/dice/:dicedata", (req, res) ->
  data =
    dice:        req.params.dicedata
    player_name: req.query.name
  try
    die_plaque = new DiePlaque(data)
    res.type "png"
    res.send die_plaque.getPNG()
  catch err
    res.type "text"
    res.status(500)
      .send "Error processing '#{req.params.dicedata}'. #{err.message or err}"

port = process.env.PORT or 4000
app.listen port, ->
  console.log "listening on port #{port}"
