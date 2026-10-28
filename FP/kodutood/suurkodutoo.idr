data Command
  = Forward Double
  | Turn Double
  | PenUp
  | PenDown
  | Repeat Nat (List Command)

record KilpkonnOlek where
  constructor MkKilpkonnOlek
  asukoht : (Double, Double)
  suund : Double
  pliiats : Bool

kilpkonn : KilpkonnOlek
kilpkonn = MkKilpkonnOlek {
  asukoht = (0,0),
  suund = 0,
  pliiats = True
}
 
Program : Type
Program = List Command


kask : Command -> KilpkonnOlek -> KilpkonnOlek 
kask PenUp (MkKilpkonnOlek (x,y) suund pliiats) = (MkKilpkonnOlek (x,y) suund False)

kask PenDown (MkKilpkonnOlek (x,y) suund pliiats) = (MkKilpkonnOlek (x,y) suund True)

kask (Repeat n funcs) olek = realiseeri n olek where
  realiseeri : Nat -> KilpkonnOlek -> KilpkonnOlek
  realiseeri Z olek = olek
  realiseeri (S k) olek = realiseeri k olek 

  rakendakasud : List Command -> KilpkonnOlek -> KilpkonnOlek
  rakendakasud [] olek = olek
  rakendakasud (x::xs) olek = rakendakasud xs (kask x olek)


kask (Turn a) (MkKilpkonnOlek (x,y) suund pliiats) = (MkKilpkonnOlek (x,y) (suund - a) True)

kask (Forward d) (MkKilpkonnOlek (x,y) a pliiats) = MkKilpkonnOlek (x', y') a pliiats where
  x' = x + d * cos(a * pi / 180)
  y' = y + d * sin(a * pi / 180)

record Point where
  constructor MkPoint
  x : Double
  y : Double
 
record Segment where
  constructor MkSegment
  start : Point
  end : Point
 
Drawing : Type
Drawing = List Segment
