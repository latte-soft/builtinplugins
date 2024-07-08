local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_TextService_0 = game:GetService("TextService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_StyleModifier_0 = v5.Util.StyleModifier;
local l_UI_0 = v5.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local v18 = require(script.Parent.PropertyView);
local v19 = require(l_script_FirstAncestor_0.Src.Components.Properties.PropertyStatus);
local v20 = require(l_script_FirstAncestor_0.Src.Utility.createCalloutComponents);
local v21 = require(l_script_FirstAncestor_0.Src.Utility.Status.filterStatusesForProp);
local v22 = require(l_script_FirstAncestor_0.Src.Utility.Status.getHighestSeverityStatus);
local v23 = require(l_script_FirstAncestor_0.Src.Utility.Status.GetLocalizedStatusMessage);
local v24 = require(l_script_FirstAncestor_0.Src.Utility.getPropertiesForInstance);
local l_Dash_0 = v5.Dash;
local l_omit_0 = l_Dash_0.omit;
local l_join_0 = l_Dash_0.join;
local v28 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImporterOpensAvatarPreviewerBetaCheck);
local v29 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v30 = v3.PureComponent:extend("PropertyListView");
v30.init = function(v31)
    v31:setState({
        expanded = {
            FileGeneral = true, 
            ObjectGeneral = true
        }, 
        absoluteHorizontalSize = 0
    });
    v31.statuses = v31.props.Instance:GetStatuses();
    v31.onContentResize = function(v32)
        v31:setState({
            absoluteHorizontalSize = v32.x
        });
    end;
    v31.refreshForStatusCompatibility = function()
        v31:setState({});
    end;
end;
v30.willUpdate = function(v33, _, _)
    v33.statuses = v33.props.Instance:GetStatuses();
end;
local function v42(v36, v37, v38)
    local v39 = {};
    for _, v41 in v36, nil, nil do
        if not v38.Status or v38.Status.Level ~= "Error" then
            v38.Status = v41;
            v38.IsSectionStatus = true;
        end;
        table.insert(v39, v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = #v39, 
            Size = UDim2.fromOffset(v37.absoluteXSize - v37.style.Sizes.StatusMessagePadding, 0), 
            Style = if v41.Level == "Error" then v37.style.ErrorStatus else v37.style.WarningStatus, 
            Text = v23(v37.localization, v41.Type, v41.Level, v41.Context), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        }));
    end;
    return v39;
end;
local function v47(v43, v44, v45)
    local l_status_0 = v43.status;
    if l_status_0 and (not v44.Status or v44.Status.Level ~= "Error" and l_status_0.Level == "Error") then
        v44.Status = l_status_0;
        v44.IsSectionStatus = false;
    end;
    return v3.createElement(v18, {
        Instance = v43.importData, 
        LayoutOrder = v43.layoutOrder, 
        Localization = v43.localization, 
        Status = l_status_0, 
        PropertyMetadata = v43.propertyMetadata, 
        OnInteract = v45
    });
end;
local function _(v48, v49)
    local l_Size_0 = v49.Arrow.Size;
    local l_Spacing_0 = v49.Spacing;
    local v52 = l_Size_0.X.Offset + l_Spacing_0;
    if v48 then
        local l_Text_0 = v49.Text;
        v52 = v52 + (l_TextService_0:GetTextSize(v48, l_Text_0.TextSize, l_Text_0.Font, Vector2.new()).X + l_Spacing_0);
    end;
    return v52;
