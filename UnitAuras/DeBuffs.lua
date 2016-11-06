--+-------------------+--
--|Do You Have DeBuff?|--
--|  Is It My DeBuff? |--
--+-------------------+--
function doYouHaveDeBuff(buffID, unit)
  if UnitDeBuff(unit, buffID, "", "PLAYER")then
    return true;
  else return false;
  end
end