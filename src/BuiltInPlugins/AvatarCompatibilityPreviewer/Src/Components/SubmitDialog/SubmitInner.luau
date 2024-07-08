local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.createUniqueKey);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v2.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v14)
    local v15 = l_Localization_0:use();
    local v16 = l_Stylizer_0:use("SubmitInner");
    local v17 = l_LayoutOrderIterator_0.new();
    local v24 = v3.useCallback(function(v18)
        v14.setPublishChoices(function(v19)
            local v20 = table.clone(v19);
            local v21 = table.find(v20, v18);
            if v21 ~= nil then
                table.remove(v20, v21);
                return v20;
            else
                table.insert(v20, v18);
                table.sort(v20, function(v22, v23)
                    return assert(table.find(v14.availableChoices, v22), "Couldn't find available choice index for A") < assert(table.find(v14.availableChoices, v23), "Couldn't find available choice index for B");
                end);
                return v20;
            end;
        end);
    end, {
        v14.availableChoices
    });
    local v25 = v4();
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = v16.ContentPadding, 
        Spacing = v16.CallToActionSpacing, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        [v3.Change.AbsoluteSize] = function(v26)
            v14.setHeight(v26.AbsoluteSize.Y);
        end
    }, {
        Title = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v17:getNextOrder(), 
            Text = v15:getText("SubmitInner", "CallToAction")
        }), 
        Checkboxes = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v17:getNextOrder(), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = v16.CheckboxSpacing
        }, v1.collectArray(v14.availableChoices, function(_, v28)
            return v3.createElement(l_Checkbox_0, {
                key = v25((tostring(v28.assetType))), 
                Checked = table.find(v14.publishChoices, v28) ~= nil, 
                Key = v28, 
                LayoutOrder = v17:getNextOrder(), 
                OnClick = v24, 
                Text = v15:getText("SubmitInner", "ChoiceItem", {
                    assetType = v15:getText("AssetType", if typeof(v28.assetType) == "string" then v28.assetType else v28.assetType.Name), 
                    instanceName = v28.instance.Name
                })
            });
        end))
    });
end;
