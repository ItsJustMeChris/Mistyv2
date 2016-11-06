--+---------+--
--|Get Group|--
--+---------+--
function fillGroup()
  for i=1, #Group do
    if UnitAffectCombat(Group[i].Unit) then
      populateMyGroup();
    end
  end
end
