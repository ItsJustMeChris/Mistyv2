--+------------+--
--|Group Table|--
--+------------+--
Group = {
}
--+----------------+--
--|Fill Group Table|--
--+----------------+--
function populateMyGroup()
  local groupType = IsInRaid() and "raid" or "party";
  for i=1, GetNumGroupMembers() do
    if groupType == "party" and i == GetNumGroupMembers() then
      table.insert(Group, {Unit = "player", Role=UnitGroupRolesAssigned("player")})
    else Unit = (groupType .. i)
      table.insert(Group, {Unit = Unit, Role=UnitGroupRolesAssigned(Unit)})
    end
  end
  if GetNumGroupMembers() == 0 then
    table.insert(Group, {Unit = "player", Role="HEALER"})
  end
  return Group
end