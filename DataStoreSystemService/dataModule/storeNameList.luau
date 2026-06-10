-- Returns a list of store names, that is read-only.
-- Add the store name you want inside storeNames.

local storeNames = {
	["Server"] = {
		"BridgeData",
		"CubesOnGround", -- Those cubes on the ground ^^
	},
	["Player"] = {
		"PlayerCombines",
	}
}

return table.freeze(storeNames)
