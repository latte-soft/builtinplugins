local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v1.ContextServices.Localization;
local v3 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_IconButton_0 = v1.UI.IconButton;
local l_Pane_0 = v1.UI.Pane;
local _ = v1.Util.StyleModifier;
local l_Toolbar_0 = v3.Toolbar;
return function(v9)
    local l_Schema_0 = v9.Schema;
    local v11 = l_Localization_0:use();
    local v12 = nil;
    if not l_Schema_0.CanConfirm then
        if l_Schema_0.CanRegenerate then
            v12 = {
                {
                    Type = "Label", 
                    Text = v11:getText("Viewport", "RegenerateMessage")
                }, 
                {
                    OnClick = l_Schema_0.OnRegenerate, 
                    Type = "TextButton", 
                    Text = v11:getText("Viewport", "Regenerate")
                }
            };
        end;
    else
        v12 = {
            {
                Type = "Label", 
                Text = v11:getText("Viewport", "ConfirmMessage")
            }, 
            {
                OnClick = l_Schema_0.OnClick, 
                Type = "TextButton", 
                Text = v11:getText("Viewport", "Confirm")
            }
        };
    end;
    return v4.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 32)
    }, {
        Button = if not l_Schema_0.CanConfirm then nil else v4.createElement(l_IconButton_0, {
            Disabled = v9.Disabled, 
            OnClick = l_Schema_0.OnClick, 
            Size = UDim2.new(1, 0, 0, 32), 
            Style = not v9.Disabled and "PrimaryBrand" or nil, 
            Text = l_Schema_0.Label, 
            TextXAlignment = Enum.TextXAlignment.Center
        }), 
        Toolbar = if not v12 then nil else v4.createElement(l_Toolbar_0, {
            HorizontalItems = v12
        })
    });
end;
