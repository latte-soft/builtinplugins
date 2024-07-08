local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v7 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useAddInstancesToUserCatalogAndEquip);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local function v32(v24)
    if not (v24 ~= nil) or #v24 == 0 then
        return false;
    else
        assert(v24 ~= nil, v10.LUAU_ANALYZE_ERROR);
        for _, v26 in v24, nil, nil do
            for _, v28 in v6, nil, nil do
                for _, v30 in v28, nil, nil do
                    local v31 = v30.CreateCustomInstanceFromSelection(v26);
                    if v31 ~= nil and typeof(v31) ~= "string" then
                        return true;
                    end;
                end;
            end;
        end;
        return false;
    end;
end;
local function v40(v33)
    local v34 = v7:use():get();
    local v35 = l_Analytics_0:use();
    local v36 = v8();
    local v37 = v3.useContext(if not v13() then v5 else v4.Context);
    return v3.useCallback(function()
        local v38 = v34:Get();
        if #v38 == 0 then
            v35:report("addUserItems", 0, 0);
            v33({
                type = "noSelection"
            });
            return ;
        else
            local v39 = v36(v38);
            if #v39.invalidInstances > 0 then
                v33({
                    type = "noPalette", 
                    instances = v39.invalidInstances, 
                    extraErrors = v39.extraErrors
                });
            end;
            v35:report("addUserItems", #v38, #v38 - #v39.invalidInstances);
            if v39.activePalette ~= nil then
                v37.openPalette(v39.activePalette.Key);
            end;
            return ;
        end;
    end, {
        v35, 
        v37, 
        v36, 
        v33
    });
end;
return function(v41)
    local v42 = l_Localization_0:use();
    local v43 = l_Stylizer_0:use("AddItemButton");
    local v44, v45 = v3.useState(nil);
    local v46 = v3.useCallback(function()
        v45(nil);
    end, {});
    local v47 = v40(v45);
    local v48 = l_LayoutOrderIterator_0.new();
    local function _()
        if ((v44 ~= nil and v44.type == "noPalette") and #v44.instances == 1) and v44.extraErrors ~= nil then
            local v49, v50 = next(v44.extraErrors);
            local v51 = false;
            if v50 == "OnlyOneShoe" then
                v51 = v44.instances[1] == v49;
            end;
            return v51;
        else
            return false;
        end;
    end;
    local v53;
    if v44 == nil then
        v53 = nil;
    else
        local v54;
        if ((v44 ~= nil and v44.type == "noPalette") and #v44.instances == 1) and v44.extraErrors ~= nil then
            local v55, v56 = next(v44.extraErrors);
            v54 = false;
            if v56 == "OnlyOneShoe" then
                v54 = v44.instances[1] == v55;
            end;
        else
            v54 = false;
        end;
        v53 = if not v54 then if v44.type == "noPalette" and #v44.instances == 1 then v42:getText("AddItems", "FailedAddNoPaletteHeaderSingle") else if v44.type == "noPalette" and #v44.instances > 1 then v42:getText("AddItems", "FailedAddNoPaletteHeaderMultiple", {
            items = table.concat(v1.collectArray(v44.instances, function(_, v58)
                return v58.Name;
            end), ", ")
        }) else nil else v42:getText("AddItems", "WarningHeaderOneShoe");
    end;
    local v61 = if ((not not v44 and v44.type == "noPalette") and v44.extraErrors) and next(v44.extraErrors) ~= nil then table.concat(v1.collectArray(v44.extraErrors, function(_, v60)
        return v42:getText("AddItems", v60);
    end), " ") .. " " else "";
    local v62, v63 = v3.useState(100);
    local v64 = v7:use():get();
    local v65, v66 = v3.useState(function()
        return (v32(v64:Get()));
    end);
    v9(v64.SelectionChanged, function()
        v66((v32(v64:Get())));
    end, {});
    local l_createElement_0 = v3.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v69 = {
        LayoutOrder = v41.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v43.Height)
    };
    local v70 = {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v43.PaddingTop), 
            PaddingBottom = UDim.new(0, v43.PaddingBottom)
        }), 
        Inner = v3.createElement(l_Button_0, {
            OnClick = v47, 
            Style = "Round", 
            Tooltip = if v65 then nil else v42:getText("AddItems", "FailedAddHint"), 
            DisableHover = not v65
        }, {
            Image = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v43.Image, 
                ImageColor3 = if v65 then v43.ImageColor else v43.ImageColorDisabled, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v43.ImageSize, v43.ImageSize)
            })
        })
    };
    local v71;
    if v44 ~= nil then
        v71 = v3.createElement;
        local l_l_StyledDialog_0_0 = l_StyledDialog_0;
        local v73 = {};
        local v74;
        if ((v44 ~= nil and v44.type == "noPalette") and #v44.instances == 1) and v44.extraErrors ~= nil then
            local v75, v76 = next(v44.extraErrors);
            v74 = false;
            if v76 == "OnlyOneShoe" then
                v74 = v44.instances[1] == v75;
            end;
        else
            v74 = false;
        end;
        v73.Title = if not v74 then v42:getText("AddItems", "FailedTitle") else v42:getText("AddItems", "WarningTitle");
        v73.Enabled = true;
        v73.MinContentSize = Vector2.new(350, v62);
        v73.Modal = true;
        v73.OnClose = v46;
        v73.OnButtonPressed = v46;
        v73.Buttons = {
            {
                Key = "OK", 
                Text = v42:getText("AddItems", "OK")
            }
        };
        v73.ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center;
        local v77 = {};
        v74 = v3.createElement;
        local l_l_Pane_0_1 = l_Pane_0;
        local v80 = {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = v43.FailureDialogSpacing, 
            [v3.Change.AbsoluteSize] = function(v79)
                v63(v79.AbsoluteSize.Y);
            end
        };
        local v81 = {
            Title = v53 and v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = Enum.Font.SourceSansBold, 
                LayoutOrder = v48:getNextOrder(), 
                Size = UDim2.fromScale(1, 0), 
                Text = v53, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        };
        local l_createElement_1 = v3.createElement;
        local l_l_TextLabel_0_0 = l_TextLabel_0;
        local v84 = {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v48:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        };
        local v85;
        if ((v44 ~= nil and v44.type == "noPalette") and #v44.instances == 1) and v44.extraErrors ~= nil then
            local v86, v87 = next(v44.extraErrors);
            v85 = false;
            if v87 == "OnlyOneShoe" then
                v85 = v44.instances[1] == v86;
            end;
        else
            v85 = false;
        end;
        v84.Text = if not v85 then v61 .. v42:getText("AddItems", "FailedAddHint") else v61;
        v84.TextWrapped = true;
        v84.TextXAlignment = Enum.TextXAlignment.Left;
        v81.Hint = l_createElement_1(l_l_TextLabel_0_0, v84);
        v77.Contents = v74(l_l_Pane_0_1, v80, v81);
        v71 = v71(l_l_StyledDialog_0_0, v73, v77);
    else
        v71 = nil;
    end;
    v70.FailureDialog = v71;
    return l_createElement_0(l_l_Pane_0_0, v69, v70);
end;
