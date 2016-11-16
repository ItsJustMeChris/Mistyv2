--+--------------+--
--|Core Variables|--
--+--------------+--
local Can_I_Breathe = false
betaraid = false
local name = UnitName("player")
misty = "|cffff69b4[Misty]|r"
total = 0
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
function RaidToggle()
  if not betaraid then
    betaraid = true
        print(misty, "Raid healing enabled note this is in beta and might not perform well.  ")
  else
    betaraid = false
        print(misty, "Raid healing disabled.  ")
  end
end
--+-----------------+--
--|Initiate Rotation|--
--+-----------------+--
function MistyJustUpdated(self, elapsed)
  total = total + elapsed
  if total <= .250 then
  if Can_I_Breathe then
    MistyPleaseDoYourRotation();
          partyAffectingCombat()
          bossManager()
    elseif total >= 1 then
      total = 0
    else
          partyAffectingCombat()
          bossManager()
    end
  end
end
--+-------------------+--
--|Am I Out Of Combat?|--
--+-------------------+-- 
AddEventCallback("GROUP_ROSTER_UPDATE", function()
table.wipe(Group)
populateMyGroup()


end)

AddEventCallback("GROUP_JOINED", function()
  table.wipe(Group)
populateMyGroup()

  end)
--+---------------+--
--|Am I In Combat?|--
--+---------------+--
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
        RaidToggle()
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