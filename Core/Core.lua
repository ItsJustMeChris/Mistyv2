--+--------------+--
--|Core Variables|--
--+--------------+--
Can_I_Breathe = false
--+---------------------+--
--|Addon Update Function|--
--+---------------------+--
function StartBestFuckingHealing()
  MainFrame = CreateFrame("FRAME", nil, UIParent)
  MainFrame:SetScript("OnUpdate", MistyJustUpdated)
end
--+------------+--
--|Toggle Misty|--
--+------------+--
function MistyToggle()
  if not Can_I_Breathe then
    Can_I_Breathe = true
  else
    Can_I_Breathe = false
  end
end
--+-----------------+--
--|Initiate Rotation|--
--+-----------------+--
function MistyJustUpdated(self, elapsed)
  if Can_I_Breathe then
    MistyPleaseDoYourRotation();
  end
end
--+-------------------+--
--|Am I Out Of Combat?|--
--+-------------------+--
AddEventCallback("PLAYER_REGEN_DISABLED", function()
populateMyGroup()
print("Combat Enabled")
combat = true;
end)
--+---------------+--
--|Am I In Combat?|--
--+---------------+--
AddEventCallback("PLAYER_REGEN_ENABLED", function()
table.wipe(Group)
print("Combat Ended")
combat = false;
resetLowestHealths()
end)
--+--------+--
--|Commands|--
--+--------+--
SLASH_MISTY1 = '/misty'
function handler(msg, editbox)
  MistyToggle()
  if not Can_I_Breathe then
    Can_I_Breathe = false
    print("Off")
  else
    Can_I_Breathe = true
    print("On")
  end
end
SlashCmdList["MISTY"] = handler;
--+-------------------+--
--|Start Addon Updates|--
--+-------------------+--
StartBestFuckingHealing();