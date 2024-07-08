local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Promise);
local l_startsWith_0 = require(l_Parent_0.Packages.Dash).startsWith;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v5 = require(l_Parent_0.Src.Actions.Asset.SaveFontMetadata);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v8)
    return function(v9, _)
        local v11 = 0;
        local v12 = #v8;
        local v13 = {};
        for _, v15 in v8, nil, nil do
            v2.new(function(v16, v17)
                local l_status_0, l_result_0 = pcall(function()
                    return l_TextService_0:GetFamilyInfoAsync(v15);
                end);
                if l_status_0 then
                    v16({
                        AssetId = v15, 
                        Name = l_result_0.Name, 
                        Builtin = l_startsWith_0(v15, "rbxasset://"), 
                        Faces = l_result_0.Faces
                    });
                    return ;
                else
                    v17({
                        Error = l_result_0
                    });
                    return ;
                end;
            end):andThen(function(v20)
                v13[v20.AssetId] = v20;
            end):catch(function(v21)
                warn("Failed to load font family info:", v21);
            end):andThen(function()
                v11 = v11 + 1;
                if v12 <= v11 then
                    v9:dispatch(v5(v13));
                end;
            end);
        end;
    end;
end;
