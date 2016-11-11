--+---------+--
--|Get Group|--
--+---------+--
function fillGroup()
  for i=1, #Group do
    if UnitAffectCombat(Group[i].Unit) then
      populateMyGroup();
    end
  end
end
--+----------+--
--|Get Health|--
--+----------+--
function getHealth(unit)
  currentHealth = UnitHealth(unit) / UnitHealthMax(unit) * 100
  return currentHealth
end
--+--------+--
--|Get Mana|--
--+--------+--
function getMana(unit)
  currentMana = UnitPower(unit) / UnitPowerMax(unit) * 100
  return currentMana
end
--+---------------+--
--|Get Tank Health|--
--+---------------+--
function getTankHealth()
  for i = 1, #Group do
    if Group[i] ~= nil and Group[i].Role == "TANK" then
      tankHealth = getHealth(Group[i].Unit)
      tankTarget = Group[i].Unit
      return tankHealth, tankTarget
    end
  end
end

function getHealerHealth()
  for i = 1, #Group do
    if Group[i] ~= nil and Group[i].Role == "HEALER" then
      healerHealth = getHealth(Group[i].Unit)
      healerTarget = Group[i].Unit
      return healerHealth, healerTarget
    end
  end
end

function getLowestHealth()
  for i = 1, #Group do
    if Group[i] ~= nil and (Group[i].Role == "DAMAGER" or "NONE") then
      lowestHealth = getHealth(Group[i].Unit)
      lowestTarget = Group[i].Unit
      return lowestHealth, lowestTarget
    end
  end
end

function getNumberOfPlayersBellow()
  for i = 1, #Group do
    if Group[2] ~= nil and (Group[2].Role == "DAMAGER" or "NONE") then
      getTwoBellowHealth = getHealth(Group[2].Unit)
      getTwoBellowUnit = Group[2].Unit
      return getTwoBellowHealth, getTwoBellowUnit
    end
  end
end

function lifeCheck()
  for i=1,#Group do
    if UnitIsDeadOrGhost(Group[i].Unit) then
      table.remove(Group, i)
      getLowestHealth()
    else if UnitIsDeadOrGhost(tankTarget) then
      tankTarget = lowestHealth
    end
  end
end
end

function resetLowestHealths()
lowestHealth = nil
healerHealth = nil
tankHealth = nil
end


function shouldItCast()
currentlyChanneling = select(1, UnitChannelInfo("player"))
currentlyCasting = UnitCastingInfo("player")
if currentlyChanneling == "Soothing Mist" and not currentlyCasting and not isTargetMoving("player") and lowestHealth and lowestHealth <= 90 or currentlyChanneling == "Soothing Mist" and lowestHealth == nil then
  return true
else if currentlyChanneling == "Essence Font" then
  return false
else if currentlyChanneling == nil and not isTargetMoving("player") then
  return true
end
end
end
end

function getCoolDown(spellID)
RealCoolDown = GetSpellCooldown(spellID) + GetSpellCooldown(61304)
if RealCoolDown == 0 then
return true
else
return false
end
end

function getCharges(spell)
charges = select(1, GetSpellCharges(spell))
if charges ~= nil then
  return charges
  else if charges == nil then
charges = 0
return charges
end
end
end

function getCount(spell)
return GetSpellCount(spell)
  end

function isTargetMoving(target)
if UnitMovementFlags(target) == 0 then
  return false
  else return true
  end
end

function isInRange(unit)
  if UnitInRange(unit) then
    return true
    else return false
    end
end

function canDispell(unit)
  for i=1,40 do
dispellable = select(5, UnitDebuff(unit, i))
if unit ~= nil and dispellable ~= nil then
  return true
  else return false
  end
  end
end