local M = {}

-- Nord Color Palette
-- https://www.nordtheme.com/docs/colors-and-palettes

-- Polar Night (Dark backgrounds)
M.nord0 = "#2e3440"
M.nord1 = "#3b4252"
M.nord2 = "#434c5e"
M.nord3 = "#4c566a"

-- Snow Storm (Light/neutral colors)
M.nord4 = "#d8dee9"
M.nord5 = "#e5e9f0"
M.nord6 = "#eceff4"

-- Frost (Blue accents)
M.nord7 = "#8fbcbb"
M.nord8 = "#88c0d0"
M.nord9 = "#81a1c1"
M.nord10 = "#5e81ac"

-- Aurora (Vibrant colors)
M.nord11 = "#bf616a" -- Red
M.nord12 = "#d08770" -- Orange
M.nord13 = "#ebcb8b" -- Yellow
M.nord14 = "#a3be8c" -- Green
M.nord15 = "#b48ead" -- Purple

-- Convenience color groups
M.polar_night = {
  M.nord0,
  M.nord1,
  M.nord2,
  M.nord3,
}

M.snow_storm = {
  M.nord4,
  M.nord5,
  M.nord6,
}

M.frost = {
  M.nord7,
  M.nord8,
  M.nord9,
  M.nord10,
}

M.aurora = {
  M.nord11,
  M.nord12,
  M.nord13,
  M.nord14,
  M.nord15,
}

return M
