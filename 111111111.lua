Lua_Title = "2Take1 - PROJECT PRIVATE LUA"

local PRIVATE_LUA = menu.add_feature(Lua_Title, "parent", nil)
local ORBITAL_MONEY = menu.add_feature("Money Option","parent",PRIVATE_LUA.id, nil)
local CARGO_MONEY = menu.add_feature("Special Cargo Option", "parent",PRIVATE_LUA.id, nil)
local ETC_FUCKTION = menu.add_feature("Tool Option", "parent",PRIVATE_LUA.id, nil)

ORBITAL_VALUE = 1968313
GLOBAL_VALUE = 262145

if menu.is_trusted_mode_enabled()then
	menu.create_thread(function()
		menu.notify("This Lua Script is forbidden to share with someone.\nGet permission from the creator if you want to share this Lua Script", Lua_Title, 12, 0x00FFFFFF)

		menu.add_feature("$500,000","action", ORBITAL_MONEY.id, function(f)
			script.set_global_i(ORBITAL_VALUE,1)
			system.yield(500)
			script.set_global_i(ORBITAL_VALUE,0)
			system.yield(500)
		end)
		menu.add_feature("$750,000","action", ORBITAL_MONEY.id, function(f)
			script.set_global_i(ORBITAL_VALUE,2)
			system.yield(500)
			script.set_global_i(ORBITAL_VALUE,0)
			system.yield(500)
		end)
		menu.add_feature("$1,250,000","action", ORBITAL_MONEY.id, function(f)
			script.set_global_i(ORBITAL_VALUE,1)
			system.yield(250)
			script.set_global_i(ORBITAL_VALUE,0)
			system.yield(250)
			script.set_global_i(ORBITAL_VALUE,2)
			system.yield(250)
			script.set_global_i(ORBITAL_VALUE,0)
			system.yield(250)
		end)

		Money_Loop = menu.add_feature("$1,250,000 Loop","toggle", ORBITAL_MONEY.id, function(f)
			while true do
				script.set_global_i(ORBITAL_VALUE,1)
				system.yield(500)
				script.set_global_i(ORBITAL_VALUE,0)
				system.yield(11500)
				script.set_global_i(ORBITAL_VALUE,2)
				system.yield(500)
				script.set_global_i(ORBITAL_VALUE,0)
				system.yield(11500)
			end
			while false do
				return HANDLER_CONTINUE
			end
		end)
		
		local Max_Sell_Price = function(feat)
			menu.notify("123")
			script.set_global_i(GLOBAL_VALUE + 15788, 6000000)
			if feat.on then
				return HANDLER_CONTINUE
			end
		end
		menu.add_feature("Max Sell Price","toggle", CARGO_MONEY.id, nil).renderer = Max_Sell_Price
		
		local TRANSACTION_BYPASS = function(feat)
			if script.get_global_i(4536679) == 20 or script.get_global_i(4536679) == 4 then
				script.set_global_i(4536673,0)
			end
			if feat.on then
				return HANDLER_CONTINUE
			end
		end
		menu.add_feature("Transaction Error Bypass","toggle", ETC_FUCKTION.id, nil).renderer = TRANSACTION_BYPASS
	end)
else
	menu.notify("The Lua Script won't work if you don't do the following.\n\nTurn on all trusted mode (Stats, Globals/Locals, Natives, Http, Memory)",Lua_Title, 12, 0x00ffffff)
	menu.exit()
end
