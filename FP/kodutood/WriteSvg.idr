module WriteSvg
 
import System.File
 
record Point where
  constructor MkPoint
  x : Double
  y : Double
 
record Segment where
  constructor MkSegment
  start : Point
  end : Point
 
segmentSvg : Segment -> String
segmentSvg (MkSegment (MkPoint x1 y1) (MkPoint x2 y2)) =
  "  <line x1=\"" ++ show x1 ++
  "\" y1=\"" ++ show (-y1) ++
  "\" x2=\"" ++ show x2 ++
  "\" y2=\"" ++ show (-y2) ++
  "\" />\n"
 
renderSvg : List Segment -> String
renderSvg segments =
  "<svg xmlns=\"http://www.w3.org/2000/svg\" " ++
  "viewBox=\"-20 -120 140 140\">\n" ++
  "<g fill=\"none\" stroke=\"black\" stroke-width=\"2\">\n" ++
  concat (map segmentSvg segments) ++
  "</g>\n</svg>\n"
 
square : List Segment
square =
  [ MkSegment (MkPoint 0 0) (MkPoint 100 0)
  , MkSegment (MkPoint 100 0) (MkPoint 100 100)
  , MkSegment (MkPoint 100 100) (MkPoint 0 100)
  , MkSegment (MkPoint 0 100) (MkPoint 0 0)
  ]
 
main : IO ()
main = do
  result <- writeFile "drawing.svg" (renderSvg square)
  case result of
    Left err => putStrLn ("Viga: " ++ show err)
    Right () => putStrLn "Kirjutasin faili drawing.svg"
