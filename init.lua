local killTimer = nil
local flApp = nil

hs.hotkey.bind({"cmd"}, "Q", 
  function()
    -- key down
    flApp = hs.application.frontmostApplication()
    if flApp:name() == "FL Studio" then
      flApp:activate()
      hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({"cmd", "alt"}, "Q")
      end)
      killTimer = hs.timer.doAfter(0.5, function()
        if flApp then
          flApp:kill()
        end
      end)
    else
      flApp:kill()
      flApp = nil
    end
  end, 
  function()
    -- key up
    if killTimer then
      killTimer:stop()
      killTimer = nil
    end
    flApp = nil
  end,
  nil
)
