--+----------------+--
--|Get Current Zone|--
--+----------------+--
myCurrentZone = GetRealZoneText();
--+---------------------+--
--|Am I In Maw of Souls?|--
--+---------------------+--
function isMistyInMawOfSouls()
  Maw_Of_Souls = false;
  if myCurrentZone == "Maw Of Souls" then
    isMistyAttackingHelya()
    if Maw_Of_Souls == true then
    end
    Maw_Of_Souls = true;
  else
    Maw_Of_Souls = false;
  end
end
--+------------+--
--|Where Am I? |--
--|Check Please|--
--+------------+--
AddEventCallback("LOADING_SCREEN_DISABLED", function()
print("We are in ", GetRealZoneText())
isMistyInMawOfSouls()

end)