--+--------------+--
--|Core Variables|--
--+--------------+--
local Can_I_Breathe = false
betaraid = false
local name = UnitName("player")
misty = "|cffff69b4[Misty]|r"
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
    print(misty, "Hello,", name, "are you ready to get started, I sure am!")
  else
    Can_I_Breathe = false
        print(misty, "Goodbye,", name, "please be sure to carry on your duties without me!  ")
  end
end
--+-----------------+--
--|Initiate Rotation|--
--+-----------------+--
function MistyJustUpdated(self, elapsed)
  if Can_I_Breathe then
    MistyPleaseDoYourRotation();
    bossManager()
  end
end
--+-------------------+--
--|Am I Out Of Combat?|--
--+-------------------+-- 
AddEventCallback("PLAYER_REGEN_DISABLED", function()
populateMyGroup()
print(misty, "We seem to be under attack!")
combat = true;
end)
--+---------------+--
--|Am I In Combat?|--
--+---------------+--
AddEventCallback("PLAYER_REGEN_ENABLED", function()
table.wipe(Group)
print(misty, "Phew, that was a tough one!  ")
combat = false;
resetLowestHealths()
end)
--+--------+--
--|Commands|--
--+--------+--
SLASH_MISTY1 = '/misty'
function handler(msg, editbox)
  if msg == "toggle" then
  MistyToggle()
  if not Can_I_Breathe then
    Can_I_Breathe = false
  else
    Can_I_Breathe = true
  end
    elseif msg == "debug" then
      print(misty, "Debugging Enabled")
      elseif msg == "raid" then
        print(misty, "Raid healing enabled note this is in beta and might not perform well.  ")
        betaraid = true
        elseif msg == "help" then
          print(misty, "Available commands:  toggle, debug, raid, help")
      else print(misty, "Invalid Command:", msg)
  end
end
SlashCmdList["MISTY"] = handler;
--+-------------------+--
--|Start Addon Updates|--
--+-------------------+--
StartBestFuckingHealing();