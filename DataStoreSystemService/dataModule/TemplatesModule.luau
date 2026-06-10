--[[
This is TemplateModules. As its name says, it contains templates for you to use, and you are free to create one as well.

let's say you got something like this:
data = {
	playerCombines = 0,
	playerInventorySlots = 1,
	(blah blah)
}

you can make a template for that
local data = {
	playerCombines = 0,
	playerInventorySlots = 1,
	(blah blah)
}
and done!

basically just think abt what u gonna get inside a data instance

but one thing to remember is that the name inside storeNameList must match the templates
or else it won't work

:D
]]

local t = require(script.Parent.shared.t) or nil

if not t then error(`[{script.Parent.Parent.Name}.shared.TemplatesModule]: Failed to load. Reason: Lack of essential module: "t" Runtime type checker.`) end -- The fuck is going on in this file? What the fuck?? -fish girl


local TemplateModule = {}

-- totally optional lmao

return table.freeze(TemplateModule)

-- Yeah i mean, why would you really want to use this anyway?
