local component = require("component")
local rb = require("robot")
local navi = component.navigation
local Robot_Func = {}
local sides = require("sides")
function Robot_Func.Forward(x)
    local num = 0
    repeat
        rb.forward()
        num = num + 1
    until num == x
end
function Robot_Func.Backward(x)
    local num = 0
    repeat
        rb.back()
        num = num - 1
    until num == x
end
function Robot_Func.GetPosition()
    local Data = {}
    local num = 0
    local x,y,z = navi.getPosition(x,y,z)
    Data = {x-0.5,y-0.5,z-0.5}
    return(Data)
end
function Robot_Func.Abs(x)
    if x <= 0 then
        return(-x)
    elseif x >= 0 then
        return(x)
    end
end
function Robot_Func.Moveto(x,z)
    local Data = Robot_Func.GetPosition()
    local xaxis = x - Data[1] 
    local zaxis = z - Data[3]
    if xaxis > 0 then
        Robot_Func.Forward(xaxis)
    elseif xaxis < 0 then
        Robot_Func.Backward(xaxis)
    end
    if zaxis > 0 then
        rb.turnRight()
        Robot_Func.Forward(zaxis)
        rb.turnLeft()
    elseif zaxis < 0 then
        rb.turnLeft()
        Robot_Func.Forward(Robot_Func.Abs(zaxis))
        rb.turnRight()
    end 
end
function Robot_Func.getDirection()
    local pos = navi.getFacing()
    if pos == 2 then
        return("north")
    elseif pos == 5 then
        return("east")
    elseif pos == 3 then
        return("south")
    elseif pos == 4 then
        return("west")
    end
end
function Robot_Func.turntoDirection(x)
    repeat
        rb.turnRight()
    until(Robot_Func.getDirection() == x)
end
return(Robot_Func)
