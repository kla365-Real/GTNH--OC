local Std = {}
local component = require("component")
function Std.GetAddress()
    local file = io.open("Address.txt","w")
    for x,y in pairs(component.list()) do
        file:write(x,"\t\t\t",y,"\n")
    end
    file:close()
end
function Std.printTable(table)
    for i, v in pairs(table) do
      print(v)  
    end
end
return(Std)