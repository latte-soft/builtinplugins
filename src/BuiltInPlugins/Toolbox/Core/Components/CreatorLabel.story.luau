local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Players_0 = game:GetService("Players");
local l_GroupService_0 = game:GetService("GroupService");
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = require(script.Parent.CreatorLabel);
return {
    controls = {
        CreatorType = {
            Enum.CreatorType.User, 
            Enum.CreatorType.Group
        }
    }, 
    story = function(v6)
        local v7 = nil;
        local v8 = nil;
        if v6.controls.CreatorType == Enum.CreatorType.User then
            v8 = 957765952;
            v7 = l_Players_0:GetNameFromUserIdAsync(957765952);
        else
            local l_l_GroupService_0_GroupInfoAsync_0 = l_GroupService_0:GetGroupInfoAsync(1208727);
            v8 = 1208727;
            v7 = l_l_GroupService_0_GroupInfoAsync_0.Name;
        end;
        return v3.createElement(v4, {}, {
            CreatorLabel = v3.createElement(v5, {
                CreatorId = v8, 
                CreatorName = v7, 
                CreatorType = v6.controls.CreatorType
            })
        });
    end
};
