--+----------------+--
--|Get Current Zone|--
--+----------------+--
local myCurrentZone = GetRealZoneText();
--+---------------------+--
--|Am I In Maw of Souls?|--
--+---------------------+--
function isMistyInMawOfSouls()
  if myCurrentZone == "Helmouth Cliffs" then
    isMistyAttackingHelya()
  end
end

function bossManager()
  isMistyInMawOfSouls()
end
--+------------+--
--|Where Am I? |--
--|Check Please|--
--+------------+--
AddEventCallback("ZONE_CHANGED_NEW_AREA", function()
print("We are in", GetRealZoneText())
isMistyInMawOfSouls()

end)