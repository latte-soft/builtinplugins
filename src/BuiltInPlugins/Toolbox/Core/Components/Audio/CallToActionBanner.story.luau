local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Core.Components.CallToActionBanner.CallToActionBanner);
local v3 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Images);
local function v5()
    print("click");
end;
return {
    name = "Banner", 
    story = function()
        return v1.createElement(v3, {}, {
            CallToActionBanner = v2.Generator({
                Image = v4.MONSTER_CAT_BANNER, 
                Text = "Find tracks from Mostercat", 
                OnClick = v5
            })
        });
    end
};
