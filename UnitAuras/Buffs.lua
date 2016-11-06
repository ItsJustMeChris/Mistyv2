--+-------------------+--
--|Do You Have A Buff?|--
--|  Is It My Buff?   |--
--+-------------------+--
function doYouHaveBuff(buffID, unit)
  if UnitAura(unit, buffID, "", "PLAYER")then
    return true;
  else return false;
  end
end