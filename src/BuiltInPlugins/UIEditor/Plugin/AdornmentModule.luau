local v0 = require(script.Parent.CoreGuiManager);
local v1 = require(script.Parent.Enum.Direction);
local v2 = require(script.Parent.Extents2D);
local _ = require(script.Parent.FFlag);
local v4 = require(script.Parent.SelectionManager);
local v5 = require(script.Parent.Utility);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = {};
local v13 = {};
local v14 = Color3.fromRGB(255, 255, 255);
local v15 = Color3.fromRGB(136, 136, 136);
local v16 = Color3.fromRGB(222, 222, 222);
local l_game_FastFlag_0 = game:GetFastFlag("StudioUIEditorDontClipOutsideSafeArea", false);
local v18 = {
    [v1.E] = Vector2.new(0, 0.5), 
    [v1.SE] = Vector2.new(0, 0), 
    [v1.S] = Vector2.new(0.5, 0), 
    [v1.SW] = Vector2.new(1, 0), 
    [v1.W] = Vector2.new(1, 0.5), 
    [v1.NW] = Vector2.new(1, 1), 
    [v1.N] = Vector2.new(0.5, 1), 
    [v1.NE] = Vector2.new(0, 1)
};
local v19 = {
    [v1.E] = UDim2.new(1, -2, 0.5, 0), 
    [v1.SE] = UDim2.new(1, -2, 1, -2), 
    [v1.S] = UDim2.new(0.5, 0, 1, -2), 
    [v1.SW] = UDim2.new(0, 2, 1, -2), 
    [v1.W] = UDim2.new(0, 2, 0.5, 0), 
    [v1.NW] = UDim2.new(0, 2, 0, 2), 
    [v1.N] = UDim2.new(0.5, 0, 0, 2), 
    [v1.NE] = UDim2.new(1, -2, 0, 2)
};
local v20 = {
    Vector2.new(0, 0.5), 
    Vector2.new(0.5, 0), 
    Vector2.new(1, 0.5), 
    Vector2.new(0.5, 1)
};
local v21 = {
    UDim2.new(1, 0, 0.5, 0), 
    UDim2.new(0.5, 0, 1, 0), 
    UDim2.new(0, 0, 0.5, 0), 
    UDim2.new(0.5, 0, 0, 0)
};
local v22 = {
    UDim2.new(0, 1, 1, 2), 
    UDim2.new(1, 2, 0, 1), 
    UDim2.new(0, 1, 1, 2), 
    UDim2.new(1, 2, 0, 1)
};
local function v24()
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxasset://textures/blockUpperLeft.png";
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Tile;
    l_ImageLabel_0.TileSize = UDim2.new(0, 16, 0, 16);
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.ImageColor3 = Color3.new(0.8, 0.8, 0.8);
    l_ImageLabel_0.Parent = v0:findOrCreateScreenGui("Adornments");
    return l_ImageLabel_0;
end;
local function v26()
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.Parent = v0:findOrCreateScreenGui("Adornments");
    return l_Frame_0;
end;
local function _()
    return #v12 > 0;
end;
local function v29(v28)
    v11 = Instance.new("Frame");
    v11.Name = v28;
    v11.AnchorPoint = Vector2.new(0, 0);
    v11.BackgroundTransparency = 1;
    v11.BackgroundColor3 = Color3.new(0, 0, 255);
    v11.BorderSizePixel = 0;
end;
local function v34(v30)
    for v31 = v1.FIRST, v1.LAST do
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = v30 .. "Handle_" .. v1:toShortName(v31);
        l_Frame_1.AnchorPoint = v18[v31];
        l_Frame_1.Size = UDim2.new(0, 8, 0, 8);
        l_Frame_1.Position = v19[v31];
        l_Frame_1.BackgroundColor3 = v14;
        l_Frame_1.BorderColor3 = v15;
        l_Frame_1.ZIndex = 3;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Image = "rbxasset://textures/StudioUIEditor/resizeHandleDropShadow.png";
        l_ImageLabel_1.Name = "ResizeHandleDropShadow_" .. v1:toShortName(v31);
        l_ImageLabel_1.Size = UDim2.new(0, 16, 0, 16);
        l_ImageLabel_1.Position = UDim2.new(0, -4, 0, -3);
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.BorderSizePixel = 0;
        l_ImageLabel_1.ImageColor3 = Color3.fromRGB(0, 0, 0);
        l_ImageLabel_1.ImageTransparency = 0.6;
        l_ImageLabel_1.ScaleType = Enum.ScaleType.Slice;
        l_ImageLabel_1.SliceCenter = Rect.new(4, 4, 12, 12);
        l_ImageLabel_1.ZIndex = 2;
        l_ImageLabel_1.Parent = l_Frame_1;
        l_Frame_1.Parent = v11;
        v12[v31] = l_Frame_1;
    end;
end;
local function v37()
    for v35 = 1, 4 do
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.AnchorPoint = v20[v35];
        l_Frame_2.BackgroundColor3 = v16;
        l_Frame_2.BorderSizePixel = 0;
        l_Frame_2.Position = v21[v35];
        l_Frame_2.Size = v22[v35];
        v13[v35] = l_Frame_2;
        v13[v35].Parent = v11;
    end;
