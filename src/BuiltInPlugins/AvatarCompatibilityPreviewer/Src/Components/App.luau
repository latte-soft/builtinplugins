local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Screens.AvatarScreen);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Screens.AutoSetupScreen);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Screens.SelectScreen);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Screens.TestingScreen);
local v8 = require(l_script_FirstAncestor_0.Src.Components.EquipmentStateProvider);
local v9 = require(l_script_FirstAncestor_0.Src.Components.OriginalLimbProvider);
local v10 = require(l_script_FirstAncestor_0.Src.Components.RunServiceContext);
local v11 = require(l_script_FirstAncestor_0.Src.Components.SimpleSerializedStateProvider);
local v12 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v13 = require(l_script_FirstAncestor_0.Src.Components.UserCatalogProvider);
local v14 = require(l_script_FirstAncestor_0.Src.Components.ContextStack);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.useAutoSetupState);
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.useMostRecentSelected);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup)();
local l_Analytics_0 = v2.ContextServices.Analytics;
return function(v19)
    local v20 = v3.useContext(v10);
    local v21 = v16();
    local v22 = if not v17 then nil else v15(v21 and v21.autoSetupTarget);
    local v23 = l_Analytics_0:use();
    v3.useEffect(function()
        v23:report("openPlugin");
    end, {});
    local v24 = nil;
    if not v20.isRunning() then
        if v21 == nil then
            return (v3.createElement(v6));
        elseif v17 and v22.state.type ~= "none" then
            return (v3.createElement(v5, {
                autoSetupState = v22.state, 
                cancelAutoSetup = v22.cancelAutoSetup, 
                startAutoSetup = v22.startAutoSetup
            }));
        else
            if v21.avatar then
                v24 = v3.createElement(v14, {
                    providers = v1.List.join({
                        v3.createElement(v11, {
                            root = v21.avatar.WorldModel
                        }), 
                        v3.createElement(v8, {
                            root = v21.avatar.WorldModel
                        }), 
                        v3.createElement(v13), 
                        v3.createElement(v9), 
                        v3.createElement(v12.Provider)
                    }, v19.additionalAvatarContext or {})
                }, v3.createElement(v4, {
                    Avatar = v21.avatar
                }));
            end;
            return v24;
        end;
    else
        return (v3.createElement(v7));
    end;
end;
