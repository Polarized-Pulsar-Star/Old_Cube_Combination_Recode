-- Important note: If you are not using any datastore modules, the dataModule will default to use-
-- -ProfileStore as the datastore module.

-- I'm too lazy to actually do anything with this so u can just change the startsession and all those stuff in dataModule guh

--[[
This module stores the APIs of your own datastore module, or the one you're currently using.
]]

-- Dependencies

-- /*
-- yourDatastoreModule = require(path.to.nameOfYourDatastoreModule)


	-- Datastore module is refering to datastore wrappers like ProfileStore, ProfileService, Lyra... etc.


-- */
--[[
Example code of this:

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local storeModule = require(ReplicatedStorage.storeModule) -- Assume the datastore module you're using is inside ReplicatedStorage.

return {
	getStoreAPI = function (player, ...)
		return storeModule.new(player, ...) -- GetDataStore() thingies.
	end,
	startSessionAPI = function (player, ...)
		return storeModule.startSessions(player, ...) -- Start sessions functions, if any.
	end -- This can be skipped if none are presented.
}


]]
return {
	getStoresAPI = "",
	startSessionsAPI = "",
	getDataAPI = "",
}
