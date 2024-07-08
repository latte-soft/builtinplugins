local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.getHoveringPair);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local l_showContextMenu_0 = v2.UI.showContextMenu;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Plugin_0 = v2.ContextServices.Plugin;
return function(v10)
    local v11 = l_Localization_0:use();
    local v12 = l_Plugin_0:use():get();
    v6(l_UserInputService_0.InputBegan, function(v13)
        if v13.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return ;
        else
            local v14 = v5(v10);
            if v14 == nil then
                return ;
            else
                assert(v14 ~= nil, v4.LUAU_ANALYZE_ERROR);
                v13.UserInputState = Enum.UserInputState.Cancel;
                local v15 = {
                    {
                        Text = v11:getText("BodyPointsTool", "SelectAll"), 
                        OnItemClicked = function()
                            v10.selection:Set(v14);
                        end
                    }
                };
                for _, v17 in v14, nil, nil do
                    table.insert(v15, {
                        Text = v17, 
                        OnItemClicked = function()
                            v10.selection:Set({
                                v17
                            });
                        end
                    });
                end;
                l_showContextMenu_0(v12, v15);
                return ;
            end;
        end;
    end, {});
end;
