#! /usr/bin/env lua

--[[

    uarttx.lua - Lua Script to send data to UART interface.   

    Copyright (C) 2013 edwin chen <edwin@dragino.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

]]--

local modname = ...
local M = {}
_G[modname] = M

local nixio = require 'nixio'
local dev_uart = '/dev/ttyATH0'
local print = print

setfenv(1,M)

function DataToUART(message)
	local	serialout=nixio.open(dev_uart,"w")
	serialout:write(message)
	serialout:close()
end

return M