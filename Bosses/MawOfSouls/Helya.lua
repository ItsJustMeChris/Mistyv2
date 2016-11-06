--+--------------------+--
--|Am I Fighting Helya?|--
--+--------------------+--
function isMistyAttackingHelya()
  if UnitAffectingCombat("Helya") then
    coverThatHole()
  end
end