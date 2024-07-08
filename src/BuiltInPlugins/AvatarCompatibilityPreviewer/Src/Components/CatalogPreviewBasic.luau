local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEquippedHoverMenu);
local v4 = require(l_script_FirstAncestor_0.Src.Util.getAssetThumbnail);
local l_Image_0 = v1.UI.Image;
return function(v6)
    return v2.createElement(l_Image_0, {
        Image = v4(v6.Item), 
        Style = if not v3() then nil else {
            Transparency = v6.Transparency
        }, 
        Size = UDim2.fromScale(1, 1)
    });
end;
