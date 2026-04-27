local M = {
    Dislocation = {6,8,30},   -- location of dislocation
    CropStoragePos1 = {1,8,32},   -- corner of Storage
    CropStoragePos2 = {11,8,42},   -- corner of Storage
    FarmPos1 = {1, 8, 28},      -- corner of Farm
    FarmPos2 = {11, 8, 18},      -- corner of Farm
    Chargerlocation = {-1,8,23},-- charger position
    Plotlength = 4,           -- num plot
    Plotwide = 4,             -- num plot
    Blacklist = {"stickreed"},            -- plant Backlist for Crossbreed
    StorageInput = {-1,8,24},                  --Cropstick storage
    StorageOutput = {-1,8,25},                 --Weed,trash
    CropDislocation = {6,8,31},
    Croplvl = "stickreed"
}  
return(M)