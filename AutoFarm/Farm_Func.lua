local component = require("component")
local rb = require("robot")
local config = require("Configs")
local Robot_Func = require("Robot_Func")
local geo = component.geolyzer
local inv = component.inventory_controller
local Farm_Func = {}
local sides = require("sides")
function Farm_Func.UseSpade()
    rb.select(1)
    inv.equip()
    rb.useDown()
    inv.equip()
end
function Farm_Func.UseCropstick(x)
    rb.select(2)
    inv.equip()
    local num = 0
    repeat
        num = num + 1
        rb.useDown()
    until num == x
    inv.equip()
end
function Farm_Func.Analyze()
    local Data = {}
    local num = 0
    for x,y in pairs(geo.analyze(sides.down)) do
        num = num + 1
        Data[num] = y
    end
    return(Data)
end
function Farm_Func.DestroyWeed()
    local Data = Farm_Func.Analyze()
    for x,y in pairs(Data) do
        if y == "weed" then
            Farm_Func.UseSpade()
            Farm_Func.UseCropstick(1)
        else
        end
    end
end
function Farm_Func.FarmSize()
    local Data = {}
    local length = math.abs(config.FarmPos1[1] - config.FarmPos2[1]) +1
    local wide = math.abs(config.FarmPos1[3] - config.FarmPos2[3]) +1
    Data = {wide,length}
    return(Data)
end
return(Farm_Func)
