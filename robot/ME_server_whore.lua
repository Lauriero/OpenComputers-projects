local component = require "component";
local sides = require "sides";
local event = require "event";

function log (sender, message)
	print("["..sender.."] : "..message);
end

local port = 0;

--Start of programm--
log("whore", "Hello sexy boy, I wanna you to say me a port which i will listen to you commands on");
port = io.read();
if port == "" then
	port = 8000;
end

component.modem.open(tonumber(port));

log("whore", "Ok, waiting for you commands, honey");
while true do
	local _, _, from, _, _, message = event.pull("modem_message");
	if message == "Suck this cell out, whore!" then
		component.robot.suck(sides.front);
		os.sleep(.5);
		component.robot.drop(sides.front);

		log("whore", "I did it for my master");
		component.modem.send(from, port, "I did it for you, honey");
	end

	os.sleep();
end
