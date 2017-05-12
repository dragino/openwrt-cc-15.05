--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008-2011 Jo-Philipp Wich <xm@subsignal.org>
Copyright 2013 Edwin Chen <edwin@dragino.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

module("luci.controller.admin.network", package.seeall)

function index()
	local utility = require("dragino.utility")
	local has_siod=string.find(utility.getVersion(),"SIOD")
	entry({"admin", "network"}, alias("admin", "network","network"), "Network", 40).index = true
	if has_siod == nil then
		entry({"admin", "network","network"}, cbi("secn/network"), "Internet Access", 10)
		entry({"admin", "network","lan"}, cbi("secn/lan"), "LAN and DHCP", 11)
		entry({"admin", "network","ap"}, cbi("secn/ap"), "Access Point", 30)
		entry({"admin", "network","mesh"}, cbi("secn/mesh"), "Mesh Network", 40)
	else
		entry({"admin", "network","network"}, cbi("siod/network"), "Network", 10)
	end
end
