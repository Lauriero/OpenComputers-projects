local multiserver = dofile("lib/multiserver.lua");
local thread = require("thread");

multiserver.start(8888);

thread.create(multiserver.enableListeningToSlaves);

while true do
	multiserver.sendCommand(io.read());
end
