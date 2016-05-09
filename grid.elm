module Grid where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

import Cell exposing (..)

type alias LGrid a = List a

type alias Grid a = List (List a)

--defaultGrid = List.repeat 2 >> List.repeat 2

toLForm : Grid Cell -> List (List Form)
toLForm grid = List.map (\row -> List.map Cell.toForm row) grid

toListForm : LGrid Cell -> List Form
toListForm grid = List.map Cell.toForm grid

draw : Grid Cell -> Form
draw grid =
  let
    n = List.length grid
    moveByXAndY = List.map (toFloat << (\n -> n * 10)) [0..n]
    formList = toLForm grid

  in
   formList

drawL : LGrid Cell -> Form
drawL grid =
  let
    n = List.length grid
    moveByX = List.map (toFloat << (\n -> n * 10)) [0..n]
    formList = toListForm grid
    moved = List.map2 moveX moveByX formList
  in
    group moved

simpleGrid : Form
simpleGrid = drawL <| List.repeat 5 defaultCell
