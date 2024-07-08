local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(script.AmbiguousAssetEntry);
local v5 = require(script.LoneMeshPartEntry);
local _ = require(l_script_FirstAncestor_0.Src.Components.ItemDataPreview.ItemDataPreviewModel);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerDisambiguationCancel);
local v8 = require(l_script_FirstAncestor_0.Src.Util.createUniqueKey);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local _ = l_UI_0.SelectInput;
local l_Separator_0 = l_UI_0.Separator;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_StyleModifier_0 = v2.Util.StyleModifier;
return function(v22)
    local v23 = l_Localization_0:use();
    local v24 = l_Stylizer_0:use("DisambiguationMenu");
    local v25 = l_LayoutOrderIterator_0.new();
    local v26, v27 = v3.useState(0);
    local v28, v29 = v3.useState({});
    local v30, v31 = v3.useState({});
    local v34 = v3.useCallback(function(v32)
        v31(function(v33)
            v33 = table.clone(v33);
            v33[v32.meshPart] = v32;
            return v33;
        end);
    end, {});
    local v35 = true;
    for _, v37 in v22.ambiguousAssets, nil, nil do
        if v28[v37] == nil then
            v35 = false;
            break;
        end;
    end;
    if v35 then
        for _, v39 in v22.loneMeshParts, nil, nil do
            if v30[v39] == nil then
                v35 = false;
                break;
            end;
        end;
    end;
    local v40 = v8();
    return v3.createElement(l_StyledDialog_0, {
        Style = not v7() and "Alert" or "AcceptCancel", 
        Title = v23:getText("DisambiguationMenu", "Title"), 
        MinContentSize = v24.MinContentSize, 
        Buttons = if not v7() then {
            {
                Key = "ok", 
                Text = v23:getText("DisambiguationMenu", "OK"), 
                StyleModifier = if not v35 then l_StyleModifier_0.Disabled else nil
            }
        } else {
            {
                Key = "ok", 
                Text = v23:getText("DisambiguationMenu", "OK"), 
                StyleModifier = if not v35 then l_StyleModifier_0.Disabled else nil
            }, 
            {
                Key = "cancel", 
                Text = v23:getText("DisambiguationMenu", "Cancel")
            }
        }, 
        OnButtonPressed = function(v41)
            if v7() and v41 == "cancel" then
                v22.close();
                return ;
            else
                v22.assign(v1.collectArray(v28, function(v42, v43)
                    return {
                        createdInstance = v42.instances[v43], 
                        palette = v43, 
                        worldModel = v42.worldModel
                    };
                end), v1.values(v30));
                return ;
            end;
        end, 
        OnClose = v22.close
    }, v3.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v24.TitleContentsSpacing
    }, {
        CallToAction = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v23:getText("DisambiguationMenu", "CallToAction"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            Size = UDim2.fromScale(1, 0), 
            Style = "Title", 
            LayoutOrder = v25:getNextOrder(), 
            [v3.Change.AbsoluteSize] = function(v44)
                v27(v44.AbsoluteSize.Y);
            end
        }), 
        Contents = v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 1, -(v26 + v24.TitleContentsSpacing)), 
            LayoutOrder = v25:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, v24.VerticalSpacing)
        }, v1.map(v22.ambiguousAssets, function(v45)
            return v3.createElement(v4, {
                key = v40(v45.worldModel.Name), 
                AmbiguousAsset = v45, 
                LayoutOrder = v25:getNextOrder(), 
                AssignedPalette = v28[v45], 
                SetAssignedPalette = function(v46)
                    v29(function(v47)
                        v47 = table.clone(v47);
                        v47[v45] = v46;
                        return v47;
                    end);
                end
            });
        end), if #v22.loneMeshParts > 0 and #v22.ambiguousAssets > 0 then v3.createElement(l_Separator_0, {
            LayoutOrder = v25:getNextOrder()
        }) else nil, v1.map(v22.loneMeshParts, function(v48)
            return v3.createElement(v5, {
                key = v40(v48.Name), 
                Assignment = v30[v48], 
                LayoutOrder = v25:getNextOrder(), 
                MeshPart = v48, 
                SetAssignment = v34
            });
        end))
    }));
end;
