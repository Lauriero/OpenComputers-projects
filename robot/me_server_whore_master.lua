local component = require "component";
local event = require "event"

function log (sender, message)
	print("["..sender.."] : "..message);
end


log("master", "I wanna listen a port which my whore is listening on");
port = io.read();
if port == "" then
	port = 8000;
end

component.modem.open(port);
component.modem.broadcast(port, "Suck this cell out, whore!");

log("master", "Waiting for answer...");
while true do
	local _, _, from, port, _, message = event.pull("modem_message");
	if message == "I did it for you, honey" then
		log("master", "Whore did it well");
		break;
	end
end
