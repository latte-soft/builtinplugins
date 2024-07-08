local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEquippedHoverMenu);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(script.ItemDataPreviewModel);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6)
    if v6.ItemData.item.source == v2.SOURCE_BUILTIN then
        return v3.createElement(v6.ItemData.palette.PreviewComponent, {
            Item = v6.ItemData.item.builtinItem, 
            Selected = v6.Selected, 
            Transparency = if not v1() then nil else v6.Transparency
        });
    elseif v6.ItemData.item.source == v2.SOURCE_INSTANCE then
        return v3.createElement(v4, {
            Instance = v6.ItemData.item.instance, 
            Transparency = if not v1() then nil else v6.Transparency
        });
    else
        error((("Unknown item source: %*"):format(v6.ItemData.item.source)));
        return ;
    end;
end;
