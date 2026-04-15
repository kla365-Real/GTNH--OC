local Colors = require("Colors")
local wide = 100
local height = 15
table = {}
function String_add(string,string1)
    local string = string..string1
    return(string)
end
function resolution(wide,height)
    local resolution = {wide/2,height}
    return(resolution)
end
function getSize()
    local reso = resolution(wide,height)
    local Size = reso[1]*reso[2]
    return(Size)
end
function Convert(x,y)          --x = wide  y = height
    local slot = (((y-1)*(wide/2))+x)
    return(slot)
end
function set()
    local num = 0
    repeat
        num = num + 1
        table[num] = "  "
    until num == getSize()
    return(table)
end
function setblackground(color)
    local num = 0
    repeat
        num = num + 1
        table[num] = ColorThing("██",color)
    until(num == getSize())
    return(table)
end
function Render()
    local result = {}
    local num = 0
    local num1 = 0
    repeat
        num1 = num1 + 1
        result[num1] = ""
        repeat
            num = num + 1
            result[num1] = String_add(result[num1],table[num])
        until num == (wide/2)*num1
    until(num1 == height)
    for x,y in pairs(result) do
        print(y)
    end
end
function Draw(mark,color)
    for x,y in pairs(mark) do
        table[y] = ColorThing("██",color)
    end
end
function Line(Pos1,Pos2)
    local deltax = Pos2[1] - Pos1[1]
    local deltay = Pos2[2] - Pos1[2]
    local Data = {}
    local numx = 0
    local xcoordinate = {}
    local numy = 0
    local ycoordinate = {}
    local mark = {}
    local coordtotal = deltax+deltay+1
    local numx2 = 0
    repeat
        numx = numx + 1
        if deltax == 0 then
            xcoordinate[numx] = Pos1[1]
        else
            xcoordinate[numx] = Pos1[1] + (numx-1)
        end
    until(numx == coordtotal)
    repeat
        numy = numy + 1
        if deltay == 0 then
            ycoordinate[numy] = Pos1[2]
        else
            ycoordinate[numy] = Pos1[2] + (numy-1)
        end
    until(numy == coordtotal)
    local num2 = 0
    repeat
        num2 = num2 + 1
        mark[num2] = Convert(xcoordinate[num2],ycoordinate[num2])
    --    print(xcoordinate[num2],ycoordinate[num2])
    until(num2 == (deltax+deltay+1))
    return(mark)
end
function Rectangle(Pos1,Pos2,Hollow,Color)
    if Hollow == "True" then
        Draw((Line(Pos1,{Pos1[1],Pos2[2]})),Color)
        Draw((Line(Pos1,{Pos2[1],Pos1[2]})),Color)
        Draw((Line({Pos2[1],Pos1[2]},Pos2)),Color)
        Draw((Line({Pos1[1],Pos2[2]},Pos2)),Color)
    elseif Hollow == "False" then
        local num = -1
        repeat
            num = num + 1
            Draw((Line({Pos1[1],Pos1[2]+num},{Pos2[1],Pos1[2]+num})),Color)
        until(num == Pos2[2])
    end 
end
function Circle(h,k,r,Hollow,Color)
    local num = 0
    local Data1 = {}
    repeat
        num = num + 1
        local xaxis = (h-r)+num
        Data1[xaxis] = Convert(xaxis,(k + math.sqrt((r^2)-(num-r)^2)))
        Data1[xaxis+1] = Convert(xaxis,(k - math.sqrt((r^2)-(num-r)^2)))
        print(num)
    until ((2*h+2*r-2)==num)
    Draw(Data1,"Red")
end
set()
setblackground("Blue")
Rectangle({2,2},{20,10},"False","Green")
Render()
--for x,y in pairs(Circle(6,6,5)) do
--    print(y)
--end
Circle(6,6,5,"","")
Render()
print("end")