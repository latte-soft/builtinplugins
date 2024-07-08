local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_ContextItem_0 = v0.ContextServices.ContextItem;
local l_Signal_0 = v0.Util.Signal;
local l_ServiceWrapper_0 = v0.TestHelpers.ServiceWrapper;
local function v6(v4)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Size = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = v4;
    return l_ImageLabel_0;
end;
local v7 = l_ContextItem_0:extend("ImageLoader");
v7.new = function(v8, v9)
    local v10 = setmetatable({
        ImageLoaded = l_Signal_0.new(), 
        _loadedImagesCache = {}, 
        _imageLabelPool = {}, 
        _loadingImageLabels = {}, 
        _loadingImageIds = {}, 
        _alive = true, 
        _createImageLabel = not not v8 and v8.createImageLabel or v6
    }, v7);
    local v11 = l_ServiceWrapper_0.new("CoreGui", v9);
    v10._hostGui = Instance.new("ScreenGui");
    v10._hostGui.Name = "ImageLoader";
    v10._hostGui.Enabled = true;
    v10._hostGui.Parent = v11:asInstance();
    if not (v8 and v8._dontPoll) then
        spawn(function()
            v10:_pollImageLoop();
        end);
    end;
    return v10;
end;
v7.mock = function(v12)
    return v7.new({
        dontPoll = true, 
        createImageLabel = v12
    }, true);
end;
v7.loadImage = function(v13, v14)
    if not (v14 ~= nil) or v14 == "" then
        return false;
    elseif not v13._loadedImagesCache[v14] then
        if not v13._loadingImageIds[v14] then
            local v15 = nil;
            v15 = if #v13._imageLabelPool > 0 then table.remove(v13._imageLabelPool) else v13._createImageLabel(v13._hostGui);
            v15.Image = v14;
            v13._loadingImageIds[v14] = true;
            table.insert(v13._loadingImageLabels, v15);
            return false;
        else
            return false;
        end;
    else
        v13.ImageLoaded:Fire(v14);
        return true;
    end;
end;
v7.hasImageLoaded = function(v16, v17)
    return v16._loadedImagesCache[v17] or false;
end;
v7.destroy = function(v18)
    v18._alive = false;
    for _, v20 in ipairs(v18._imageLabelPool) do
        v20:Destroy();
    end;
    v18._imageLabelPool = nil;
    for _, v22 in ipairs(v18._loadingImageLabels) do
        v22:Destroy();
    end;
    v18._loadingImageLabels = nil;
    v18._hostGui:Destroy();
    v18._hostGui = nil;
end;
v7._pollImageLoop = function(v23)
    while v23._alive do
        v23:_checkImages();
        wait(0.1);
    end;
end;
v7._checkImages = function(v24)
    local v25 = 1;
    while v25 <= #v24._loadingImageLabels do
        local v26 = v24._loadingImageLabels[v25];
        if not v26.IsLoaded then
            v25 = v25 + 1;
        else
            local l_Image_0 = v26.Image;
            v24._loadedImagesCache[l_Image_0] = true;
            v24.ImageLoaded:Fire(l_Image_0);
            v26.Image = "";
            v24._loadingImageIds[l_Image_0] = nil;
            table.remove(v24._loadingImageLabels, v25);
            table.insert(v24._imageLabelPool, v26);
        end;
    end;
end;
return v7;
