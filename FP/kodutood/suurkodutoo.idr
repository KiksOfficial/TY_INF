import System.File

data Command
  = Forward Double
  | Turn Double
  | PenUp
  | PenDown
  | Repeat Nat (List Command)
  | MuudaPaksus Double

record KilpkonnOlek where
  constructor MkKilpkonnOlek
  asukoht : (Double, Double)
  suund : Double
  pliiats : Bool
  paksus : Double

kilpkonn : KilpkonnOlek
kilpkonn = MkKilpkonnOlek {
  asukoht = (0,0),
  suund = 0,
  pliiats = True,
  paksus = 1.0
}
 
Program : Type
Program = List Command

record Point where
  constructor MkPoint
  x : Double
  y : Double
 
record Segment where
  constructor MkSegment
  start : Point
  end : Point
  paksus : Double

Drawing : Type
Drawing = List Segment

mutual
  kaskudeList : List Command -> KilpkonnOlek -> (KilpkonnOlek, List Segment)
  kaskudeList [] olek = (olek,[])
  kaskudeList (x::xs) olek = 
    let (olek1, segmendid1) = (kask x olek)
        (olek2, segmendid2) = kaskudeList xs olek1
    in (olek2, segmendid1 ++ segmendid2)

  kask : Command -> KilpkonnOlek -> (KilpkonnOlek, List Segment)
  kask PenUp (MkKilpkonnOlek (x,y) suund pliiats paksus) = (MkKilpkonnOlek (x,y) suund False paksus, [])

  kask (MuudaPaksus n) (MkKilpkonnOlek (x,y) suund pliiats paksus)  =
    let uuspaksus = if paksus <= 0.0 then 0.1 else n
    in (MkKilpkonnOlek (x,y) suund pliiats uuspaksus, []) 

  kask PenDown (MkKilpkonnOlek (x,y) suund pliiats paksus) = (MkKilpkonnOlek (x,y) suund True paksus, [])

  kask (Repeat Z _) olek = (olek, [])
  kask (Repeat (S n) funcs) olek =
    let (olek1, segmendid1) = kaskudeList funcs olek
        (olek2, segmendid2) = kask (Repeat n funcs) olek1
    in (olek2, segmendid1 ++ segmendid2)


  kask (Turn a) (MkKilpkonnOlek (x,y) suund pliiats paksus) = (MkKilpkonnOlek (x,y) (suund - a) pliiats paksus, [])

  kask (Forward d) (MkKilpkonnOlek (x,y) a pliiats paksus) =
    (MkKilpkonnOlek (x', y') a pliiats paksus, segmendid) where
      x' = x + d * cos(a * pi / 180)
      y' = y + d * sin(a * pi / 180)
      
      segmendid : List Segment
      segmendid = if pliiats then [MkSegment (MkPoint x y) (MkPoint x' y') paksus] else []

segmentSvg : Segment -> String
segmentSvg (MkSegment (MkPoint x1 y1) (MkPoint x2 y2) paksus) =
  "  <line x1=\"" ++ show x1 ++
  "\" y1=\"" ++ show (-y1) ++
  "\" x2=\"" ++ show x2 ++
  "\" y2=\"" ++ show (-y2) ++
  "\" stroke-width=\"" ++ show paksus ++ 
  "\" />\n"

renderSvg : List Segment -> String -> String -> String
renderSvg segments color width =
  "<svg xmlns=\"http://www.w3.org/2000/svg\" " ++
  "viewBox=\"-20 -120 140 140\">\n" ++
  "<g fill=\"none\" stroke=\"" ++ color ++ "\" stroke-width=\"" ++ width ++ "\">\n" ++
  concat (map segmentSvg segments) ++
  "</g>\n</svg>\n"

mingiprogramm : Program
mingiprogramm = 
  [ PenDown
  , Repeat 4 [Forward 50, Turn 90]
  , PenUp
  , Forward 50
  , Turn 90
  , Repeat 4 [Forward 50, Turn (-90)]
  ]

diagonaalprogramm : Program
diagonaalprogramm = 
  [ PenDown
  , Turn 45
  , MuudaPaksus 5
  , Forward 70
  , Turn 45
  , MuudaPaksus 2
  , Forward 70
  ]

test1 : Bool
test1 =
  let (olek, commands) = (kilpkonn, [])
      (_, segmendid) = kaskudeList commands olek

  in case segmendid of
       [] => True
       _ => False

leiaumbes : Double -> Double -> Bool
leiaumbes a b = abs (a - b) < 0.000001

punktidlahedal : Point -> Point -> Bool
punktidlahedal (MkPoint x1 y1) (MkPoint x2 y2) =
  leiaumbes x1 x2 && leiaumbes y1 y2

segmendidlahedal : Segment -> Segment -> Bool
segmendidlahedal (MkSegment s1 e1 p1) (MkSegment s2 e2 p2) =
  punktidlahedal s1 s2 && punktidlahedal e1 e2 && leiaumbes p1 p2

