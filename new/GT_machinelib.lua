local component = require("component")
local GT_machine = {}
function GT_machine.Cleandata(str)
    local patterns = {"§r","§a","§e","§c","§"}
    for i,v in pairs(patterns) do
        str = string.gsub(str,v,"")
    end
    return(str)
end
function GT_machine.Sensor_All_Status(address)
    local Data = component.proxy(address).getSensorInformation()
    local i = 1
    local Result = {}
    for i, v in pairs(Data) do
        Result[i] = GT_machine.Cleandata(Data[i])
        i = i + 1
    end
    return(Result)
end
return(GT_machine)