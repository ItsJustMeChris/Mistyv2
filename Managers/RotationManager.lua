--+---------+--
--|Get Class|--
--+---------+--
function MistyPleaseDoYourRotation()
  local spec = GetSpecialization(select(2))
  local class = select(3, UnitClass("player"))
  --+----------+--
  --|Brewmaster|--
  --+----------+--
  if class == 10 and spec == 1 then
    DrinkThatDrink();
  end
  --+----------+--
  --|Mistweaver|--
  --+----------+--
  if class == 10 and spec == 2 then
    WeaveThatMist();
  end
  --+----------+--
  --|WindWalker|--
  --+----------+--
  if class == 10 and spec == 3 then
    WalkThatWind();
  end
  --+--------+--
  --|Not Monk|--
  --+--------+--
  if class ~= 10 then
    print("[Misty] Silly, your rotation is not implemented : ) ")
  end
end

function slope(x1, y1, x2, y2)
print(y2 - y1, "over", x2 - x1)
  end