end;
local v38 = {};
local v39 = {};
v38.showSnappingLine = function(_, v41)
    local v42 = v24();
    v42.AnchorPoint = Vector2.new(0, 0);
    v42.Position = UDim2.new(0, v41[1].X, 0, v41[1].Y);
    v42.Size = UDim2.new(0, math.max(1, v5:distance(v41[1].X, v41[2].X)), 0, (math.max(1, v5:distance(v41[1].Y, v41[2].Y))));
    v42.ImageColor3 = v41[3];
    table.insert(v39, v42);
end;
v38.hideSnappingLines = function(_)
    for v44 = 1, #v39 do
        v39[v44]:Destroy();
    end;
    v39 = {};
end;
v38.showXSnappingLine = function(_, v46, v47)
    if not v8 then
        v8 = v26();
    end;
    v8.Visible = true;
    v8.Size = UDim2.new(0, 1, 0, v47);
    v8.Position = UDim2.new(0, v46.X, 0, v46.Y);
end;
v38.showYSnappingLine = function(_, v49, v50)
    if not v9 then
        v9 = v26();
    end;
    v9.Visible = true;
    v9.Size = UDim2.new(0, v50, 0, 1);
    v9.Position = UDim2.new(0, v49.X, 0, v49.Y);
end;
v38.hideXSnappingLine = function(_)
    if v8 then
        v8.Visible = false;
    end;
end;
v38.hideYSnappingLine = function(_)
    if v9 then
        v9.Visible = false;
    end;
end;
v38.showOfferReparentAdornments = function(_, v54, v55)
    if not v6 then
        v6 = v54:Clone();
        v6.AnchorPoint = Vector2.new(0, 0);
        v6.ZIndex = 3;
        v7 = v26();
        v7.BackgroundColor3 = Color3.new(0, 0, 0);
        v7.BackgroundTransparency = 0.8;
        v7.AnchorPoint = Vector2.new(0, 0);
        v7.ZIndex = 2;
    end;
    v6.Parent = v0:findOrCreateScreenGui("Adornments");
    v6.Position = UDim2.new(0, v54.AbsolutePosition.X, 0, v54.AbsolutePosition.Y);
    v6.Size = UDim2.new(0, v54.AbsoluteSize.X, 0, v54.AbsoluteSize.Y);
    v7.Position = UDim2.new(0, v55.AbsolutePosition.X, 0, v55.AbsolutePosition.Y);
    v7.Size = UDim2.new(0, v55.AbsoluteSize.X, 0, v55.AbsoluteSize.Y);
end;
v38.hideOfferReparent = function(_)
    if v6 then
        v6:Destroy();
        v7:Destroy();
        v6 = nil;
        v7 = nil;
    end;
end;
v38.showSelection = function(_)
    if not ((not v10 or not v4:hasFilteredSelection()) or v10.Enabled) then
        v10.Enabled = true;
    end;
end;
v38.hideSelection = function(_)
    if not (not v10 or not v10.Enabled) then
        v10.Enabled = false;
    end;
end;
v38.updateSelectionPosition = function(_)
    local v60 = v4:getFilteredSelection();
    if not (v10 ~= nil) or #v60 == 0 then
        return ;
    else
        v38:updateSelectionAdorns(v2:getExtentsFromGuis(v60));
        return ;
    end;
end;
v38.createSelectionAdorns = function(_)
    if not (#v12 > 0) then
        local v62 = v0:findOrCreateFolder("m_handles");
        if not v10 then
            v10 = Instance.new("ScreenGui", v62);
            v10.Enabled = false;
            if l_game_FastFlag_0 then
                v10.ClipToDeviceSafeArea = false;
                v10.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
            end;
        end;
        v29("UIEditorSelectionHandleParent");
        v11.Parent = v10;
        v34("Selection");
        v37();
        v38:updateSelectionAdorns(v2:getExtentsFromGuis(v4:getFilteredSelection()));
        v10.Enabled = true;
        return ;
    else
        return ;
    end;
end;
v38.updateSelectionAdorns = function(_, v64)
    local l_Size_0 = v64.Size;
    local l_TopLeft_0 = v64.TopLeft;
    v11.Position = UDim2.new(0, l_TopLeft_0.X, 0, l_TopLeft_0.Y);
    v11.Size = UDim2.new(0, l_Size_0.X, 0, l_Size_0.Y);
    local v67 = v4:getFilteredSelection();
    if #v67 == 1 then
        v11.Rotation = v67[1].AbsoluteRotation;
        return ;
    else
        v11.Rotation = 0;
        return ;
    end;
end;
v38.deleteSelectionAdorns = function(_)
    for v69 = 1, #v12 do
        v12[v69]:Destroy();
    end;
    for v70 = 1, #v13 do
        v13[v70]:Destroy();
    end;
    v12 = {};
    v13 = {};
    if v11 then
        v11:Destroy();
        v11 = nil;
    end;
    if v10 then
        v10:Destroy();
        v10 = nil;
    end;
end;
return v38;
