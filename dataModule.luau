--[[


				       /$$             /$$               /$$      /$$                 /$$           /$$
				      | $$            | $$              | $$$    /$$$                | $$          | $$
				  /$$$$$$$  /$$$$$$  /$$$$$$    /$$$$$$ | $$$$  /$$$$  /$$$$$$   /$$$$$$$ /$$   /$$| $$  /$$$$$$ 
				 /$$__  $$ |____  $$|_  $$_/   |____  $$| $$ $$/$$ $$ /$$__  $$ /$$__  $$| $$  | $$| $$ /$$__  $$
				| $$  | $$  /$$$$$$$  | $$      /$$$$$$$| $$  $$$| $$| $$  \ $$| $$  | $$| $$  | $$| $$| $$$$$$$$
				| $$  | $$ /$$__  $$  | $$ /$$ /$$__  $$| $$\  $ | $$| $$  | $$| $$  | $$| $$  | $$| $$| $$_____/
				|  $$$$$$$|  $$$$$$$  |  $$$$/|  $$$$$$$| $$ \/  | $$|  $$$$$$/|  $$$$$$$|  $$$$$$/| $$|  $$$$$$$
				 \_______/ \_______/   \___/   \_______/|__/     |__/ \______/  \_______/ \______/ |__/ \_______/




dataModule: A integrated version of the ProfileStore. Made by your very friendly nightfall service provider, Starcatcher.

"This shit took me long enough to make, better to work well or i blow up Roblox Headquarter." ~Stone, probably.


This module's purposes are


	- providing developers of this game a easy-use module without spending too much time on looking at the APIs of ProfileStore;


	- giving out all the data that are ready to use. Just a few lines of code and you can take a look at all of the data you've saved;


	- and a extendable module for experienced developer to work on.


! You are expected to know the basics. Learn them if you don't. !


Go take a look at the warnings of ProfileStore before you go.



If you are using the "open-sourced recode Cube Combination" experience, you should be able to see a "goodSignal" inside sharedModules inside ReplicatedStorage.


	- You may change the signals inside ProfileStore to it, however i DON'T provide any support if you proceed to do so.  ~ Starcatcher


Do it at your own risk.


(Yes, i'm the one who works on this project, while calling herself "stone", "starcatcher", or that fishy girl. <3)
(Yes, i'm placing these notes there for no reason at all, too lazy to make a new section for them... tsk tsk)
(Yes, the version format is shitty enough to make any devs cry. The content aren't any better than it anyway.)
(	Not like i'd fix it anytime soon anyway.)

-------------------------<< !! Cautions !! >>-------------------------


1. Ensure that you have "t" the runtime type checker inside ReplicatedStorage or ServerScriptService.

--> This can cause the dataModule to throw an error if it failed to find the module.


2. You should insert the datastore module you are using into the shared folder.

--> No action required if you want to keep it as it is.


-------------------------<< !! --------- !! >>------------------------




---------------------<--// Version & miscellaneous information //-->---------------------


Version: 0.1.0


---------------------<  	Change log  	>---------------------


--------------------------------------------


	N/A


--------------------------------------------


---------------------<--// Version & Information sections ends //-->---------------------



------------------------------------------------------------------------------------------------------


Basic guides:


<First part>

--------------------------------------------

- You will need to and *MUST* edit both type and configs itself if you wish to add new content.

--------------------------------------------

<1.1: Profile Types>

- ProfileStore has already provided pre-defined types for you;

- The following are most likely the types you will use often.


--> ProfileStore.JSONAcceptable:

Basic data type.


--> ProfileStore.ProfileStore<any>:

Store type.


--> ProfileStore.Profile<any>:

Profiles, provided by dataModule:retrieveData(), dataModule:startSessionAsync()


--> ProfileStore.ProfileStoreModule:

ProfileStore itself, self explanatory.


--------------------------------------------

<Second part>

--------------------------------------------

- You are free to make any types you wish. This is fully customizable.

--> Only if you know what are you doing, i.e. you know what you want to achieve.

--> Don't change if you don't know.

--------------------------------------------

<Third part>

--------------------------------------------

- Now, i'm not really a villain, even though i'm going to be one.

--> Not like i'm really that curel enough to give zero clue on how to use this.



- dataModule consists of three parts: configs, content and functions. Mainly.


<-------------------------------------------->


--> Configs:

Configs mostly contains editable things, such as storeNames, Template and misc.


both storeNames and Template are self-explanatory.


misc, as its name implies, contains miscellaneous things.


	>	PlayerObject is the player object. Basically same as the player retrieved from "players:onPlayerAdded:Connect(function(player: Player) return player end)"


	>	isPrivateServer is a flag, indicating whether user is in a private server.


	>	canMockStore is a flag, indicating whether dataModule has to run in mockStore mode.


	>	userid can be retrieved from dataModule.init()


	>	isPlayerQuitted is a function, using the player object it has and returns a boolean indicating whether player has quitted.


isPrivateServer and isPlayerQuitted are able to be expressed in function form. Refer to the Types if you want.


--> Content:


"_content" consists of two parts: stores, dataContent


stores, can be used for other actions that can be performed directly with ProfileStore. E.g. MessageAsync.



dataContent. Still remember what i said earlier? "One single require and you can take a look at all of the data you've saved."


	->  	That's where it comes to the play. It uses a format of [storeName]: data


	->  	In which, the data is a part of ProfileStore.Profile<any>, I.e. ProfileStore.JSONAcceptable.


Mainly thats all for content.


--> Functions:


Refer to the description of each of them.


--> Signals:


Most are ProfileStore thing I implemented from DataSystemReportModule.


They can indicate different states of ProfileStore. You can handle them however you want.


But mostly they're very important, if you actually know what they do.


--------------------------------------------


<3.1: Example Code>


-- assuming you have a script located inside ServerScriptService, and the dataModule is inside ReplicatedStorage.


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")

local dataModule = require(ReplicatedStorage.dataModule)

players.PlayerAdded:Connect(function(player: Player)
	-- Some other code
	dataModule.init(player)
	-- Other code.
end)

local ExampleValue = "ExampleData" -- As an example. The "Data" inside the data is empty whenever a new store is opened.

local data = dataModule.getData() -- This will return a list full of [storeName] = Profile.Data
data.ExampleStore.Data.ExampleContent = ExampleValue
dataModule.saveData()
*more code goes*

--------------------------------------------


That's all, and all you have to know (I think). Feel free to extend the module as well.

Talking about that, there are a few things to remind you before you extend them:


- Remember to check through the whole script if you want to edit anything related to dataConfigs, e.g. changing how they behave.


	--> Just in case, i've implemented some countermeasures against some foolish operations with the APIs.


- Changing types will also require you to change the related typechecking. Mainly dataConfigs.

- An APIModule has been there already. You can insert the apis of the datastore module you're using, and require them at there.


	--> Remember to change the functions of the APIs in this module if so, and disable the startSessions if there is no startSession function (Or things similar to that) inside the datastore module.


	--> You can also extend the APIs if you want. Use the module wisely!

- And... nothing much.


Anyway..


Good luck and have fun! 	\(Ov<


----------------------------------------------------<  end  >-------------------------------------------------



---------------------------------------------<   End of the guide   >-----------------------------------------

]]

------------------------------------------------------------------------------------------------------


-- Services & External Modules


local players = game:GetService("Players")
local RunService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local DataStoreService = game:GetService("DataStoreService")



local ProfileStore = require(script.shared.ProfileStore) -- You are free to change it to whatever you want. Just make sure the API should uses the new data store system's APIs. Refer to your own data store system's manual.
local DataSystemReportModule = require(script.shared.DataSystemReportModule)
local t = require(script.shared.t) or require(ServerScriptService:FindFirstChild("t", true)) or require(replicatedStorage:FindFirstChild("t", true)) or nil -- Should return nil if so.


------------------------------------------------------------------------------------------------------


-- External modules check.

if script.shared:FindFirstChild("t") == nil then warn(`[{script.Name}]: Failed to load the module.\nReason: "t" Module doesn't exist in the shared!`) end -- Location check to ensure that it actually exists and not false alert.
if DataSystemReportModule == nil then error(`[{script.Name}]: Failed to load the module.\nReason: "DataSystemReportModule" Module doesn't exist in the dataModule!`) end
if t == nil then error(`[{script.Name}]: Failed to load the module.\nReason: Invalid "t" module!`) end

------------------------------------------------------------------------------------------------------


-- Types


export type data = { -- An independent data type that doesn't rely on ProfileStore's type.
	[string]: {data} | data
} | string | buffer | number | boolean


--------------------------------------------


export type dataConfigs = {

	-- Can edit
	storeNames: { [string]: {string} },
	Template: data? | {},

	-- Signals
	Signals: { -- This should be changed to the warning signals of your data store system, if any.
		storeErrCallback: any, -- Lack of the motivation to actually implement any typechecking for them.
		storeCriticalState: any,
		storeProfileObjectReturnNil: any

	},

	-- i ate like 70% of the misc and now we shouldn't have a 1000 lines long list full of bullshits
	misc: {
		playerObject: Player?,
		isPrivateServer: boolean | () -> (boolean),
		canMockStore: boolean | () -> (boolean) ,
		userid: number,
		isPlayerQuitted: (playerObject: Player) -> (boolean)
	}

}


--------------------------------------------


export type module = {

	_configs: dataConfigs?,

	_content: {
		store: {[string]: ProfileStore.ProfileStore<any>},
		dataContent: {[string]: data},
	}?,

	init: (player: Player) -> (),
	getData: (store: string?) -> (data),
	saveData: (store: string, saveName: string, saveValue: data) -> (),
	editConfigs: (configType: "storeNames" | "Template" | "misc", subType: "Server" | "Player" | string?, configName: string, newConfigValue: any) -> (),
	OnClose: () -> (),
	Test: () -> ();

}


------------------------------------------------------------------------------------------------------

local central_Data_Module = DataStoreService:GetDataStore("Central_Data_Module") -- This is basically a global data store, that stores all players' session info.


-- Configs

---> Things that can be edited, and will affect how dataModule works.

local dataConfigs: dataConfigs = {

	-- Things that you can edit.
	storeNames = require(script.storeNameList),
	Template = require(script.TemplatesModule),


	-- Signal objects from DataSystemReportModule.
	Signals = {
		storeErrCallback = DataSystemReportModule.storeErrCallback,
		storeCriticalState = DataSystemReportModule.storeCriticalState,
		storeProfileObjectReturnNil = DataSystemReportModule.storeProfileObjectReturnNil
	},


	-- Miscellaneous things. Such as userid and flags.
	misc = {
		playerObject = nil,
		isPrivateServer = false,
		canMockStore = false,
		userid = 0,
		isPlayerQuitted = function (playerObject: Player): boolean


			return playerObject.Parent ~= players


		end; -- Quitted yet? No? Good

	};

}


------------------------------------------------------------------------------------------------------

-- Configs related functions and configurations.


-- Configs that are allowed to edit via editConfigs().

-- Do not edit this, unless you CLEARLY know what you are doing.

local canEditConfigs = {"storeNames", "Template", "misc"}



-- Main part of doing configs checking.

-- Sorry for a bit too messy there.

-- If you can't understand, leave it as it is.


local configsType = t.interface({


	storeNames = t.interface({

		Server = t.array(t.string),

		Player = t.array(t.string)

	}),


	Template = t.map( -- There are three possible data for each templates. And there are a lot of them.

		t.string, t.intersectionList({ -- [string]: JSONAcceptable. The follow content are JSONAcceptable checking.

			t.array( -- Array type data.

				t.intersectionList({ -- {JSONAcceptable}

					t.number, t.string, t.boolean, t.buffer

				})

			),

			t.map( -- Dictionary type data.

				t.string, t.intersectionList({ -- {[string] = JSONAcceptable}

					t.number, t.string, t.boolean, t.buffer

				})

			),

			t.number, t.string, t.boolean, t.buffer -- Raw type data.

		})

	),



	Signals = t.interface({

		storeErrCallback = t.map(t.string, t.unionList({
			t.boolean,
			t.callback,
			t.map(t.string, t.any) -- fuck __index, go fuck urself.
		})),

		storeCriticalState =t.map(t.string, t.unionList({
			t.boolean,
			t.callback,
			t.map(t.string, t.any) -- ctrl c ctrl v
		})),

		storeProfileObjectReturnNil = t.callback

	}),


	misc = t.interface({

		playerObject = t.unionList({

			t.any, -- Player type

			t.none -- not yet initialized. I.e. nil.

		}), -- It doesn't have a type for player lol


		isPrivateServer = t.unionList({

			t.boolean,

			t.callback

		}),


		canMockStore = t.unionList({

			t.boolean,

			t.callback

		}),


		userid = t.number,

		isPlayerQuitted = t.callback


	})

})



--[[
Run a full checking for dataModule.configs to ensure all objects inside configs are corresponding to the pre-defined types.

Throw an error if the configs didn't pass the check. Otherwise warn.


@param configs dataConfigs

The _configs of module.


@returns nil nil

Throws error (iff failed the check) or warn (if success.)
]]
local function fullCheckTypeConfigs(configs: dataConfigs): nil


	local success, errMsg = configsType(configs)


	if success then

		warn("Data config checking has been done, result: Pass.")

	else

		error(`[{script.Name}]: Data config checking has been done, result: Failed.\n	Reason: {(errMsg or "Unknown error reason.")}.\n{debug.traceback("\n	Traceback content:", 1)}`)

	end

	return

end


------------------------------------------------------------------------------------------------------


-- Private functions


-- Checks if the dataStore has to run in mock mode. (i.e. is game is running in studio?)
local function isMock(): boolean
	return RunService:IsStudio()
end


-- Checks if the game is running in private server.
local function isPrivateServer(): boolean
	if isMock() then return true end
	return (game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0)
end

---<	dataModule related private functions	>---

-- Note: Most of the functions there will have type errors, just ignore them
-- (purely because of the dumbass roblox couldn't do the typechecking well)

--[[

Import all the stores from storeNameList to content.store via ProfileStore.New()

-- ProfileStore: Will also try to import the template with the same name into the 2nd parameter of .New() as well

-- ProfileStore: Automatically use the mock profileStore if module.misc.MockStore is true.


@param module any
The module itself. Equal to "self" for OOP functions.


]]
local function getAllDataStores(module: module)


	-- Module verifying.

	if not module then error(`[{script.Name}]: Failed to retrieve _configs from the module.`) end
	if not module._configs then error(`[{script.Name}]: Failed to retrieve _configs from the module.`) end
	if not module._content then error(`[{script.Name}]: Failed to retrieve _content from the module.`) end


	-- Prasing

	for storeType, nameList in module._configs.storeNames do

		-- Auto skip for server data in non private server.
		if storeType == "Server" and module._configs.misc.isPrivateServer ~= true then print(`[{script.Name}]: Automatically skipped loading server data. \n	Reason: Public Server.`) end


		for idx, name in nameList do


			-- Auto skip for deplicated datastores.

			if module._content.storeName[name.."/"..storeType] then print(`[{script.Name}]: Automatically skipped a store loading, Reason: Duplicated stores, got {name.."/"..storeType}`) end

			if module._configs.misc.canMockStore then


				module._content.storeName[name.."/"..storeType] = ProfileStore.New(


					name,
					typeof(module._configs.Template[name]) == "table" and module._configs.Template[name] or {}


				).Mock


			else


				module._content.storeName[name.."/"..storeType] = ProfileStore.New(


					name,
					typeof(module._configs.Template[name]) == "table" and module._configs.Template[name] or {}
					-- Syntactic sugar for if typeof(module._configs.Template[storeName] == "table" then template = module._configs.Template[storeName] else template = nil end)
					-- For the expression above, it's a bit incorrect. It should be easier to understand if i make another function.
					-- It could also be the Syntactic syrup, god knows? lol.


				)


			end


		end


	end


end


--------------------------------------------


--[[

Loop the _content.store, and start the sessions for all those stores.

@param module module

- The "self" parameter.

]]
local function startAllSessions(module: module)

	if not module then error("Module cannot be empty!") end
	if not module._content then error("Cannot retrieve content from module.") end
	if not module._configs then error("Cannot retrieve configs from module.") end

	for storeName, storeInstances in module._content.storeName do

		module._content.data[storeName] = storeInstances:StartSessionAsync(

-------------------------------------

			`{ -- Profile key section starts

				(

					-- 1st check: Is the name of the store which getting startSessionAsync()'d is a Server type (i.e. "Server" after the slash?)
					string.split(storeName, "/")[2] == "Server" and

					-- 2nd check: Is the PrivateServerId not existed? (This can result in the store throwing a "Invalid profile_key: Must not be an empty string" error.)
					(game.PrivateServerId ~= nil or "MockPrivServer")

				)

				or module._configs.misc.userid -- Easy enough, just use userid if none of them are right.

			}`, { -- Profile key section ends

-------------------------------------

				cancel = module._configs.misc.isPlayerQuitted(module._configs.misc.playerObject) -- Session ending.

			}

		)

	end


end


------------------------------------------------------------------------------------------------------


-- Main part

-- dataModule itself

local module = {}


-- Random welcome message

print([[


=============================================


This game currently running dataModule system.


Version: 1.2 (Internal testing)


Loading content...


=============================================


]])


------------------------------------------------------------------------------------------------------



----<	Public functions	>----

--[[

Wrap this in a playerAdded function. I.e. "Players:PlayerAdded:Connect(function() end)"

Initialize the dataModule.


@param player Player

-Player object.

]]
function module.init(player: Player)

	if player == nil then error("Player cannot be empty!") end
	if players:FindFirstChild(player.Name) == nil then error("Cannot find the player object inside player list!") end


	-- Setting up process
	module._configs = dataConfigs
	module._configs.misc.isPrivateServer = isPrivateServer()
	module._configs.misc.playerObject = player
	module._configs.misc.canMockStore = isMock()
	module._configs.misc.userid = player.UserId
	module._configs.misc.isPlayerQuitted(player)


	-- Make a new table named _content, storing the Profile data and all stores' name.
	module._content = {
		storeName = {},
		data = {},
	}


	-- Session locking 
	
	--If a server starts and somehow bypassed the ProfileStore, this all should be able to stop the player immediately. No signal required.

	local yay_were_good_yay_good_job, oh_god_we_fucked_up_holy_shit = pcall(function()  -- "Success, fail, in a fucked up way. Whatever." ~ Starcatcher


		return central_Data_Module:UpdateAsync(player.UserId..game.PrivateServerId, function(_content)


			if _content == nil then -- Newcomer.

				_content = {}

				_content.Is_Profile_Using = true

				return _content

			end


			if _content.Is_Profile_Using == false then _content.Is_Profile_Using = true return _content end -- Not occupied? Too bad, now it is.


			if _content.Is_Profile_Using == true then -- *stares*

				player:Kick([[ 

					You've been forcibly disconnected, reason: Force-ending the session due to another server using the same profile.

					Rejoin if you want to continue on this device.

				]]) -- Now get the fuck outta there. <3
				-- Works as intended.

			end


		end)


	end)

	if not yay_were_good_yay_good_job then player:Kick(oh_god_we_fucked_up_holy_shit) end -- Too bad cry about it.
	-- (genuinely, for the fucking safety's sake, i'm not fucking letting you in.)

	getAllDataStores(module)
	startAllSessions(module)
end


--------------------------------------------


--[[

Get data.

@param store string?

- The name of the store of which contains data you'd want to look for.

---------

@returns returnData {[string]: data} | data

<====   If no store is provided:   ====>

- A table of data, contains the data you want to retrieve.
- Index of the data is the name of store, and the value is data.


---------


<====     If store is provided     ====>


- The data of the given store, in form of a table.

]]
function module.getData(store: string?): {[string]: data} | data

	assert(module._configs ~= nil and module._content ~= nil, `[{script.Name}]: Invalid module.`)

	if not store then

		local returnData = {}

		for name_of_stores: string, profiles in module._content.dataContent do

			returnData[name_of_stores] = profiles.Data

		end

	end

	return module._content.dataContent[store].Data

end


--------------------------------------------



--[[

Function that saves data. Nothing much other than that.


@param store string

- The name of the dataStores inside the storeNameList that you would like to save the data on.


@param saveName string

- Name of the data of which you want to edit.


@param saveValue data

- New value of the said data.

]]
local function saveData(store: string, saveName: string, saveValue: data)


	-- Check params

	assert(store ~= nil, `[{script.Name}]: targetStoreName cannot be empty.`)

	assert(typeof(store) == "string", `[{script.Name}]: bad targetStoreName: string expected, got {typeof(store)}.`)

	assert(module._configs ~= nil and module._content ~= nil, `[{script.Name}]: Invalid module.`) -- There is a chance where the person forgot to use init so we got this inside.


	-- Rejects if we can't find targetStoreName inside store.

	if module._content.store[store] == nil then warn(`[{script.Name}]: {store} has yet registered as a store instance inside store, and failed to pass the startSession()!`) return end


	local data = module.getData(store)


	-- Warn if we can't find the data inside the store of that targetStoreName, essentially a fail-safe mechanism

	if data == nil then warn(`{script.Name}: Attempt to edit a key-value pair inside a table that doesn't exist!`) return end


	-- Now we can edit it.

	data[saveName] = saveValue


end


--------------------------------------------


--[[

Edit the configs of dataModule.


@param configType "storeNames" | "Template" | "misc"

- The avaliable types that you can edit.


@param subType "Server" | "Player" | string?

- The subType of the configType.


@param configName string

- The name of the config you'd like to edit. (duh)

@param newConfigValue any

- The new config value. (duh.. Nothing new.)


]]
function module.editConfigs(configType: "storeNames" | "Template" | "misc", subType: "Server" | "Player" | string?, configName: string, newConfigValue)


	-- check params time

	assert(typeof(configType) == "string", `[{script.Name}]: String expected for configType, got {typeof(configType)}`)

	assert(typeof(configName) == "string", `[{script.Name}]: String expected for configName, got {typeof(configName)}`)

	assert(module._configs ~= nil and module._content ~= nil, `[{script.Name}]: Invalid module.`)


	if not newConfigValue then error("newConfigValue cannot be nil.", 2) end


	-- Check if user trying to change something that has no subType inside. Yeah this has to change if you added something inside misc that has a table inside.

	if subType and configType == "misc" then error("ConfigType \"Misc\" has no subType inside!") end


	-- Just a configs scope check

	for index, name in canEditConfigs do

		if configType ~= name and index == 3 then error("Config type not found.", 2) end -- Only 3 items can be edited in the configs. And if we can't find that in the 3rd time, fuck it.

	end


	-- checks if the subType exists in configType and if the value actually exists as well

	if subType then


		if not module._configs[configType][subType] then error(`[{script.Name}]: Cannot find the subType ( {subType} ) inside the configType: {configType}`, 2) end

		if not module._configs[configType][subType][configName] then error(`[{script.Name}]: Cannot find the configName ( {configName} ) of the subType ( {subType} ) inside the configType: {configType}`, 2) end -- Holy chain.


		module._configs[configType][subType][configName] = newConfigValue


		-- otherwise just check the same thing but configType and its value instead of subType

	else


		if not module._configs[configType] then error(`[{script.Name}]: Cannot find the configType ( {configType} ) inside the configs of dataModule`, 2) end

		if module._configs[configType][configName] == nil then error(`[{script.Name}]: Cannot find the configName ( {configName} ) inside the configType: {configType}`, 2) end

		module._configs[configType][configName] = newConfigValue


	end


	-- Validate the changes

	fullCheckTypeConfigs(module._configs)


end

--[[

Important: This must be run inside a bindToClose function! (I.e. game:BindToClose(function() end))

--> This can result in an error where players are unable to rejoin due to the Is_Profile_Using flag is always true!!!


A function for setting Is_Profile_Using flag back to false.

]]
function module.OnClose()

	local yay_were_good_yay_good_job, oh_god_we_fucked_up_holy_shit = pcall(function()

		return central_Data_Module:UpdateAsync(module._configs.misc.userid..game.PrivateServerId, function(_content)

			_content.Is_Profile_Using = false

			return _content

		end)

	end)

end

--[[

A function for internal testing.

Feel free to ignore it.

]]
function module.Test()
	-- error(" < Internal testing: Typechecking >", 2)
end

----<  Public Functions end  >----


return module
