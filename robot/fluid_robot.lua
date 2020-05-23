local component = require "component";
local robot = require "robot";
local event = require "event";
local thread = require ("thread");

--Constants and config

modem = component.modem;

local defaultPort = 8888;

local fluids_recipies = {

};

--Variables

local backgroundThreads = {};
local port = defaultPort;
local controllerId = "";

--Begin

init();
table.insert(backgroundThreads, thread.create(loopHandler(workLoop)));
table.insert(backgroundThreads, thread.create(loopHandler(modemListenLoop)));

--Functions

function init()
	log("robot", "Program is started");
end

function workLoop()
	os.sleep(5);
end

function modemListenLoop()
	--Here is listener to incoming modem message
	while true do
		local _, _, from, port, _, message = event.pull("modem_message");
		if message == "You are under my control!" and (controllerId == "" or controllerId ~= from) then
			controllerId = from;
			modem.send(controllerId, port, "I'm ready to work");
			log("robot", "Controller founded - "..controllerId);
		end
	end
end

function loopHandler(func)
	while true do
		func();
		os.sleep();
	end
end

function log(sender, message)
	print("["..sender.."] : "..message);
end
