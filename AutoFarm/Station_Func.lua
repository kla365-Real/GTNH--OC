local component = require("component")
local Robot_Func = require("Robot_Func")
local config = require("Configs")
local rb = require("robot")
local inv = component.inventory_controller
local sides = require("sides")
local Station_Func = {}
function Station_Func.MovetoCharger()
    Robot_Func.Moveto(config.Chargerlocation[1],config.Chargerlocation[3])
    os.sleep(5)
end
function Station_Func.FillCropstick()
    Robot_Func.Moveto(config.StorageInput[1],config.StorageInput[3])
    rb.select(2)
    inv.suckFromSlot(0,2,(64 - rb.count(2)))
end
function Station_Func.StoreItem()
    local num = 3
    Robot_Func.Moveto(config.StorageOutput[1],config.StorageOutput[3])
    repeat
        num = num + 1
        rb.select(num)
        inv.dropIntoSlot(sides.down,num,rb.count(num))
    until num == 16
end
return(Station_Func)