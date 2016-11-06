--+-------------------+--
--|Do You Have A Buff?|--
--|  Is It My Buff?   |--
--+-------------------+--
function canYouBeDispelled(buffID, unit)
  if UnitDeBuff(unit, buffID, "", "PLAYER") then
  	dispellType = select(4, UnitDeBuff(unit, buffID, "", "PLAYER"))
  	if dispellType == "Curse" or "Disease" or "Magic" or "Poison" then
  		print("It can be dispelled")
    return true;
	end
  else return false;
  end
end