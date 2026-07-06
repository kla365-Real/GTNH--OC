local component = require("component")
local GTDP = {}
function GTDP.printtable (x)
    for i,v in pairs(x) do
        print(i,v)
    end
end
function GTDP.CleanData(table)
    local pattern = {"§r","§a","§e","§c","§9","§6","§"}
    for x,y in pairs(table) do
        for i,v in pairs(pattern) do
            table[x] = string.gsub(table[x],v,"")
        end
    end
end
function GTDP.GT_Debug(address)
    local GT = component.proxy(address)
    for x,y in pairs(GT) do
        print(x,y)
    end
end
function GTDP.GetAddress()
    local file = io.open("Address.txt","w")
    for i,v in pairs(component.list()) do
        file:write(v,"\t",i,"\n")
    end
    file:close()
end
function GTDP.GT_Turbine(Address)
    local GT = component.proxy(Address)
    local table = {}
    table[1] = GT.getName()
    local num = 1
    for x,y in pairs(GT.getSensorInformation()) do
        num = num + 1
        table[num] = y
    end
    GTDP.CleanData(table)
    local result = {}
    result["Name"] = table[1]
    result["Status"] = table[2]
    result["Maintain"] = table[3]
    result["Efficiency"] = table[4]
    result["Stored Energy"] = table[5]
    result["Turbine Damage"] = table[8]
    return(result)
end
function GTDP.GT_Tank(Address)
    local GT = component.proxy(Address)
    local table = {}
    table[1] = GT.getName()
    local num = 1
    for x,y in pairs(GT.getSensorInformation()) do
        num = num + 1
        table[num] = y
    end
    GTDP.CleanData(table)
    local result = {}
    result["Name"] = table[2]
    result["Type"] = table[4]
    result["Stored"] = table[5]
    return(result)
end
return(GTDP)
