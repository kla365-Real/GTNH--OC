local rb = require("robot")
local Farm_Func = require("Farm_Func")
local component = require("component")
local sides = require("sides")
local geo = component.geolyzer
local Robot_Func = require("Robot_Func")
local Farm_Func = require("Farm_Func")
local Storage_Func = require("Storage_Func")
local Crossbreed = require("Crossbreed")
local configs = require("Configs")
local lvlCrop_Func = {}
slot = 0
function lvlCrop_Func.Position()
    local Data = Robot_Func.GetPosition()
    local Data1 = {Data[1],Data[3]}
    return(Data1)
end
function lvlCrop_Func.CheckType()
    local Data = geo.analyze(sides.bottom)
    if Data["crop:name"] ~= configs.Croplvl then
        Crossbreed.Replace()
    end    
end
function lvlCrop_Func.Check()
    local Data = geo.analyze(sides.bottom)
    local Pos = Robot_Func.GetPosition()
    local ResultPos = {Pos[1],Pos[3]}
    local PosStat = {}
    if Data["crop:growth"] ~= nil  and Data["crop:gain"] ~= nil then
    local Stat = Data["crop:growth"] + Data["crop:gain"]
        lvlCrop_Func.CheckType()
        PosStat = {ResultPos,Stat}     -- return Pos , stat
    end
    return(PosStat)
end
function lvlCrop_Func.Compare(table)
    local Num = -1
    local CompareData = {}
    local N = 5
    while Num ~= 100 do
        Num = Num + 1
        for x,y in pairs(table) do      -- pos,stat
            if Num == y[2] and y[2] ~= nil then
                N = N - 1
                CompareData[N] = {y[1],y[2]}
            end
        end
    end
   return(CompareData)
end
function lvlCrop_Func.Change(CompareData,Pos)
    --if CompareData[1][2] ~= nil and CompareData[2][2] ~= nil and CompareData[3][2] ~= nil and CompareData[4][2] ~= nil then
        local Result1 = CompareData[1][1][1] + CompareData[1][1][2]
        local Result2 = CompareData[2][1][1] + CompareData[2][1][2]
        if Result1 == Result2 or Result1 + 2 == Result2 or Result2 + 2 == Result1 then
            Robot_Func.Moveto(CompareData[3][1][1],CompareData[3][1][2])
            Crossbreed.Replace()
            Robot_Func.Moveto(CompareData[4][1][1],CompareData[4][1][2])
            Crossbreed.Replace()
        else
            Robot_Func.Moveto(CompareData[3][1][1],CompareData[3][1][2])
            rb.swingDown()
            Robot_Func.Moveto(CompareData[4][1][1],CompareData[4][1][2])
            rb.swingDown()
            Robot_Func.Moveto(CompareData[1][1][1],CompareData[1][1][2])
            Storage_Func.MoveCroptoStorage(1)
            Robot_Func.Moveto(CompareData[2][1][1],CompareData[2][1][2])
            Storage_Func.MoveCroptoStorage(2)
            Storage_Func.MoveStoragetoCrop(1,Pos[1][1][1],Pos[1][1][2])
            Storage_Func.MoveStoragetoCrop(2,Pos[3][1][1],Pos[3][1][2])
            Robot_Func.Moveto(Pos[4][1][1],Pos[4][1][2])
            Farm_Func.UseCropstick(2)
            Robot_Func.Moveto(Pos[2][1][1],Pos[2][1][2])
            Farm_Func.UseCropstick(2)
        end
    --end
end
function lvlCrop_Func.CheckPlot()
    local num = 0
    local PosStat = {}
    Farm_Func.DestroyWeed()
    PosStat[1] = lvlCrop_Func.Check()
    rb.turnLeft()
    rb.forward()
    rb.turnRight()
    Farm_Func.DestroyWeed()
    PosStat[2] = lvlCrop_Func.Check()
    rb.forward()
    Farm_Func.DestroyWeed()
    PosStat[3] = lvlCrop_Func.Check()
    rb.turnRight()
    rb.forward()
    rb.turnLeft()
    Farm_Func.DestroyWeed()
    PosStat[4] = lvlCrop_Func.Check()
    rb.back()
    return(PosStat)
end
return(lvlCrop_Func)
