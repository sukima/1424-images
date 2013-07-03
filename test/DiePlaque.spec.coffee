tuples = [
  [ "", "", "" ]
  [ "1", "1", "" ]
  [ "21", "12", "" ]
  [ "321", "132", "" ]
  [ "4321", "1432", "" ]
  [ "54321", "14532", "" ]
  [ "654321", "146532", "" ]
  [ "-", "", "" ]
  [ "-1", "", "1" ]
  [ "-12", "", "12" ]
  [ "-123", "", "123" ]
  [ "-1234", "", "1234" ]
  [ "-12345", "", "12345" ]
  [ "-123456", "", "123456" ]
  [ "1-23456", "1", "23456" ]
  [ "12-3456", "12", "3456" ]
  [ "123-456", "123", "456" ]
  [ "1234-56", "1423", "56" ]
  [ "12345-6", "14235", "6" ]
  [ "123456-", "142356", "" ]
]

describe "DiePlaque", ->
  DiePlaque = require "../src/die_plaque"

  describe "#destructDieCode", ->
    for tuple in tuples
      it "should destruct die code for '#{tuple[0]}'", do (tuple) -> return ->
        result = DiePlaque.destructDieCode(tuple[0])
        expect( result.player_dice.join("") ).toBe tuple[1]
        expect( result.table_dice.join("") ).toBe tuple[2]
