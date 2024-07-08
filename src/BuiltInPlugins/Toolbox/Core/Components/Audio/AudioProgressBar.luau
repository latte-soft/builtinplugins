local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = l_Parent_0.Core.Util;
local v7 = v2.Component:extend("AudioProgressBar");
v7.init = function(v8)
    v8.progress = 0;
end;
v7.shouldUpdate = function(v9, v10, _)
    local v12 = false;
    if v10.currentSoundId ~= v10.assetId then
        v12 = v9.progress == 0;
    end;
    return not v12;
end;
v7.render = function(v13)
    local l_props_0 = v13.props;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_assetId_0 = l_props_0.assetId;
    local l_currentSoundId_0 = l_props_0.currentSoundId;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_elapsedTime_0 = l_props_0.elapsedTime;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_totalTime_0 = l_props_0.totalTime;
    local l_progressBarColor_0 = l_props_0.Stylizer.progressBarColor;
    v13.progress = 0;
    if (l_totalTime_0 ~= nil and l_totalTime_0 ~= 0) and l_currentSoundId_0 == l_assetId_0 then
        v13.progress = l_elapsedTime_0 / l_totalTime_0;
    end;
    return v2.createElement("Frame", {
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, {
        ProgressBar = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundColor3 = l_progressBarColor_0, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(v13.progress, 0, 1, 0)
        })
    });
end;
return v3.connect(function(v24, _)
    local v26 = (v24 or {}).sound or {};
    return {
        elapsedTime = v26.elapsedTime or 0, 
        totalTime = v26.totalTime or 0
    };
end, nil)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7)));
