local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Images);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(script.Parent.MockData);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFIntDebugAmrMockCount);
return {
    fetchUsernameAsync = function(v5)
        task.spawn(function()
            v5("TestUser", true);
        end);
    end, 
    fetchGroupsAsync = function(v6, v7)
        task.spawn(function()
            v6({
                data = {
                    {
                        id = 1, 
                        name = "TestGroup1"
                    }, 
                    {
                        id = 2, 
                        name = "TestGroup2"
                    }
                }
            });
            v7("Test fetchGroupsAsync error");
        end);
    end, 
    fetchAssetsLegacyAsync = function(_, v9, v10)
        task.spawn(function()
            local v11 = v3.generate(v4());
            local v12 = {};
            for _, v14 in v11, nil, nil do
                v12[v14.Owner.Name] = v14.Owner;
            end;
            v9(v11, v12);
            v10("Test fetchAssets error message");
        end);
    end, 
    getThumbnailUriForScope = function()
        return v1.PLACEHOLDER;
    end, 
    getThumbnailForScopeAsync = function(_, v16)
        v16(v1.PLACEHOLDER);
    end, 
    getThumbnailForItemAsync = function(_, v18)
        v18(v1.PLACEHOLDER);
    end
};
