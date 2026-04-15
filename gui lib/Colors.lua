
local Color = {
    ["Black"] = 30,
    ["Red"] = 31,
    ["Green"] = 32,
    ["Yellow"] = 33,
    ["Blue"] = 34,
    ["Purple"] = 35,
    ["LightBlue"] = 36,
    ["White"] = 37
}
function ColorThing(string,color)
    local Reset = "\x1b[0m"
    local data_color = Color[color]
    local esc_color = ("\x1b["..data_color.."m")
    local result = (esc_color..string..Reset)
    return(result)
end
function TextStyle()
    
end