test2 : Bool
test2 =
  let olek = kilpkonn
      programm = [PenDown, Forward 50]
      valjund = MkSegment (MkPoint 0 0) (MkPoint 50 0) 1.0
      (olek2, segmendid) = kaskudeList programm olek
  in case segmendid of
      [s] =>  segmendidlahedal s valjund
      _   => False

test3 : Bool
test3 =
  let (olek, commands) = (kilpkonn, [PenUp, Forward 50])
      (_, segmendid) = kaskudeList commands olek
  in case segmendid of
       [] => True
       _ => False

test4 : Bool
test4 =
  let (olek, commands) = (kilpkonn, [PenDown, Forward 50, Turn 90, Forward 50])
      (olek1, segmendid) = kaskudeList commands olek
      segment1 = MkSegment (MkPoint 0 0) (MkPoint 50 0) 1.0
      segment2 = MkSegment (MkPoint 50 0) (MkPoint 50 (-50)) 1.0
  in case segmendid of
       [s1, s2] => segmendidlahedal s1 segment1 && 
                   segmendidlahedal s2 segment2 && 
                   leiaumbes (suund olek1) (-90) &&
                   pliiats olek1 == True
       _        => False

test5 : Bool
test5 =
  let olek = kilpkonn
      programm = [Repeat 0 [Forward 50]]
      (_, segmendid) = kaskudeList programm olek
  in case segmendid of
       [] => True
       _  => False

test6 : Bool
test6 = 
  let olek = kilpkonn
      programm = [Repeat 3 [Repeat 3 [Forward 3]]]
      (olek1, segmendid) = kaskudeList programm olek
      (x, y) = asukoht olek1
  in length segmendid == 9 && 
     leiaumbes x 27 && 
     leiaumbes y 0

testid : IO ()
testid = do 
      let res1 = test1
      let res2 = test2
      let res3 = test3
      let res4 = test4
      let res5 = test5
      let res6 = test6

      putStrLn ("Tühi programm: " ++ show res1)
      putStrLn ("PenDown: " ++ show res2)
      putStrLn ("PenUp: " ++ show res3)
      putStrLn ("Turn and move: " ++ show res4)
      putStrLn ("Repeat 0: " ++ show res5)
      putStrLn ("Nested repeat: " ++ show res6)

ruut100: Program
ruut100 = [Repeat 4 [Forward 100, Turn (-90)]]

katkendlik : Program
katkendlik = [Repeat 4 [Forward 33, PenUp, Forward 33, PenDown, Forward 33, Turn (-90)]]

polygon : Nat -> Double -> Program
polygon n size = 
  let nurk = 360.0 / cast n
  in [PenUp, Forward size, PenDown, Repeat n [Forward size, Turn (-nurk)]]

minujoonis : Nat -> Double -> Program
minujoonis Z _ = []
minujoonis (S k) sirge = [Forward sirge, Turn 45] ++ minujoonis k (sirge + 2)

main : IO ()
main = do
  let (_, segmendid) = kaskudeList ruut100 kilpkonn
  let svgsisu = renderSvg segmendid "black" "2"
  result <- writeFile "ruut100.svg" svgsisu

  case result of
    Left err => putStrLn ("Viga: " ++ show err)
    Right () => putStrLn "Kirjutasin faili ruut100.svg"

  let (_, segmendid) = kaskudeList katkendlik kilpkonn
  let svgsisu = renderSvg segmendid "black" "2"
  result <- writeFile "katkendlik.svg" svgsisu

  case result of
    Left err => putStrLn ("Viga: " ++ show err)
    Right () => putStrLn "Kirjutasin faili katkendlik.svg"
  
  let programm = polygon 8 30
  let (_, segmendid) = kaskudeList programm kilpkonn
  let svgsisu = renderSvg segmendid "black" "2"
  result <- writeFile "polygon.svg" svgsisu

  case result of
    Left err => putStrLn ("Viga: " ++ show err)
    Right () => putStrLn "Kirjutasin faili polygon.svg"

  let programm = [PenUp, Forward 30, Turn(-90), Forward 30, Turn 90, PenDown] ++ minujoonis 20 3 
  let (_, segmendid) = kaskudeList programm kilpkonn
  let svgsisu = renderSvg segmendid "red" "2"
  result <- writeFile "minujoonis.svg" svgsisu

  case result of
    Left err => putStrLn ("Viga: " ++ show err)
    Right () => putStrLn "Kirjutasin faili minujoonis.svg"

  let (_, segmendid) = kaskudeList diagonaalprogramm kilpkonn
  let svgsisu = renderSvg segmendid "black" "2"
  result <- writeFile "diagonaal.svg" svgsisu

  case result of
    Left err => putStrLn ("Viga: " ++ show err)
    Right () => putStrLn "Kirjutasin faili diagonaal.svg"

