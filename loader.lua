local WowAddon = GetWoWDirectory() .. "\\" .. "Interface" .. "\\" ..  "Addons" .. "\\"
local AddonName = "Misty"
local Root =  WowAddon .. AddonName .. "\\"




function LoadFile(FilePath,LoadMsg)
  lua = ReadFile(Root .. FilePath)
  
  if not lua then
    print(Root .. FilePath .. " Does not exist")
  end
  
  local func,err = loadstring(lua,Root .. "\\" .. FilePath)
  if err then
    error(err,0)
  end
  pcall(func)
  if LoadMsg then
    print(LoadMsg)
  end
end

--    Core
LoadFile("Core\\Core.lua")

--  ClassFiles
LoadFile("Classes\\Monk\\Mistweaver\\Mistweaver.lua")
LoadFile("Classes\\Monk\\BrewMaster\\BrewMaster.lua")
LoadFile("Classes\\Monk\\WindWalker\\WindWalker.lua")
LoadFile("Classes\\Backend.lua")

--  Spell Module
LoadFile("Spells\\Monk\\Mistweaver\\Spells.lua")
LoadFile("Spells\\Monk\\BrewMaster\\Spells.lua")
LoadFile("Spells\\Monk\\WindWalker\\Spells.lua")

-- Aura Module
LoadFile("UnitAuras\\Buffs.lua")
LoadFile("UnitAuras\\DeBuffs.lua")
LoadFile("UnitAuras\\Dispellable.lua")
LoadFile("UnitAuras\\smartDispell.lua")
-- Managers
LoadFile("Managers\\RotationManager.lua")
LoadFile("Managers\\GroupGetter.lua")
LoadFile("Managers\\BossManager.lua")

-- Boss Specific
LoadFile("Bosses\\MawOfSouls\\Helya.lua")
LoadFile("Bosses\\MawOfSouls\\Helya\\coverThatHole.lua")  