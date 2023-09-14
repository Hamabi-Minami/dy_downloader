component = require('component')
sides = require('sides')
rs = component.redstone
reactor = component.reactor_chamber

print('reactor running')


while true do
    if rs.getInput(sides.front) == 15 then
        rs.setOutput(sides.back, 0)
        rs.setOutput(sides.front, 0)
        rs.setOutput(sides.left, 0)
        rs.setOutput(sides.right, 0)
        break
    else
      if reactor.getHeat() > 3000 then
        rs.setOutput(sides.back, 0)
      else
        rs.setOutput(sides.back, 15)
        rs.setOutput(sides.front, 15)
        rs.setOutput(sides.left, 15)
        rs.setOutput(sides.right, 15)
      end
    end
end


local version="8.0"

local component = require("component")
local computer = require("computer")
local event = require("event")
local term = require("term")
local sides = require

("sides")

local gpu = component.gpu
local beep = component.computer.beep
local reactor=component.reactor_chamber

local rodSlot = component.inventory_controller.getStackInSlot

--reactor
Heat=reactor.getMaxHeat
getHeat=reactor.getHeat
EUOutput=reactor.getReactorEUOutput
--reactor

--tables
local items={}
local currentRods={}
local rodTypes={"gt.reactorUraniumQuad.name", "gt.reactorMOXQuad.name", "gt.Quad_Thoriumcell.name"}
local rodEmpty={"Quad Fuel Rod (Depleted Uranium)", "Quad Fuel Rod (Depleted MOX)", "gt.Quad_ThoriumcellDep.name"}
--tables

--rods
local rod1 = rodSlot(1, 21)
local rod2 = rodSlot(1, 25)
local rod3 = rodSlot(1, 30)
local rod4 = rodSlot(1, 34)
--rods

--rod functions
local function draw1()
  if currentRods[1] == rodTypes[1] then
    return "U"
  elseif currentRods[1] == rodEmpty[1] then
    return "0"
  elseif currentRods[1] == rodTypes[2] then
    return "M"
  elseif currentRods[1] == rodEmpty[2] then
    return "0"
  elseif currentRods[1] == rodTypes[3] then
    return "T"
  elseif currentRods[1] == rodEmpty[3] then
    return "0"
  elseif currentRods[1] == "empty" then
    return "E"
  end
  end

local function draw2()
  if currentRods[2] == rodTypes[1] then
    return "U"
  elseif currentRods[2] == rodEmpty[1] then
    return "0"
  elseif currentRods[2] == rodTypes[2] then
    return "M"
  elseif currentRods[2] == rodEmpty[2] then
    return "0"
  elseif currentRods[2] == rodTypes[3] then
    return "T"
  elseif currentRods[2] == rodEmpty[3] then
    return "0"
  elseif currentRods[2] == "empty" then
    return "E"
  end
  end

local function draw3()
  if currentRods[3] == rodTypes[1] then
    return "U"
  elseif currentRods[3] == rodEmpty[1] then
    return "0"
  elseif currentRods[3] == rodTypes[2] then
    return "M"
  elseif currentRods[3] == rodEmpty[2] then
    return "0"
  elseif currentRods[3] == rodTypes[3] then
    return "T"
  elseif currentRods[3] == rodEmpty[3] then
    return "0"
  elseif currentRods[3] == "empty" then
    return "E"
  end
  end

local function draw4()
  if currentRods[4] == rodTypes[1] then
    return "U"
  elseif currentRods[4] == rodEmpty[1] then
    return "0"
  elseif currentRods[4] == rodTypes[2] then
    return "M"
  elseif currentRods[4] == rodEmpty[2] then
    return "0"
  elseif currentRods[4] == rodTypes[3] then
    return "T"
  elseif currentRods[4] == rodEmpty[3] then
    return "0"
  elseif currentRods[4] == "empty" then
    return "E"
  end
  end
--rod functions

--colors
local black = 0x000000
local red = 0xFF0000
local yellow = 0xFFFF00
local white = 0xffffff
--colors

local start_time = computer.uptime()

local modem = component.modem

local w,h = gpu.getResolution()

--maxResolution() 160x50 if 3x2blocks w,h

-- place for config
-------------------
-- end of config


--start_time

--timer
local tickCnt = 0
local running = true
local hours = 0
local mins = 0
--timer

local function centerF(row, msg, ...)
  local mLen = string.len(msg)
  w, h = gpu.getResolution()
  term.setCursor((w - mLen)/2,row)
  print(msg:format(...))
end

--more functions
local function status()
  if EUOutput() == 0 then
  return "offline"
  else
  return "online "
  end
end

local function maxheat()
  return reactor.getMaxHeat()
  end

local function getheat()
  if getHeat() == 0 then
  return "0   "
  else
  return reactor.getHeat()
  end
end

local function getEU()
  if EUOutput() == 0 then
  return "0   "
  else
  return reactor.getReactorEUOutput()
  end
end
--more functions

gpu.setForeground(0xffffff)


-----
term.clear()
term.setCursor(1,1)

centerF(5,  "-----------------------------------------")
centerF(6,  "-       IC2 Reactor Controller V8       -")
centerF(7,  "-----------------------------------------")
centerF(8, string.format("- Reactor is:             %s       -",status()))
centerF(9, string.format("- Reactor maxheat:        %s         -",maxheat()))
centerF(10, string.format("- Reactor heat:           %s          -",  getheat()))
centerF(11, string.format("- Reactor EU Output:      %s          -",  getEU()))
centerF(12, "-----------------------------------------")
centerF(13, "-                                       -")
centerF(14, "-----------------------------------------")

while true do

  centerF(15, "-----------------------------")
  centerF(16, "-     Reactor Fuel Rods     -")
  centerF(17, "-----------------------------")
  centerF(18, "                             ")
  centerF(19, "          ---------          ")
  centerF(20, "                             ")
  centerF(21, "                             ")
  centerF(22, "          ---------          ")
  centerF(23, "                             ")
  centerF(24, "-----------------------------")

  tickCnt = tickCnt + 1
  if tickCnt == 60 then
    mins = mins + 1
    tickCnt = 0
  end

  if mins == 60 then
    hours = hours + 1
    mins = 0
  end

  rod1 = rodSlot(1, 21)
  if rod1 ~= nil then
    currentRods[1]=rod1.label
   else
    currentRods[1]="empty"
  end

  rod2 = rodSlot(1, 25)
  if rod2 ~= nil then
    currentRods[2]=rod2.label
   else
    currentRods[2]="empty"
  end

    rod3 = rodSlot(1, 30)
  if rod3 ~= nil then
    currentRods[3]=rod3.label
    else
    currentRods[3]="empty"
  end

    rod4 = rodSlot(1, 34)
  if rod4 ~= nil then
    currentRods[4]=rod4.label
    else
    currentRods[4]="empty"
  end

  centerF(20, string.format("--%s---%s--",draw1(),draw2()))
  centerF(21, string.format("--%s---%s--",draw3(),draw4()))

  centerF(8, string.format("- Reactor is:             %s       -",status()))
  centerF(9, string.format("- Reactor maxheat:        %s         -",maxheat()))
  centerF(10, string.format("- Reactor heat:           %s          -",  getheat()))
  centerF(11, string.format("- Reactor EU Output:      %s          -",  getEU()))
  centerF(30, "Data updates every second: %2d", tickCnt)
  centerF(31, "Current up time: %2d hours %2d min", hours, mins)

  --beep()
  os.sleep(1)

end