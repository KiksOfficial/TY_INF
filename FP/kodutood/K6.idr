module K6

data Email = E String String
 
varmo     : Email
kalmer    : Email
karoliine : Email
varmo     = E "varmo.vene"       "ut.ee"
kalmer    = E "kalmer.apinis"    "ut.ee"
karoliine = E "karoliine.holter" "ut.ee"

Show Email where
  show (E nimi domeen) = nimi ++ "@" ++ domeen

test : List Nat -> List Nat
test xs = [x*2|x<-xs]