end;
v30.createHeader = function(v55, v56, v57, v58, v59)
    local l_PropertySectionHeader_0 = v55.props.Stylizer.PropertySectionHeader;
    local v61 = l_omit_0(l_PropertySectionHeader_0, {
        "Arrow", 
        "Text"
    });
    local v62 = v55.props.Localization:getText("Sections", v56.Section);
    local v63 = nil;
    if v58 then
        local l_Size_1 = l_PropertySectionHeader_0.Arrow.Size;
        local l_Spacing_1 = l_PropertySectionHeader_0.Spacing;
        local v66 = l_Size_1.X.Offset + l_Spacing_1;
        if v62 then
            local l_Text_1 = l_PropertySectionHeader_0.Text;
            v66 = v66 + (l_TextService_0:GetTextSize(v62, l_Text_1.TextSize, l_Text_1.Font, Vector2.new()).X + l_Spacing_1);
        end;
        v63 = v3.createElement(v58, (l_join_0(v59, {
            LayoutOrder = 3, 
            Size = UDim2.new(1, -v66, 1, 0)
        })));
    end;
    local v68 = {};
    if not ((not v28() or not v56.Callouts) or v57) then
        v68 = v20(v56.Callouts, v56.Section, v55.props.AssetImportSession);
    end;
    return v3.createElement(l_Pane_0, {
        HorizontalAlignment = l_PropertySectionHeader_0.HorizontalAlignment, 
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Horizontal, 
        OnClick = function()
            v55:setState({
                expanded = v6.Dictionary.join(v55.state.expanded, {
                    [v56.Section] = not v57
                })
            });
        end, 
        Padding = l_PropertySectionHeader_0.Padding, 
        Size = l_PropertySectionHeader_0.Size, 
        Style = v61, 
        Spacing = l_PropertySectionHeader_0.Spacing, 
        VerticalAlignment = l_PropertySectionHeader_0.VerticalAlignment
    }, {
        Image = v3.createElement(l_Image_0, {
            LayoutOrder = 1, 
            Style = l_PropertySectionHeader_0.Arrow, 
            StyleModifier = not not v57 and l_StyleModifier_0.Selected or nil
        }), 
        Title = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Style = l_PropertySectionHeader_0.Text, 
            Text = v62, 
            TextWrapped = true
        }, v68), 
        HeaderStatus = v63
    });
end;
v30.buildSection = function(v69, v70, v71)
    local l_props_0 = v69.props;
    local v73 = {
        Status = nil, 
        IsSectionStatus = false
    };
    local v74 = v42(v21(v71.Section, v69.statuses), {
        absoluteXSize = v69.state.absoluteHorizontalSize, 
        style = l_props_0.Stylizer, 
        localization = l_props_0.Localization
    }, v73);
    local v75 = {};
    for v76, v77 in pairs(v71.Properties) do
        if not (v77.ShouldHide and v77.ShouldHide(l_props_0.Instance, l_props_0.AssetImportSession)) then
            table.insert(v75, v47({
                importData = l_props_0.Instance, 
                layoutOrder = v76 + #v74, 
                propertyMetadata = v77, 
                localization = l_props_0.Localization, 
                status = v22((v21(v77.Name, v69.statuses)))
            }, v73, v69.refreshForStatusCompatibility));
        end;
    end;
    if #v74 == 0 and #v75 == 0 then
        return nil;
    else
        local v78 = v69.state.expanded[v71.Section];
        local v79 = false;
        if v73.Status ~= nil then
            v79 = not v78 or v73.IsSectionStatus;
        end;
        local v80 = if not v79 then nil else v19;
        local v81 = if not v79 then nil else {
            StatusLevel = v73.Status.Level, 
            StatusMessage = v73.Status.Type, 
            StatusContext = v73.Status.Context, 
            Position = UDim2.new(1, 0, 0, 0)
        };
        return v3.createElement(l_ExpandablePane_0, {
            Expanded = v78, 
            OnExpandedChanged = function()
                v69:setState({
                    expanded = v6.Dictionary.join(v69.state.expanded, {
                        [v71.Section] = not v78
                    })
                });
            end, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v70, 
            Style = "ImportTree", 
            Text = l_props_0.Localization:getText("Sections", v71.Section), 
            HeaderComponent = if v28() then nil else v80, 
            HeaderComponentProps = if v28() then nil else v81, 
            HeaderOverride = if not v28() then nil else v69:createHeader(v71, v78, v80, v81)
        }, v6.List.join(v75, v74));
    end;
end;
v30.render = function(v82)
    local l_props_1 = v82.props;
    if l_props_1.Instance then
        local v84 = {};
        for v85, v86 in pairs(v24(l_props_1.Instance)) do
            v84[v85] = v82:buildSection(v85, v86);
        end;
        return v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.fromScale(1, 0), 
            Layout = Enum.FillDirection.Vertical, 
            OnCanvasResize = v82.onContentResize, 
            Position = UDim2.fromScale(0, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.fromScale(1, 1)
        }, v84);
    else
        return nil;
    end;
end;
return v4.connect(function(v87)
    return {
        CurrentPreset = if v29() then nil else v87.Preview.currentPreset, 
        SettingsChanged = v87.Preview.settingsChanged, 
        AssetImportSession = v87.Preview.assetImportSession
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v30)));
