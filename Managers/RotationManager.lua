function MistyPleaseDoYourRotation()
  local spec = GetSpecialization(select(2))
  local class = select(3, UnitClass("player"))

  if class == 10 and spec == 1 then
    DrinkThatDrink();
  end

  if class == 10 and spec == 2 then
    WeaveThatMist();
  end

  if class == 10 and spec == 3 then
    WalkThatWind();
  end
  if class ~= 10 then
    print("[Misty] Silly, your rotation is not implemented : ) ")
  end
end