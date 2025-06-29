local player = game.Players.LocalPlayer
local coins = player:WaitForChild("leaderstats"):WaitForChild("Coins")
local textLabel = script.Parent

-- Format
local function formatCoins(value)
	if value >= 1_000_000 then
		local mil = value / 1_000_000
		if mil % 1 == 0 then
			return math.floor(mil) .. "M"
		else
			return string.format("%.1fM", mil)
		end
	elseif value >= 1_000 then
		local k = value / 1_000
		if k % 1 == 0 then
			return math.floor(k) .. "K"
		else
			return string.format("%.1fK", k)
		end
	else
		return tostring(value)
	end
end

local function updateText()
	textLabel.Text = "Coins: " .. formatCoins(coins.Value)
end

updateText()
coins:GetPropertyChangedSignal("Value"):Connect(updateText)
