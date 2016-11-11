--+-------------------+--
--|MistWeaver Rotation|--
--+-------------------+--
throttle = 0
function WeaveThatMist()
  throttle = throttle + 1
  if throttle <= 2 then


    --+--------------+--
    --|Begin Rotation|--
    --+--------------+--
    if shouldItCast() and getCoolDown(Thunder_Focus_Tea) and lowestHealth and lowestHealth < 65 and not doYouHaveBuff("Thunder Focus Tea", "player") then
      CastSpellByID(Thunder_Focus_Tea)
    end
    if shouldItCast() and getCoolDown(Vivify) and lowestHealth and lowestHealth < 70 and doYouHaveBuff("Thunder Focus Tea", "player") then
      CastSpellByID(Vivify, lowestTarget)
    end
    if shouldItCast() and getCoolDown(Enveoloping_Mist) and tankHealth and tankHealth > 65 and tankHealth < 80 and not doYouHaveBuff("Enveloping Mist", tankTarget) then
      CastSpellByID(Enveoloping_Mist, tankTarget)
    end
    if shouldItCast() and getCoolDown(Enveoloping_Mist) and healerHealth and healerHealth > 65 and healerHealth < 80 and not doYouHaveBuff("Enveloping Mist", healerTarget) then
      CastSpellByID(Enveoloping_Mist, healerTarget)
    end
    if shouldItCast() and getCoolDown(ChiJi) and lowestHealth and lowestHealth < 85 then
      CastSpellByID(ChiJi)
    end
    if shouldItCast() and getCoolDown(Vivify) and lowestHealth and lowestHealth < 80 and doYouHaveBuff("Uplifting Trance", "player") then
      CastSpellByID(Vivify)
    end
    if shouldItCast() and getCoolDown(Renewing_Mist) and lowestHealth and lowestHealth < 95 and not doYouHaveBuff("Renewing Mist", lowestTarget) then
      CastSpellByID(Renewing_Mist, lowestTarget)
    end
    if shouldItCast() and getCoolDown(Renewing_Mist) and healerHealth and healerHealth < 99 and not doYouHaveBuff("Renewing Mist", healerTarget) then
      CastSpellByID(Renewing_Mist, healerTarget)
    end
    if shouldItCast() and getCoolDown(Renewing_Mist) and tankHealth and tankHealth < 99 and not doYouHaveBuff("Renewing Mist", tankTarget) then
      CastSpellByID(Renewing_Mist, tankTarget)
    end
    if shouldItCast() and getCoolDown(Enveoloping_Mist) and lowestHealth and lowestHealth > 50 and lowestHealth < 65 and not doYouHaveBuff("Enveloping Mist", lowestTarget) then
      CastSpellByID(Enveoloping_Mist, lowestTarget)
    end
    if shouldItCast() and getCoolDown(Revival) and tankHealth and lowestHealth and tankHealth < 45 and lowestHealth < 50 then
      CastSpellByID(Revival, tankTarget)
    end
    if shouldItCast() and getCoolDown(Vivify) and getTwoBellowHealth and getTwoBellowHealth < 50 then
      CastSpellByID(Vivify, getTwoBellowUnit)
    end
    if shouldItCast() and getCoolDown(Life_Cocoon) and tankHealth and tankHealth < 30 then
      CastSpellByID(Life_Cocoon, tankTarget)
    end
    if shouldItCast() and getCoolDown(Mana_Tea) and tankHealth and tankHealth < 50 and getMana("player") < 60 then
      CastSpellByID(Mana_Tea)
    end
    if shouldItCast() and getCoolDown(Sheiluns_Gift) and lowestHealth and lowestHealth < 60 and getCount("Sheilun's Gift") >= 6 then
      CastSpellByID(Sheiluns_Gift, lowestTarget)
    end
    if shouldItCast() and getCoolDown(Sheiluns_Gift) and tankHealth and tankHealth < 50 and getCount("Sheilun's Gift") >= 6 then
      CastSpellByID(Sheiluns_Gift, tankTarget)
    end
    if shouldItCast() and getCoolDown(Sheiluns_Gift) and healerHealth and healerHealth < 50 and getCount("Sheilun's Gift") >= 6 then
      CastSpellByID(Sheiluns_Gift, healerTarget)
    end
    if shouldItCast() and getCoolDown(Effuse) and lowestHealth and lowestHealth < 50 then
      CastSpellByID(Effuse, lowestTarget)
    end
    if shouldItCast() and getCoolDown(Effuse) and tankHealth and tankHealth < 55 then
      CastSpellByID(Effuse, tankTarget)
    end
    if shouldItCast() and getCoolDown(Effuse) and healerHealth and healerHealth < 55 then
      CastSpellByID(Effuse, healerTarget)
    end
    if shouldItCast() and getCoolDown(Detox) and tankTarget and canDispell(tankTarget) and tankHealth and tankHealth <= 80 then
      CastSpellByID(Detox, tankTarget)
    end
    if shouldItCast() and getCoolDown(Detox) and healerTarget and canDispell(healerTarget) then
      CastSpellByID(Detox, healerTarget)
    end

  else if throttle >= 90 then
    throttle = 0
  else if throttle > 1 then
    table.sort(Group, function(a,b) return UnitHealth(a.Unit) < UnitHealth(b.Unit) end)
    getTankHealth()
    getHealerHealth()
    getLowestHealth()

  end
end
end
--+------------+--
--|End Rotation|--
--+------------+--
end