local component = require "component";
local term = require "term";
local event = require "event";
local thread = require("thread");

-- file = io.open("items.csv", "r");
-- io.input(file);
--
-- items = {};
-- buffer = "";
-- while true do
-- 	buffer = io.read();
-- 	if buffer == nil then
-- 		break;
-- 	end
-- 	table.insert(items, buffer);
-- 	os.sleep();
-- end

function printN(x, y, num)
	term.setCursor(x, y);
	print(num);
end

print("starting calculating items");
x = os.time();
count = 0;
console_x, console_y = term.getCursor();

print("t1 started");
for i = 1, 1000 do
	os.sleep();
	result = component.me_interface.getItemsInNetwork({name = "minecraft:stone"});
	count = count + 1;
	printN(console_x, console_y + 4, count);
end
print("t1 ended");


thread.waitForAll({t1, t2, t3, t4});

print("Thread dead");

print(os.time() - x);
