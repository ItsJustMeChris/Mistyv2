--+----------------+--
--|Cover Helya Hole|--
--+----------------+--
function coverThatHole()
  blacklist = {}
  markerNumber = 1;
  local mahtime = GetTime()
  --+------------+--
  --|Clear A List|--
  --+------------+--
  function clear(list)
    for k in pairs (list) do
      list [k] = nil
    end
  end
  --+-----------------+--
  --|Is It Blacklisted|--
  --+-----------------+--
  function blackasfuck(object)
    for i = 1, table.getn(blacklist) do
      if blacklist[i] == object then return true end
    end
    return false
  end
  --+--------------+--
  --|Blacklist Item|--
  --+--------------+--
  function blacklistthatshit(object)
    table.insert(blacklist, object)
    mahtime = GetTime()
  end
  --+-----------+--
  --|Just A Test|--
  --+-----------+--
  function test()
    if GetTime() - mahtime >= 20 then
      clear(blacklist)
      mahtime = GetTime()
    end
    --+------------------+--
    --|Place World Marker|--
    --+------------------+--
    function placeMarker()
      PlaceRaidMarker(markerNumber)
      markerNumber = markerNumber + 1;
    end
    for i = 1, ObjectCount() do
      local name = ObjectName(ObjectWithIndex(i))
      local object = ObjectWithIndex(i)
      if name == "Swirling Pool" and ObjectExists(object) and not blackasfuck(object) then
        print("[Misty] Covered it :)")
        blacklistthatshit(object)
        placeMarker()
        ClickPosition(ObjectPosition(object))
      else print("error")
      end
    end
  end
end