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
if currentlyChanneling == "Soothing Mist" and lowestHealth and lowestHealth <= 90 or currentlyChanneling == "Soothing Mist" and lowestHealth == nil then
  return true
else if currentlyChanneling == "Essence Font" then
  return false
else if currentlyChanneling == nil then
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
	return charges
end