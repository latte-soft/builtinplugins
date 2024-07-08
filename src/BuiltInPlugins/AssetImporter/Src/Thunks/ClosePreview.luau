local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.ResetState);
local v3 = require(l_Actions_0.SetShowPreview);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
return function()
    return function(v5)
        v5:dispatch(v4(v5:getState().Preview.activeQueueItem));
        v5:dispatch(v3(false));
        v5:dispatch(v2());
    end;
end;
