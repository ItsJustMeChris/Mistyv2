
blacklist = {}
markerNumber = 1;
local mahtime = GetTime()
function clear(list)
  for k in pairs (list) do
    list [k] = nil
  end
end
function blackasfuck(object)
  for i = 1, table.getn(blacklist) do
    if blacklist[i] == object then return true end
  end
  return false
end

function blacklistthatshit(objectCoords)
  table.insert(blacklist, objectCoords)
  mahtime = GetTime()
end
function placeMarker()
  if markerNumber >= 1 then
    PlaceRaidMarker(markerNumber)
    markerNumber = markerNumber + 1;
    checkMarker()
  end
end
function checkMarker()
  if markerNumber >= 8 then
    markerNumber = 1;
  end
end

if GetTime() - mahtime >= 20 then
  clear(blacklist)
  mahtime = GetTime()
end
function coverThatHole()
  for i = 1, ObjectCount() do
    local name = ObjectName(ObjectWithIndex(i))
    local object = ObjectWithIndex(i)
    local x,y,z = ObjectPosition(object)
    if name == "Swirling Pool" and ObjectExists(object) and not blackasfuck(x,y,z) then
      blacklistthatshit(x,y,z)
      placeMarker()
      print(x,y,z)
      ClickPosition(ObjectPosition(object))
    else
    end
  end
end
