local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local l_SimpleTab_0 = v2.UI.SimpleTab;
local l_withForwardRef_0 = v2.Wrappers.withForwardRef;
local function v8(v7)
    return v3.createElement(l_SimpleTab_0, v1.Dictionary.join(v7, {
        Style = "AssetPaletteTab", 
        WrapperProps = {
            BackgroundTransparency = 1
        }
    }));
end;
if not v4() then
    return v8;
else
    return (l_withForwardRef_0(v8));
end;
