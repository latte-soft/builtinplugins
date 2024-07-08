local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ModernIcons);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v4.ContextServices.Localization;
local l_TextLabel_0 = v4.UI.TextLabel;
return function(v7)
    local l_LastOpTime_0 = v7.LastOpTime;
    local l_StatusText_0 = v7.StatusText;
    local l_ChangesInDisk_0 = v7.ChangesInDisk;
    local l_ChangesInStudio_0 = v7.ChangesInStudio;
    local v12 = not l_ChangesInDisk_0 and not l_ChangesInStudio_0;
    local v13 = l_Localization_0:use();
    local l_ShowFileSyncStatus_0 = game:GetFastFlag("ShowFileSyncStatus");
    local function v16(v15)
        if not l_ChangesInDisk_0 then
            if not l_ChangesInStudio_0 then
                return v13:getText("Status.NoChanges", v15);
            else
                return v13:getText("Status.StudioChanges", v15);
            end;
        elseif not l_ChangesInStudio_0 then
            return v13:getText("Status.LocalChanges", v15);
        else
            return v13:getText("Status.BothChanges", v15);
        end;
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = if l_ShowFileSyncStatus_0 then if v12 then UDim2.new(1, 0, 0, 70) else UDim2.new(1, 0, 0, 95) else UDim2.new(1, 0, 0, 40), 
        LayoutOrder = v7.LayoutOrder
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ButtonsUIPadding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, v2.SIDE_PADDING), 
            PaddingRight = UDim.new(0, v2.SIDE_PADDING)
        }), 
        StatusFrame = if not l_ShowFileSyncStatus_0 then nil else v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = if not v12 then UDim2.new(1, 0, 0, 45) else UDim2.new(1, 0, 0, 20), 
            LayoutOrder = 0
        }, {
            StatusIcon = v1.createElement("ImageLabel", {
                Image = if not v12 then v3.getIconForCurrentTheme(v3.IconEnums.Warning) else v3.getIconForCurrentTheme(v3.IconEnums.UptoDate), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 20, 0, 20)
            }), 
            StatusLabel = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0, 
                Text = v16("MainText"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Font = Enum.Font.SourceSansSemibold, 
                Position = UDim2.new(0, 25, 0, 0)
            }), 
            StatusSubText = if v12 then nil else v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0, 
                Text = v16("SubText"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Style = "SubText", 
                Position = UDim2.new(0, 25, 0, 25)
            })
        }), 
        TimeFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 20), 
            LayoutOrder = 1
        }, {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 5), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            RefreshImageLabel = v1.createElement("ImageLabel", {
                LayoutOrder = 0, 
                Image = v3.getIconForCurrentTheme(v3.IconEnums.Recent), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 20, 0, 20)
            }), 
            LatestStatusLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                Text = l_StatusText_0, 
                Font = Enum.Font.SourceSansSemibold, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1
            }), 
            TimeLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0, 
                Text = l_LastOpTime_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Style = "Basic"
            })
        })
    });
end;
