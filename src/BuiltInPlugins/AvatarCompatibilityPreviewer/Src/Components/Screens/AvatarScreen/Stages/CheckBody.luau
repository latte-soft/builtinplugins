local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.AnimationController);
local v5 = require(l_script_FirstAncestor_0.Src.Components.EquippedItemsSidebar);
local _ = require(script.Parent.StageType);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useOnClothingLayerOrderChanged);
return {
    tabs = {
        "animations", 
        "clothing", 
        "accessories", 
        "body"
    }, 
    render = function(v11)
        local l_avatarAssets_0 = v3.useContext(v8).avatarAssets;
        local v13 = v10();
        if v11.Dummy == nil then
            return nil;
        else
            assert(v11.Dummy, v7.LUAU_ANALYZE_ERROR);
            return v3.createElement(v3.Fragment, {}, {
                EquippedItemsSidebar = v3.createElement(v5, {
                    OnClothingLayerOrderChanged = v13
                }), 
                AnimationController = l_avatarAssets_0.animation and v3.createElement(v4, {
                    Dummy = v11.Dummy, 
                    AnimationId = l_avatarAssets_0.animation
                })
            });
        end;
    end, 
    getPreviewCameraModifications = function()
        return {
            fov = 50
        };
    end
};
