local l_Parent_0 = script.Parent.Parent.Parent;
local l_AccessoryAndBodyToolShared_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local v4 = require(l_Parent_0.Src.Actions.SetInBounds);
return function(v5, v6)
    return function(v7)
        if v5 then
            if not l_ItemCharacteristics_0.isAvatar(v5) then
                local l_accessoryTypeInfo_0 = v7:getState().selectItem.accessoryTypeInfo;
                if l_accessoryTypeInfo_0 then
                    if not v6 then
                        v6 = v5:FindFirstChild(l_accessoryTypeInfo_0.Name);
                        if not v6 then
                            return nil;
                        end;
                    end;
                    v7:dispatch(v4((l_AccessoryUtil_0:checkAccessoryBounds(v6.WorldPosition + l_accessoryTypeInfo_0.Offset, l_accessoryTypeInfo_0.Bounds, v5.CFrame, v5.Size))));
                    return ;
                else
                    return ;
                end;
            else
                v7:dispatch(v4(true));
                return ;
            end;
        else
            return ;
        end;
    end;
end;
