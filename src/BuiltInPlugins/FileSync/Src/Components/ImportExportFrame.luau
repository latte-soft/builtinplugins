local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Components.ActionButton);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ModernIcons);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v5.ContextServices.Localization;
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
return function(v8)
    local v9 = v8.Size or UDim2.new(1, -v2.BUTTON_PADDING * 2, 0, v2.BUTTON_HEIGHT);
    local v10 = l_Localization_0:use();
    local v11 = l_LayoutOrderIterator_0.new();
    local l_ShowFileSyncStatus_0 = game:GetFastFlag("ShowFileSyncStatus");
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v8.LayoutOrder, 
        Name = "Buttons", 
        Size = v9
    }, {
        ButtonsListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ButtonsUIPadding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(v2.BUTTON_PADDING_VERTICAL, 0), 
            PaddingTop = UDim.new(v2.BUTTON_PADDING_VERTICAL, 0)
        }), 
        Spacer1 = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v11:getNextOrder(), 
            Size = UDim2.new(v2.BUTTON_PADDING_HORIZONTAL, 0, 1, 0)
        }), 
        ExportButton = v1.createElement(v3, {
            Size = UDim2.new(v2.BUTTON_SIZE, 0, 1, 0), 
            Image = v4.getIconForCurrentTheme(v4.IconEnums.Export), 
            OnClick = v8.OnExport, 
            Text = v10:getText("Operations", "Export"), 
            TextColor3 = Color3.new(0, 0, 0), 
            TextSize = 14, 
            Font = Enum.Font.SourceSans, 
            LayoutOrder = v11:getNextOrder(), 
            HasChanges = l_ShowFileSyncStatus_0 and v8.ChangesInStudio
        }), 
        Spacer2 = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v11:getNextOrder(), 
            Size = UDim2.new(v2.BUTTON_PADDING_CENTER, 0, 1, 0)
        }), 
        ImportButton = v1.createElement(v3, {
            Size = UDim2.new(v2.BUTTON_SIZE, 0, 1, 0), 
            Image = v4.getIconForCurrentTheme(v4.IconEnums.Import), 
            OnClick = v8.OnImport, 
            Text = v10:getText("Operations", "Import"), 
            LayoutOrder = v11:getNextOrder(), 
            HasChanges = l_ShowFileSyncStatus_0 and v8.ChangesInDisk
        }), 
        Spacer3 = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v11:getNextOrder(), 
            Size = UDim2.new(v2.BUTTON_PADDING_HORIZONTAL, 0, 1, 0)
        })
    });
end;
