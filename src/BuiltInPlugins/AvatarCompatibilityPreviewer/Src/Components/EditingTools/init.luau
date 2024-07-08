local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useKeyedState);
local v8 = require(script.AttachmentTool);
local v9 = require(script.CageEditingTool);
local v10 = require(script.RepresentEditorStateOnWorldModel);
local v11 = require(script.useBindFocusOnPVInstance);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local l_Localization_0 = v1.ContextServices.Localization;
local l_Plugin_0 = v1.ContextServices.Plugin;
local function v18(v16)
    local v17 = true;
    if v16 ~= "attachments" then
        v17 = v16 == "none";
    end;
    return v17;
end;
local function v20(v19)
    v11(v19.dummy);
end;
return function(v21)
    assert(v12(), "AvatarPreviewerEditingTools_Dev is not enabled");
    local v22 = l_Localization_0:use();
    local v23, v24 = v2.useState("none");
    local v25 = l_Plugin_0:use():get();
    v2.useEffect(function()
        v25:Activate(true);
        return function()
            v25:Deactivate();
        end;
    end, {});
    local v26, v27 = v7(v18, v23);
    local v29 = {
        {
            Type = "Button", 
            Tooltip = v22:getText("EditingTools", "ShowAccessories"), 
            Icon = v2.createElement("Frame", {
                BackgroundColor3 = Color3.new(1, 0, 1), 
                BackgroundTransparency = 0, 
                Size = UDim2.fromScale(1, 1)
            }), 
            Selected = v26, 
            OnClick = function()
                v27(function(v28)
                    return not v28;
                end);
            end
        }
    };
    local function v34(v30, v31, v32)
        return {
            Type = "Button", 
            Tooltip = v32, 
            Icon = ("%*/%*.png"):format("rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large", v31), 
            Selected = v23 == v30, 
            OnClick = function()
                v24(function(v33)
                    if v33 == v30 then
                        return "none";
                    else
                        return v30;
                    end;
                end);
            end, 
            Enabled = nil, 
            TooltipDescription = nil
        };
    end;
    local l_createElement_0 = v2.createElement;
    local l_Fragment_0 = v2.Fragment;
    local v37 = {};
    local v38 = {
        [v4.EDITING_TOOLS_GUI_NAMES.EditingToolbar] = v2.createElement(v3.Toolbar, {
            InitialPosition = "Top", 
            VerticalItems = {
                v34("attachments", "attachments_tool", v22:getText("EditingTools", "AttachmentsTool")), 
                (v34("cage", "cage_tool", v22:getText("EditingTools", "CageTool")))
            }
        })
    };
    local v39 = false;
    if v23 ~= "none" then
        v39 = if v23 == "attachments" then v2.createElement(v8, {
            worldModel = v21.worldModel, 
            additionalToolbarItems = v29
        }) else if v13() and v23 == "cage" then v2.createElement(v9, {
            mannequin = v21.worldModel, 
            additionalToolbarItems = v29
        }) else v6(v23);
    end;
    v38.Tool = v39;
    v39 = false;
    if v23 ~= "none" then
        v39 = v2.createElement(v10, {
            worldModel = v21.worldModel, 
            includeAccessories = v26
        });
    end;
    v38.RepresentEditorStateOnWorldModel = v39;
    v39 = false;
    if v23 ~= "none" then
        v39 = v2.createElement(v20, {
            dummy = v21.worldModel
        });
    end;
    v38.BindFocusOnPVInstance = v39;
    return l_createElement_0(l_Fragment_0, v37, v38);
end;
