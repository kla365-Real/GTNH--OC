local lvlCrop_Func = require("lvlCrop_Func")
local Farm_Func = require("Farm_Func")
local rb = require("robot")
local Storage_Func = require("Storage_Func")
local Robot_Func = require("Robot_Func")
local Spread_Func = {}
local Crossbreed = require("Crossbreed")
local Configs = require("Configs")
slot = 0
function Spread_Func.CheckPlot()
    local PosStat = {}
    Farm_Func.DestroyWeed()
    rb.turnLeft()
    rb.forward()
    rb.turnRight()
    Farm_Func.DestroyWeed()
    PosStat[1] = lvlCrop_Func.Check()
    rb.forward()
    Farm_Func.DestroyWeed()
    rb.turnRight()
    rb.forward()
    rb.turnLeft()
    Farm_Func.DestroyWeed()
    PosStat[2] = lvlCrop_Func.Check()
    rb.back()
    return(PosStat)
end
function Spread_Func.Spread(boolean)
    local PosStat = Spread_Func.CheckPlot()
        if boolean == true then
            if PosStat[1][2] ~= nil and PosStat[1][2] == 23 and PosStat[1][3] == 31 then
                Robot_Func.Moveto(PosStat[1][1][1],PosStat[1][1][2])
                Storage_Func.MoveCroptoStorage(slot)
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            elseif PosStat[2][2] ~= nil and PosStat[2][2] == 23 and PosStat[2][3] == 31 then
                Robot_Func.Moveto(PosStat[2][1][1],PosStat[2][1][2])
                Storage_Func.MoveCroptoStorage(slot)
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            elseif PosStat[1][2] ~= nil and (PosStat[1][2] ~= 23 or PosStat[1][3] ~= 31) then
                Robot_Func.Moveto(PosStat[1][1][1],PosStat[1][1][2])
                Crossbreed.Replace()
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            elseif PosStat[2][2] ~= nil and (PosStat[2][2] ~= 23 or PosStat[2][3] ~= 31) then
                Robot_Func.Moveto(PosStat[2][1][1],PosStat[2][1][2])
                Crossbreed.Replace()
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            end
        elseif boolean == false then
            if PosStat[1][2] ~= nil and PosStat[1][2] == 21 and PosStat[1][3] == 31 then
                Robot_Func.Moveto(PosStat[1][1][1],PosStat[1][1][2])
                Storage_Func.MoveCroptoStorage(slot)
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            elseif PosStat[2][2] ~= nil and PosStat[2][2] == 21 and PosStat[2][3] == 31 then
                Robot_Func.Moveto(PosStat[2][1][1],PosStat[2][1][2])
                Storage_Func.MoveCroptoStorage(slot)
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            elseif PosStat[1][2] ~= nil and (PosStat[1][2] ~= 21 or PosStat[1][3] ~= 31) then
                Robot_Func.Moveto(PosStat[1][1][1],PosStat[1][1][2])
                Crossbreed.Replace()
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            elseif PosStat[2][2] ~= nil and (PosStat[2][2] ~= 21 or PosStat[2][3] ~= 31) then
                Robot_Func.Moveto(PosStat[2][1][1],PosStat[2][1][2])
                Crossbreed.Replace()
                Robot_Func.Moveto(Configs.FarmPos1[1],Configs.FarmPos1[3])
            end
        end
end
return(Spread_Func)