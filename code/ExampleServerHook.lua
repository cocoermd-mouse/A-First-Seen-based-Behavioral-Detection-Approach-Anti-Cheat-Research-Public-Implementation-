-- ExampleServerHook.lua
-- Demonstrates how to call the demo module from a server script.
-- Replace "visibility trigger" with your own system event.

local ServerScriptService = game:GetService("ServerScriptService")

-- Adjust this require path to where you placed FirstSeenDemo.lua in Roblox
local FirstSeenDemo = require(ServerScriptService.AntiCheatSystem.Modules.FirstSeenDemo)

FirstSeenDemo.Init()

FirstSeenDemo.OnRisk = function(player, risk, reasons, snapshot)
	print("[DEMO-RISK]", player.Name, "risk=", risk, "reasons=", table.concat(reasons, ","))
	print(string.format(
		"  angle=%.1f dist=%.1f lock=%.3f smooth=%.2f av=%.1f",
		snapshot.angleDelta, snapshot.distance, snapshot.timeToLock, snapshot.smoothness, snapshot.angularVelocity
	))
end

-- Example trigger (fake):
-- In real usage, your VisibilityAuditSystem should call this when a target becomes visible for the first time.
local function FakeFirstSeen(observer, target)
	FirstSeenDemo.HandleFirstSeen(observer, target, { wasOccludedBefore = true })
end

-- You can call FakeFirstSeen(...) from your own visibility detection.