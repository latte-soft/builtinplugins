local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local l_Util_0 = require(l_Parent_0.Packages.Framework).Util;
local v4 = require(l_Parent_0.Src.Components.PluginEntry);
local v5 = require(l_Parent_0.Src.Util.Constants);
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = v2.Component:extend("PluginHolder");
local function _(v10)
    table.sort(v10, function(v11, v12)
        return string.lower(v11.name) < string.lower(v12.name);
    end);
end;
v9.init = function(v14)
    v14.state = {
        contentHeight = 0
    };
    v14.resizeContainer = function(v15)
        v14:setState({
            contentHeight = v15.AbsoluteContentSize.Y
        });
    end;
end;
v9.createLabel = function(v16, v17, v18)
    return v2.createElement("TextLabel", {
        Font = Enum.Font.SourceSans, 
        TextColor3 = v17.SubTitleTextColor, 
        TextTransparency = 0, 
        Size = UDim2.new(1, 0, 0, (v5.SUBTITLE_PADDING + 16) + (v5.SUBTITLE_PADDING - v5.PLUGIN_ENTRY_PADDING)), 
        TextSize = 20, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = v18, 
        LayoutOrder = v16.order:getNextOrder(), 
        BackgroundTransparency = 1
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v5.HEADER_LEFT_PADDING), 
            PaddingTop = UDim.new(0, v5.SUBTITLE_PADDING)
        })
    });
end;
v9.render = function(v19)
    v19.order = l_LayoutOrderIterator_0.new();
    local l_props_0 = v19.props;
    local l_state_0 = v19.state;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_contentHeight_0 = l_state_0.contentHeight;
    local l_plugin_0 = l_props_0.plugin;
    local l_pluginList_0 = l_props_0.pluginList;
    local l_position_0 = l_props_0.position;
    local l_size_0 = l_props_0.size;
    local l_anchorPoint_0 = l_props_0.anchorPoint;
    local l_onPluginUninstalled_0 = l_props_0.onPluginUninstalled;
    local v31 = l_Localization_0:getText("Header", "PendingUpdates");
    local v32 = l_Localization_0:getText("Header", "UpToDate");
    local v33 = {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [v2.Change.AbsoluteContentSize] = v19.resizeContainer
        })
    };
    local v34 = {};
    local v35 = {};
    for v36, v37 in pairs(l_pluginList_0) do
        if not l_StudioService_0:IsPluginUpToDate(v36, v37.latestVersion) then
            table.insert(v34, v37);
        else
            table.insert(v35, v37);
        end;
    end;
    table.sort(v35, function(v38, v39)
        return string.lower(v38.name) < string.lower(v39.name);
    end);
    table.sort(v34, function(v40, v41)
        return string.lower(v40.name) < string.lower(v41.name);
    end);
    local v42 = false;
    if #v35 > 0 then
        v42 = #v34 > 0;
    end;
    if v42 then
        v33.PendingUpdates = v19:createLabel(l_Stylizer_0, v31);
    end;
    local v43 = (-v5.THUMBNAIL_SIZE - v5.PLUGIN_HORIZONTAL_PADDING) + v5.HEADER_RIGHT_PADDING * 2;
    for _, v45 in ipairs(v34) do
        v33[v45.assetId .. "_Entry"] = v2.createElement(v4, {
            LayoutOrder = v19.order:getNextOrder(), 
            data = v45, 
            isUpdated = false, 
            plugin = l_plugin_0, 
            onPluginUninstalled = l_onPluginUninstalled_0
        });
        v33[v45.assetId .. "_Border"] = v2.createElement("Frame", {
            LayoutOrder = v19.order:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundTransparency = 1
        }, {
            Border = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundColor3 = l_Stylizer_0.BorderColor, 
                BorderSizePixel = 0, 
                Position = UDim2.new(1, v5.HEADER_RIGHT_PADDING, 0, 0), 
                Size = UDim2.new(1, v43, 0, 1)
            })
        });
    end;
    if v42 then
        v33.UpToDate = v19:createLabel(l_Stylizer_0, v32);
    end;
    for _, v47 in ipairs(v35) do
        v33[v47.assetId .. "_Entry"] = v2.createElement(v4, {
            LayoutOrder = v19.order:getNextOrder(), 
            data = v47, 
            isUpdated = true, 
            plugin = l_plugin_0, 
            onPluginUninstalled = l_onPluginUninstalled_0
        });
        v33[v47.assetId .. "_Border"] = v2.createElement("Frame", {
            LayoutOrder = v19.order:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundTransparency = 1
        }, {
            Border = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundColor3 = l_Stylizer_0.BorderColor, 
                BorderSizePixel = 0, 
                Position = UDim2.new(1, v5.HEADER_RIGHT_PADDING, 0, 0), 
                Size = UDim2.new(1, v43, 0, 1)
            })
        });
    end;
    return v2.createElement("ScrollingFrame", {
        Size = l_size_0, 
        CanvasSize = UDim2.new(0, 0, 0, l_contentHeight_0), 
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        TopImage = "rbxasset://textures/StudioToolbox/ScrollBarTop.png", 
        MidImage = "rbxasset://textures/StudioToolbox/ScrollBarMiddle.png", 
        BottomImage = "rbxasset://textures/StudioToolbox/ScrollBarBottom.png", 
        BorderSizePixel = 0, 
        ScrollBarImageColor3 = l_Stylizer_0.ScrollbarColor, 
        ScrollBarThickness = l_Stylizer_0.ScrollbarSize, 
        ScrollBarImageTransparency = l_Stylizer_0.ScrollbarTransparency
    }, v33);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
