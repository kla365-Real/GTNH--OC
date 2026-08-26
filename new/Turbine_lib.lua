local component = require("component")
local GT_machine = require("GT_machinelib")
local Turbine = {}
function Turbine.running(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[1])
    return(Result)
end
function Turbine.Maintain(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[2])
    return(Result)
end
function Turbine.Speed(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[3])
    return(Result)
end
function Turbine.Stored_Energy(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[4])
    return(Result)
end
function Turbine.Optimal_Flow(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[5])
    return(Result)
end
function Turbine.Fuel_Remaining(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[6])
    return(Result)
end
function Turbine.Damage(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[7])
    return(Result)
end
function Turbine.Pollution(address)
    local Data = component.proxy(address).getSensorInformation()
    local Result = GT_machine.Cleandata(Data[8])
    return(Result)
end
return(Turbine)