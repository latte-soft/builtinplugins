local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ModernIcons);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v4.ContextServices.Localization;
local l_Stylizer_0 = v4.ContextServices.Stylizer;
local l_TextLabel_0 = v4.UI.TextLabel;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
return function(v9)
    local l_SyncPath_0 = v9.SyncPath;
    local v11 = v9.Size or UDim2.new(1, 20, 0, 20);
    local v12 = l_Stylizer_0:use("DirectoryInput");
    local v13 = l_Localization_0:use();
    local v14 = l_LayoutOrderIterator_0.new();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v11, 
        LayoutOrder = v9.LayoutOrder
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 2), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ButtonsUIPadding = v1.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v2.SIDE_PADDING)
        }), 
        LocalDirectoryLabel = v1.createElement(l_TextLabel_0, {
            Text = v13:getText("Labels", "LocalDirectory"), 
            Style = "Basic", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 20), 
            LayoutOrder = v14:getNextOrder()
        }), 
        SpacerDir = v1.createElement("Frame", {
            LayoutOrder = v14:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 8), 
            BackgroundTransparency = 1
        }), 
        DirectoryFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 20, 0, 20), 
            LayoutOrder = v14:getNextOrder()
        }, {
            DirectoryInput = v1.createElement("TextButton", {
                Text = if not not l_SyncPath_0 and l_SyncPath_0 ~= "" then "  " .. l_SyncPath_0 else v13:getText("Labels", "SelectFolder"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v12.FontColor, 
                BorderColor3 = v12.FontColor, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, -25, 0, 25), 
                BackgroundColor3 = v12.DirectoryBackgroundColor, 
                BorderSizePixel = v12.DirectoryBorderSize, 
                Font = v12.RegularFont, 
                TextSize = 18, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v1.Event.Activated] = v9.Callback
            }), 
            FolderImageLabel = v1.createElement("ImageLabel", {
                Image = v3.getIconForCurrentTheme(v3.IconEnums.Open), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 16, 0, 16), 
                Position = UDim2.new(1, -50, 0, 4)
            })
        })
    });
end;
