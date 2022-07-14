import XMonad
import XMonad.Util.EZConfig
import Data.Monoid
import System.Exit
import System.IO
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad
import XMonad.Util.Loggers

-- my defaults
myTerminal = "kitty"
myBar = "xmobar"
myRun = "dmenu_run -b -l 10 -p 'Run:' -nb '#282828' -nf '#ebdbb2' -sb '#458588'"
myBrowser = "firefox"

myPP = xmobarPP
  { ppCurrent = xmobarColor "#b16286" "" . wrap "<" ">"
  }

toggleStrutsKey XConfig
  { XMonad.modMask = modMask } = (modMask, xK_b)

myLayout = smartSpacing 4
  $fullscreenFull
  $smartBorders
  $avoidStruts(tiled ||| Full ||| Grid ||| spiral (6/7))
  where
     tiled   = Tall nmaster delta ratio

     nmaster = 1

     ratio   = 1/2

     delta   = 3/100

main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myConfig = def
  { modMask = mod4Mask, -- super key
    layoutHook = myLayout,
    terminal = myTerminal,
    focusedBorderColor = "#d79921",
    normalBorderColor = "#ebdbb2"

  }
  `additionalKeysP`
  [ ("M-d", spawn myRun),
    ("M-f", spawn myBrowser),
    ("M-q", kill), 
    ("M-<Return>", spawn myTerminal) ]
