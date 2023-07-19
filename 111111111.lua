local PROJECT = menu.add_submenu("Best Recovery With Kiddion By PROJECT")
local ORBITAL = PROJECT:add_submenu("Orbital Refund")
local NIGHTCLUBSAFE = PROJECT:add_submenu("Nightclub Safe")
local SPECIALCARGO = PROJECT:add_submenu("Special Cargo")
local MISC = PROJECT:add_submenu("Misc")
-- Oribtal Refund
local function add500k()
	globals.set_int(1969112, 1)
	sleep(0.5)
	globals.set_int(1969112, 0)
end

local function add750k()
	globals.set_int(1969112, 2)
	sleep(0.5)
	globals.set_int(1969112, 0)
end

local function add1250k()
	add500k()
	sleep(0.5)
	add750k()
end

ORBITAL:add_action("Add 500K", function()
	add500k()
end)

ORBITAL:add_action("Add 750K", function()
	add750k()
end)

ORBITAL:add_action("Add 1250K", function()
	add1250k()
end)

orbitalloop = false

ORBITAL:add_toggle("Loop 1.25M", function()
	return orbitalloop
end, function()
	orbitalloop = not orbitalloop
	if orbitalloop then
		repeat
			add500k()
			sleep(11)
			add750k()
			sleep(11)
		until orbital == false
	else
		orbital = false
	end
end)

-- Nightclub Safe
local function nightclub300k()
	globals.set_int(262145 + 24227, 300000)
	globals.set_int(262145 + 24223, 300000)
	stats.set_int("MP0_CLUB_POPULARITY", 1000)
	stats.set_int("MP1_CLUB_POPULARITY", 1000)
	stats.set_int("MP0_CLUB_PAY_TIME_LEFT", -1)
	stats.set_int("MP1_CLUB_PAY_TIME_LEFT", -1)
end

NIGHTCLUBSAFE:add_action("Nightclub Safe 300K", function()
	nightclub300k()
end)

NIGHTCLUBSAFE:add_action("Nightclub Popularity", function()
	stats.set_int("MP0_CLUB_POPULARITY", 1000)
	stats.set_int("MP1_CLUB_POPULARITY", 1000)
end)

nightclubloop = false
NIGHTCLUBSAFE:add_toggle("Loop 300K", function()
	return nightclubloop
end, function()
	nightclubloop = not nightclubloop
	if nightclubloop then
		repeat
			nightclub300k()
			sleep(4)
		until nightclubloop == false
	else
		nightclubloop = false
	end
end)

-- Special Cargo
removebuycooldown = false
SPECIALCARGO:add_toggle("Remove Buy Cooldown", function()
	return removebuycooldown
end, function()
	removebuycooldown = not removebuycooldown
	if removebuycooldown then
		globals.set_int(262145 + 15728, 0)
	end
end)

removesellcooldown = false
SPECIALCARGO:add_toggle("Remove Sell Cooldown", function()
	return removesellcooldown
end, function()
	removesellcooldown = not removesellcooldown
	if removesellcooldown then
		globals.set_int(262145 + 15729, 0)
	end
end)

SPECIALCARGO:add_action("Buy Crate", function()
	buy_mission = script("gb_contraband_buy")
	if buy_mission:is_active() then
		buy_mission:set_int(599+192, 4)
	end
end)

SPECIALCARGO:add_action("Sell Crate", function()
	sell_mission = script("gb_contraband_sell")
	if sell_mission:is_active() then
		sell_mission:set_int(541+7, 1)
		sell_mission:set_int(541+57, 5)
	end
end)

maxprice = false
SPECIALCARGO:add_toggle("Max Price", function()
	return maxprice
end, function()
	maxprice = not maxprice
	if maxprice then
	    sale_price = 6000000
		base_address = 15963
		globals.set_int(262145+base_address, sale_price)
	    globals.set_int(262145+base_address + 1, sale_price//2)
    end
end)

-- MISC
bypasstransactionerror = false
MISC:add_toggle("Bypass Transaction Error", function()
	return bypasstransactionerror
end, function()
	bypasstransactionerror = not bypasstransactionerror
	if bypasstransactionerror then
		globals.set_int(4536677 ,0)
	end
end)
