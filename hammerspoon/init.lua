local function launchFocusMaximize(name)
	hs.application.launchOrFocus(name)

	hs.timer.doAfter(0.15, function()
		local app = hs.application.get(name)
		local win = app and app:mainWindow()
		if win then
			win:maximize()
			win:focus()
		end
	end)
end

-- Ctrl+3 and Ctrl+4 work fine with regular hotkeys
hs.hotkey.bind({ "ctrl" }, "3", function()
	launchFocusMaximize("kitty")
end)

hs.hotkey.bind({ "ctrl" }, "4", function()
	launchFocusMaximize("Slack")
end)

-- Low-level eventtap for Ctrl+1 and Ctrl+2 (conflicts with Mission Control)
local eventtap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
	local keyCode = event:getKeyCode()
	local flags = event:getFlags()
	
	-- Only check Ctrl is pressed (no other modifiers)
	if flags.ctrl and not flags.cmd and not flags.alt and not flags.shift then
		-- Ctrl+1 (keycode 18)
		if keyCode == 18 then
			launchFocusMaximize("Zen")
			return true  -- Block the event
		end
		
		-- Ctrl+2 (keycode 19)
		if keyCode == 19 then
			launchFocusMaximize("Comet")
			return true  -- Block the event
		end
	end
	
	return false  -- Allow other events
end)
eventtap:start()
