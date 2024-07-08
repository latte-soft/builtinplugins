local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_CrossPluginCommunication_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.CrossPluginCommunication;
local v2 = require(l_script_FirstAncestor_0.Core.Actions.SetTutorialLimits);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.UpdateSearchTerm);
local v4 = require(l_script_FirstAncestor_0.Core.Actions.UpdatePageInfo);
local v5 = require(l_script_FirstAncestor_0.Core.Types.Category);
return {
    setup = function(v6, v7)
        if not v6.comms then
            v6.comms = l_CrossPluginCommunication_0.new("Toolbox");
            v6.comms:OnInvoke("SetTutorialLimits", function(v8)
                v7:dispatch(v2(v8.assetIds, v8.positionOverride, v8.scriptWarningOverride));
                if v8.assetIds == nil then
                    v7:dispatch(v3(""));
                    return ;
                else
                    v7:dispatch(v4({
                        categoryName = v5.FREE_MODELS.name, 
                        currentTab = v5.MARKETPLACE_KEY
                    }));
                    return ;
                end;
            end);
            return ;
        else
            return ;
        end;
    end, 
    fire = function(v9, ...)
        if not (not v9.comms or not v9.comms.Fire) then
            v9.comms:Fire(...);
        end;
    end
};
