intrinsic IdealOneLine(I::RngIntElt) -> MonStgElt
  {}
  return Sprintf("%o", I);
end intrinsic;

intrinsic IdealOneLine(I::FldReElt) -> MonStgElt
  {}
  return Sprintf("%o", I);
end intrinsic;

intrinsic IdealOneLine(I::RngInt) -> MonStgElt
  {}
  return Sprintf("%o", Minimum(I));
end intrinsic;

intrinsic IdealOneLine(I::RngOrdIdl) -> MonStgElt
  {}
  gens := Generators(I);
  str := "";
  str *:= Sprintf("Ideal of norm %o generated by ", Norm(I));
  for g := 1 to #gens-1 do
    str *:= Sprintf("%o, ", gens[g]);
  end for;
  str *:= Sprintf("%o", gens[#gens]);
  return str;
end intrinsic;

intrinsic NicefyIdeal(I::RngOrdFracIdl) -> RngOrdIdl
  {tries to coerce "fractional" generators into integral generators}
  gens := Generators(I);
  ZF := Integers(Parent(gens[1]));
  nice_gens := [ZF!g : g in gens];
  return ideal<ZF|nice_gens>;
end intrinsic;
