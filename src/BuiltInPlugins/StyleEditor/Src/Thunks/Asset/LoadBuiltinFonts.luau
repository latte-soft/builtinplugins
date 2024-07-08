local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_filter_0 = v1.filter;
local l_map_0 = v1.map;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v5 = require(l_Parent_0.Src.Thunks.Asset.LoadFontFamilyInfo);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v7, _)
        v7:dispatch(v5((l_map_0(l_filter_0(Enum.Font:GetEnumItems(), function(v9)
            return v9 ~= Enum.Font.Unknown;
        end), function(v10)
            return Font.fromEnum(v10).Family;
        end))));
    end;
end;
