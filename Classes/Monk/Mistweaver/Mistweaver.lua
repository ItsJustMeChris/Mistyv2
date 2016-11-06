--+-------------------+--
--|MistWeaver Rotation|--
--+-------------------+--
function WeaveThatMist()
	getTankHealth()
	getHealerHealth()
	getLowestHealth()
  --+--------------+--
  --|Begin Rotation|--
  --+--------------+--
if shouldItCast and tankHealth and tankHealth < 90 and not doYouHaveBuff("Enveloping Mist", tankTarget) then
CastSpellByID(Enveoloping_Mist, tankTarget)
end
if shouldItCast and healerHealth and healerHealth < 90 and not doYouHaveBuff("Enveloping Mist", healerTarget) then
CastSpellByID(Enveoloping_Mist, healerTarget)
end
if shouldItCast and lowestHealth and lowestHealth < 85 then
CastSpellByID(ChiJi)
end
if shouldItCast and lowestHealth and lowestHealth < 95 and not doYouHaveBuff("Renewing Mist", lowestTarget) then
CastSpellByID(Renewing_Mist, lowestTarget)
end
if shouldItCast and healerHealth and healerHealth < 99 and not doYouHaveBuff("Renewing Mist", healerTarget) then
CastSpellByID(Renewing_Mist, healerTarget)
end
if shouldItCast and tankHealth and tankHealth < 99 and not doYouHaveBuff("Renewing Mist", tankTarget) then
CastSpellByID(Renewing_Mist, tankTarget)
end
if shouldItCast and lowestHealth and lowestHealth < 65 and not doYouHaveBuff("Enveloping Mist", lowestTarget) then
CastSpellByID(Enveoloping_Mist, lowestTarget)
end
  --+------------+--
  --|End Rotation|--
  --+------------+--
end