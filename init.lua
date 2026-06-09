-- FL Studio Quick Quantize
-- Tap Cmd+Q to quantize, hold 1.5s to quit
-- =====================
local killTimer = nil
local flApp = nil

hs.hotkey.bind({"cmd"}, "Q",
 function()
   flApp = hs.application.frontmostApplication()
   if flApp and flApp:name() == "FL Studio" then
     flApp:activate()
     hs.timer.doAfter(0.3, function()
       hs.eventtap.keyStroke({"cmd", "alt"}, "Q")
     end)
     killTimer = hs.timer.doAfter(1.5, function()
       if flApp then
         flApp:kill()
         flApp = nil
         killTimer = nil
       end
     end)
   elseif flApp then
     flApp:kill()
     flApp = nil
   end
 end,
 function()
   if killTimer then
     killTimer:stop()
     killTimer = nil
   end
   flApp = nil
 end,
 nil
)