--[[
This is essentially just a bunch of functions of reporting errors.
can require by ModuleScript as a API, or require by script for debugging.

Important Note: I'm neither advertising, nor asked to posting all those links. It's totally up to you whether you would like to take a look, or ignore them.
==> All those links are not malicious, and only for assisting purposes.
]]

local ProfileStore = require(script.Parent.ProfileStore)
local httpService = game:GetService("HttpService")

--// You can also add a function for getting the roblox status using RoProxy. However, regular httpService will not work due to roblox blacklisted all "*.roblox.com" domains.
--// The only way to connect that is to use a proxy.

--// ! IMPORTANT NOTE: Heroru has ended their free plan since 2022, please consider other proxies! ! //--

return {

	-- Return a warning everytime profileStore caught an error.
	storeErrCallback = ProfileStore.OnError:Connect(function(message: string, store_name: string, profile_key: string): nil
		warn("Report_Error_Module caught an error: \n"..message.."\n	=> Source: DataStoreSystem/"..store_name..";\n	=> Store Key: "..profile_key)
		return nil
	end),

	--[[
	Return an error if dataStore for some reasons, not operating normally.
	You may kick the player after 15 seconds if still critical state.
	]]
	storeCriticalState = ProfileStore.OnCriticalToggle:Connect(function(is_critical: boolean): nil -- Using nil as the placeholder.
		if is_critical then
			error("Uh oh, it seems like our DataStore system unable to function properly! Please wait patiently. -- DataSystemReportModule", 2) -- We can't do anything except wait. -.-
		end
		return nil
	end),

	--[[
	Automatically kick player if storeProfileObject returns nil.
	Refer to https://madstudioroblox.github.io/ProfileStore/api/#startsessionasync
	
	@param storeProfileObject ProfileStore.Profile<any>

	The object to get checked.


	@param player Player

	Player object.

	@returns boolean?

	Return false if not nil, nil if true. (By then they should've been kicked.)
	]]
	storeProfileObjectReturnNil = function(storeProfileObject: ProfileStore.Profile<any>, player: Player): boolean?
		return (storeProfileObject == nil and player:Kick("It seems like another remote Roblox server attempted to start a session for you at the same time! \nYou've been automatically kicked for your own good! ~System. \n(NOT BAN)") or false)
	end,
}

-- Module by stone
