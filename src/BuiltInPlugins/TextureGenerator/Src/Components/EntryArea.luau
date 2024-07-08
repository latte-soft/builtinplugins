local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v6 = require(l_Components_0.Options);
local v7 = require(l_Components_0.PreviewArea);
local v8 = require(l_Components_0.PromptEntry);
local v9 = require(l_Components_0.ViewSelector);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedMeshParts);
local l_UI_0 = v2.UI;
local l_Alert_0 = l_UI_0.Alert;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Stylizer_0 = v2.Style.Stylizer;
local _ = v2.Util.StyleModifier;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v18 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v19 = require(l_script_FirstAncestor_0.Src.Util.createHashFromMeshParts);
local v20 = require(l_script_FirstAncestor_0.Src.Util.PreviewsContext);
local function v26(v21, v22)
    for v23, v24 in v21.previews, nil, nil do
        if v21.modelToPreview[v22] == v23 then
            local v25 = table.clone(v24);
            v25.uuid = v23;
            if v24.status == v18.STATUS.FAILED then
                return nil;
            else
                return v25;
            end;
        end;
    end;
    return nil;
end;
return function(v27)
    local v28 = v1.useContext(v20);
    local v29 = l_Localization_0:use();
    local v30 = l_Stylizer_0:use("EntryArea");
    local v31 = l_LayoutOrderIterator_0.new();
    local v32 = v10();
    local v33 = v19(v32);
    local v34 = v26(v28, v33);
    local v35 = v28.getTopError(v33);
    local v36 = next(v32) ~= nil;
    local v37 = v34 ~= nil;
    local v38 = {};
    if v36 or v37 then
        if not v36 or v37 then
            if not (not v36 or not v37) then
                v38.PreviewArea = v1.createElement(v7, {
                    LayoutOrder = v31:getNextOrder(), 
                    PreviewData = v34
                });
            end;
        else
            v38.ViewSelector = v1.createElement(v9, {
                LayoutOrder = v31:getNextOrder(), 
                MeshParts = v32
            });
            v38.PromptEntry = v1.createElement(v8, {
                LayoutOrder = v31:getNextOrder()
            });
            v38.Options = v1.createElement(v6, {
                LayoutOrder = v31:getNextOrder()
            });
        end;
    else
        v38.SelectText = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(150, 100), 
            Position = UDim2.fromScale(0.5, 0.5), 
            RichText = true, 
            Text = v29:getText("EntryArea", "NoSelectionMessage"), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        });
    end;
    v1.useMemo(function()
        if not v33 or #v33 <= 0 then
            return ;
        elseif v28.total > 0 and v28.quota <= 0 then
            v28.addError(v33, "PreviewUsageAlert", v29:getText("PreviewUsageAlert", "Title"), v29:getText("PreviewUsageAlert", "Description", {
                total = v28.total
            }), "warning");
            return ;
        else
            v28.removeErrorById(v33, "PreviewUsageAlert");
            return ;
        end;
    end, {
        v33, 
        v28.quota, 
        v28.total
    });
    local function _(v39)
        if v39 == "warning" then
            return "Warning";
        elseif v39 == "error" then
            return "Error";
        elseif v39 == "info" then
            return "Info";
        elseif v39 == "success" then
            return "Success";
        else
            return "Error";
        end;
    end;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v43 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor = v30.BackgroundColor, 
        LayoutOrder = v27.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 200), 
        Style = "Box"
    };
    local v44 = {};
    local v45 = false;
    if v35 ~= nil then
        v45 = v1.createElement;
        local l_l_Alert_0_0 = l_Alert_0;
        local v47 = {
            Title = v35.title, 
            Description = v35.message
        };
        local l_errorType_0 = v35.errorType;
        v47.Style = l_errorType_0 == "warning" and "Warning" or (l_errorType_0 == "error" and "Error" or (l_errorType_0 == "info" and "Info" or (l_errorType_0 == "success" and "Success" or "Error")));
        v47.ZIndex = 2;
        v47.OnClose = function()
            v28.popError(v33);
        end;
        v45 = v45(l_l_Alert_0_0, v47);
    end;
    v44.Alert = v45;
    v44.List = v1.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, v38);
    return l_createElement_0(l_l_Pane_0_0, v43, v44);
end;
