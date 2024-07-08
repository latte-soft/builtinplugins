local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_ContextItem_0 = v0.ContextServices.ContextItem;
local l_Signal_0 = v0.Util.Signal;
local function v5(v3)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Size = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = v3;
    return l_ImageLabel_0;
end;
local v6 = l_ContextItem_0:extend("ImageLoader");
v6.new = function(v7)
    local v8 = setmetatable({
        ImageLoaded = l_Signal_0.new(), 
        _loadedImagesCache = {}, 
        _imageLabelPool = {}, 
        _loadingImageLabels = {}, 
        _loadingImageIds = {}, 
        _alive = true, 
        _createImageLabel = not not v7 and v7.createImageLabel or v5
    }, v6);
    v8._hostGui = Instance.new("ScreenGui");
    v8._hostGui.Name = "ImageLoader";
    v8._hostGui.Enabled = true;
    v8._hostGui.Parent = game:GetService("CoreGui");
    if not (v7 and v7._dontPoll) then
        spawn(function()
            v8:_pollImageLoop();
        end);
    end;
    return v8;
end;
v6.loadImage = function(v9, v10)
    if not (v10 ~= nil) or v10 == "" then
        return false;
    elseif not v9._loadedImagesCache[v10] then
        if not v9._loadingImageIds[v10] then
            local v11 = nil;
            v11 = if #v9._imageLabelPool > 0 then table.remove(v9._imageLabelPool) else v9._createImageLabel(v9._hostGui);
            v11.Image = v10;
            v9._loadingImageIds[v10] = true;
            table.insert(v9._loadingImageLabels, v11);
            return false;
        else
            return false;
        end;
    else
        v9.ImageLoaded:Fire(v10);
        return true;
    end;
end;
v6.hasImageLoaded = function(v12, v13)
    return v12._loadedImagesCache[v13] or false;
end;
v6.destroy = function(v14)
    v14._alive = false;
    for _, v16 in ipairs(v14._imageLabelPool) do
        v16:Destroy();
    end;
    v14._imageLabelPool = nil;
    for _, v18 in ipairs(v14._loadingImageLabels) do
        v18:Destroy();
    end;
    v14._loadingImageLabels = nil;
    v14._hostGui:Destroy();
    v14._hostGui = nil;
end;
v6._pollImageLoop = function(v19)
    while v19._alive do
        v19:_checkImages();
        wait(0.1);
    end;
end;
v6._checkImages = function(v20)
    local v21 = 1;
    while v21 <= #v20._loadingImageLabels do
        local v22 = v20._loadingImageLabels[v21];
        if not v22.IsLoaded then
            v21 = v21 + 1;
        else
            local l_Image_0 = v22.Image;
            v20._loadedImagesCache[l_Image_0] = true;
            v20.ImageLoaded:Fire(l_Image_0);
            v22.Image = "";
            v20._loadingImageIds[l_Image_0] = nil;
            table.remove(v20._loadingImageLabels, v21);
            table.insert(v20._imageLabelPool, v22);
        end;
    end;
end;
return v6;
