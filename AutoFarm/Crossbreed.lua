local config = require("Configs")
local rb = require("robot")
local Robot_Func = require("Robot_Func")
local Farm_Func = require("Farm_Func")
local Storage_Func = require("Storage_Func")
local config = require("Configs")
local sides = require("sides")
local component = require("component")
local geo = component.geolyzer
local Crossbreed = {}
function Crossbreed.Replace()
    Farm_Func.UseSpade()
    Farm_Func.UseCropstick(1)
end
function Crossbreed.Crossbreed()
    local Data = geo.analyze(sides.down)
    local num = 0
    repeat
        num = num + 1
    until (Data[num] == nil)
    num = num - 1
    for x,y in pairs(config.Blacklist) do
        if Data["crop:name"] == y then
            return(Crossbreed.Replace())
        end
    end
    if Data["crop:name"] == "weed" then
        return(Crossbreed.Replace())
    elseif Data["crop:name"] == nil then
        return(Farm_Func.UseCropstick(1))
    elseif Data["name"] == "minecraft:air" then
        return(Farm_Func.UseCropstick(2))
    else
        direction = Robot_Func.getDirection()
        Storage_Func.MoveCroptoStorage(slot)
        return(Farm_Func.UseCropstick(2))
    end
end
function Crossbreed.PlotCrossbreed()
    local num = 1
    local num1 = 1
    Crossbreed.Crossbreed()
    repeat
        num = num + 1
        Robot_Func.Forward(3)
        Crossbreed.Crossbreed()
    until(num == config.Plotlength)
    Robot_Func.Forward(1)
    rb.turnLeft()
    Robot_Func.Forward(1)
    rb.turnLeft()
    Crossbreed.Crossbreed()
    repeat
        num1 = num1 + 1
        Robot_Func.Forward(3)
        Crossbreed.Crossbreed()
    until(num1 == config.Plotlength)
    Robot_Func.Forward(1)
    rb.turnRight()
    Robot_Func.Forward(2)
    rb.turnRight()
end
return(Crossbreed)