--+-------------------+--
--|MistWeaver Rotation|--
--+-------------------+--
local groupType = IsInRaid() and "raid" or "party";
function WeaveThatMist()
    partyAffectingCombat()
    if partyAffectingCombat() then
    --+--------------+--
    --|Begin Rotation|--
    --+--------------+--
    if shouldItCast("player") and getCoolDown(Thunder_Focus_Tea) and lowestHealth and lowestHealth < 65 and not doYouHaveBuff("Thunder Focus Tea", "player") then
      CastSpellByID(Thunder_Focus_Tea)
    end
    if shouldItCast(lowestTarget) and getCoolDown(Vivify) and lowestHealth and lowestHealth < 70 and doYouHaveBuff("Thunder Focus Tea", "player") then
      CastSpellByID(Vivify, lowestTarget)
    end
    if shouldItCast(tankTarget) and getCoolDown(Enveoloping_Mist) and tankHealth and tankHealth > 65 and tankHealth < 80 and not doYouHaveBuff("Enveloping Mist", tankTarget) then
      CastSpellByID(Enveoloping_Mist, tankTarget)
    end
    if shouldItCast(healerTarget) and getCoolDown(Enveoloping_Mist) and healerHealth and healerHealth > 65 and healerHealth < 80 and not doYouHaveBuff("Enveloping Mist", healerTarget) then
      CastSpellByID(Enveoloping_Mist, healerTarget)
    end
    if shouldItCast("player") and getCoolDown(ChiJi) and lowestHealth and lowestHealth < 85 then
      CastSpellByID(ChiJi)
    end
    if shouldItCast("player") and getCoolDown(Vivify) and lowestHealth and lowestHealth < 80 and doYouHaveBuff("Uplifting Trance", "player") then
      CastSpellByID(Vivify)
    end
    if shouldItCast(lowestTarget) and getCoolDown(Renewing_Mist) and lowestHealth and lowestHealth < 95 and not doYouHaveBuff("Renewing Mist", lowestTarget) then
      CastSpellByID(Renewing_Mist, lowestTarget)
    end
    if shouldItCast(healerTarget) and getCoolDown(Renewing_Mist) and healerHealth and healerHealth < 99 and not doYouHaveBuff("Renewing Mist", healerTarget) then
      CastSpellByID(Renewing_Mist, healerTarget)
    end
    if shouldItCast(tankTarget) and getCoolDown(Renewing_Mist) and tankHealth and tankHealth < 99 and not doYouHaveBuff("Renewing Mist", tankTarget) then
      CastSpellByID(Renewing_Mist, tankTarget)
    end
    if shouldItCast(lowestTarget) and getCoolDown(Enveoloping_Mist) and lowestHealth and lowestHealth > 50 and lowestHealth < 65 and not doYouHaveBuff("Enveloping Mist", lowestTarget) then
      CastSpellByID(Enveoloping_Mist, lowestTarget)
    end
    if shouldItCast(tankTarget) and getCoolDown(Revival) and tankHealth and lowestHealth and tankHealth < 45 and lowestHealth < 50 then
      CastSpellByID(Revival, tankTarget)
    end
    if shouldItCast(getTwoBellowUnit) and getCoolDown(Vivify) and getTwoBellowHealth and getTwoBellowHealth < 50 then
      CastSpellByID(Vivify, getTwoBellowUnit)
    end
    if shouldItCast(tankTarget) and getCoolDown(Life_Cocoon) and tankHealth and tankHealth < 30 then
      CastSpellByID(Life_Cocoon, tankTarget)
    end
    if shouldItCast("player") and getCoolDown(Mana_Tea) and tankHealth and tankHealth < 50 and getMana("player") < 60 then
      CastSpellByID(Mana_Tea)
    end
    if shouldItCast(lowestTarget) and getCoolDown(Sheiluns_Gift) and lowestHealth and lowestHealth < 60 and getCount("Sheilun's Gift") >= 6 then
      CastSpellByID(Sheiluns_Gift, lowestTarget)
    end
    if shouldItCast(tankTarget) and getCoolDown(Sheiluns_Gift) and tankHealth and tankHealth < 50 and getCount("Sheilun's Gift") >= 6 then
      CastSpellByID(Sheiluns_Gift, tankTarget)
    end
    if shouldItCast(healerTarget) and getCoolDown(Sheiluns_Gift) and healerHealth and healerHealth < 50 and getCount("Sheilun's Gift") >= 6 then
      CastSpellByID(Sheiluns_Gift, healerTarget)
    end
    if shouldItCast(lowestTarget) and getCoolDown(Effuse) and lowestHealth and lowestHealth < 50 then
      CastSpellByID(Effuse, lowestTarget)
    end
    if shouldItCast(tankTarget) and getCoolDown(Effuse) and tankHealth and tankHealth < 55 then
      CastSpellByID(Effuse, tankTarget)
    end
    if shouldItCast(healerTarget) and getCoolDown(Effuse) and healerHealth and healerHealth < 55 then
      CastSpellByID(Effuse, healerTarget)
    end
    if shouldItCast(tankTarget) and getCoolDown(Detox) and tankTarget and canDispell(tankTarget) and tankHealth and tankHealth <= 80 then
      CastSpellByID(Detox, tankTarget)
    end
    if shouldItCast(healerTarget) and getCoolDown(Detox) and healerTarget and canDispell(healerTarget) then
      CastSpellByID(Detox, healerTarget)
    end
    if shouldItCast(lowestTarget) and getCoolDown(Detox) and lowestTarget and canDispell(lowestTarget) then
      CastSpellByID(Detox, lowestTarget)
    end

  end
table.sort(Group, function(a,b) if UnitIsDeadOrGhost(a.Unit) then return false elseif UnitIsDeadOrGhost(b.Unit) then return true else return UnitHealth(a.Unit) < UnitHealth(b.Unit) end end)
    getTankHealth()
    getHealerHealth()
    getLowestHealth()
    getNumberOfPlayersBellow(5)
  end
--+------------+--
--|End Rotation|--
--+------------+--