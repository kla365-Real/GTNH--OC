local Robot_Func = require("Robot_Func")
local config = require("Configs")
local rb = require("robot")
local component = require("component")
local inv = component.inventory_controller
local sides = require("sides")
local rs = component.redstone
local Storage_Func = {}
local Farm_Func = require("Farm_Func")
function Storage_Func.MovetoDislocation()
    Robot_Func.Moveto(config.Dislocation[1],config.Dislocation[3])
end
function Storage_Func.UseBinder()
    rb.select(3)
    inv.equip()
    rb.useDown(sides.bottom,true)
    inv.equip()
end
function Storage_Func.StorageSize()
    local length = math.abs(config.CropStoragePos1[1] - config.CropStoragePos2[1] -1)
    local wide = math.abs(config.CropStoragePos1[3] - config.CropStoragePos2[3] -1)
    local Data = {wide,length}
    return(Data)
end
function Storage_Func.StorageSlot(Slot)
    local Data = Storage_Func.StorageSize()
    local num = 0
    local xtotal = Slot
    while(xtotal >= Data[2]) do
        xtotal = xtotal - Data[2]
        num = num + 1
    end
    local Result = {xtotal,num}
    return(Result)
end
function Storage_Func.MovetoStorage(Slot)
    local Data = Storage_Func.StorageSlot(Slot)
    local x = Data[1]
    local z = Data[2]
    local xaxis = x + config.CropStoragePos1[1]
    local zaxis = z + config.CropStoragePos1[3]
    Robot_Func.Moveto(xaxis,zaxis)
end
function Storage_Func.MoveCroptoDislocation()
    local Data = Robot_Func.GetPosition()
    Storage_Func.MovetoDislocation()
    Storage_Func.UseBinder()
    Robot_Func.Moveto(Data[1],Data[3])
    Storage_Func.UseBinder()
    Storage_Func.MovetoDislocation()
    rs.setOutput(sides.down,15)
    rs.setOutput(sides.down,0)
end
function Storage_Func.MoveCroptoStorage(Slot)
    slot = slot + 1
    local Data = Robot_Func.GetPosition()
    direction = Robot_Func.getDirection()
    Robot_Func.turntoDirection("east")
    Storage_Func.MovetoDislocation()
    Storage_Func.UseBinder()
    Robot_Func.Moveto(Data[1],Data[3])
    Storage_Func.UseBinder()
    Storage_Func.MovetoDislocation()
    rs.setOutput(sides.down,15)
    rs.setOutput(sides.down,0)
    Storage_Func.UseBinder()
    Storage_Func.MovetoStorage(Slot)
    Storage_Func.UseBinder()
    Storage_Func.MovetoDislocation()
    rs.setOutput(sides.down,15)
    rs.setOutput(sides.down,0)
    Robot_Func.Moveto(Data[1],Data[3])
    Robot_Func.turntoDirection(direction)
end
function Storage_Func.MoveStoragetoCrop(Slot,x,z)
    Storage_Func.MovetoDislocation()
    Storage_Func.UseBinder()
    Storage_Func.MovetoStorage(Slot)
    Storage_Func.UseBinder()
    Storage_Func.MovetoDislocation()
    rs.setOutput(sides.down,15)
    rs.setOutput(sides.down,0)
    Storage_Func.UseBinder()
    Robot_Func.Moveto(x,z)
    Storage_Func.UseBinder()
    Storage_Func.MovetoDislocation()
    rs.setOutput(sides.down,15)
    rs.setOutput(sides.down,0)
end
return(Storage_Func)

