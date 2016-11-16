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

function lifeCheck()
  for i=1,#Group do
    if Group[i] ~= nil then
      if UnitIsDeadOrGhost(Group[i].Unit) then
        getLowestHealth()
      else if UnitIsDeadOrGhost(tankTarget) then
        tankTarget = lowestHealth
      end
    end
  end
end
end

function resetLowestHealths()
lowestHealth = nil
healerHealth = nil
tankHealth = nil
end


function shouldItCast(unit)
  currentlyChanneling = select(1, UnitChannelInfo("player"))
  currentlyCasting = UnitCastingInfo("player")
  if (currentlyChanneling == "Soothing Mist" and not currentlyCasting and not isTargetMoving("player") and lowestHealth and lowestHealth <= 90  and lineOfSight(unit)) or (currentlyChanneling == "Soothing Mist" and lowestHealth == nil and lineOfSight(unit)) then
    return true
  elseif currentlyChanneling == "Essence Font" then
    return false
  elseif currentlyChanneling == nil and not isTargetMoving("player") and lineOfSight(unit)then
    return true
  else return false
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
    if unit ~= nil and (dispellable == "Disease" or dispellable == "Magic" or dispellable == "Poison") then
      return true
    else return false
    end
  end
end

function lineOfSight(target)
  local sX, sY, sZ = ObjectPosition("player");
  local oX, oY, oZ = ObjectPosition(target);
  local losFlags =  bit.bor(0x10, 0x100, 0x1)
  return TraceLine(sX, sY, sZ + 2.25, oX, oY, oZ + 2.25, losFlags) == nil;
end

function FaceUnit(unit)
  if UnitExists(unit) and UnitIsVisible(unit) then
    local _, pX, pY, pZ = pcall(ObjectPosition, 'player')
    local _, uX, uY, uZ = pcall(ObjectPosition, unit)
    local angle = rad(atan2(uY - pY, uX - pX))
    if angle < 0 then
      return FaceDirection(rad(atan2(uY - pY, uX - pX) + 360))
    else
      return FaceDirection(angle)
    end
  end
end

function partyAffectingCombat()
  for i=1, #Group do
    if UnitAffectingCombat(Group[i].Unit) then
      return true
      else
        return false
    end 
  end
end

function getDistanceBetween(target, base)
  local X1, Y1, Z1 = ObjectPosition(target)
  local X2, Y2, Z2 = ObjectPosition(base)
  return math.sqrt(((X1 - X2)^2) + ((Y1 - Y2)^2) + ((Z1 - Z2)^2))
end

function noUnitsInRangeOf(target, yards)
  for i=1, #Group do
    if getDistanceBetween(target, Group[i].Unit) <= yards then
      return false
    end
      return true
  end
end

function getXBellow(x)
  for i=1, #Group do
    if Group[x].Unit ~= nil and (Group[x].Role == "DAMAGER" or "NONE") then
      getTwoBellowHealth = getHealth(Group[x].Unit)
      getTwoBellowUnit = Group[x].Unit
      return getXBellowHealth, getXBellowUnit
    end
  end
end