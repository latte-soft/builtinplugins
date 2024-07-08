local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_deepEqual_0 = require(l_Parent_0.Packages.Framework).Util.deepEqual;
local v4 = require(l_Parent_0.Src.Util.isEmpty);
local v5 = require(l_Parent_0.Src.Util.AssetOverrides);
local v6 = require(l_Parent_0.Src.Util.Float);
local v7 = require(l_Parent_0.Src.Util.Scales);
local v8 = {
    universeAvatarAssetOverrides = v5.isEqual, 
    universeAvatarMinScales = v7.isEqual, 
    universeAvatarMaxScales = v7.isEqual, 
    OptInLocations = l_deepEqual_0, 
    thumbnails = l_deepEqual_0, 
    workspaceGravity = v6.createIsEqualWithTolerance(0.001), 
    workspaceJumpHeight = v6.createIsEqualWithTolerance(0.001), 
    workspaceJumpPower = v6.createIsEqualWithTolerance(0.001)
};
local function v16(v9, v10)
    if not (v9 ~= nil) or v10 == nil then
        return v9 == v10;
    elseif v4(v9) ~= v4(v10) then
        return false;
    else
        local v11 = true;
        for v12, v13 in pairs(v9) do
            if v10[v12] ~= v13 then
                v11 = false;
                break;
            end;
        end;
        for v14, v15 in pairs(v10) do
            if v9[v14] ~= v15 then
                return false;
            end;
        end;
        return v11;
    end;
end;
local function v17()
    return {
        Current = {}, 
        Changed = {}, 
        Errors = {}, 
        Warnings = {}
    };
end;
return v2.createReducer(v17(), {
    ResetStore = function(_, _)
        return (v17());
    end, 
    AddChange = function(v20, v21)
        local l_value_0 = v21.value;
        if (if not v8[v21.setting] then if type(l_value_0) == "table" then v16 else function(v23, v24)
            return v23 == v24;
        end else v8[v21.setting])(v20.Current[v21.setting], l_value_0) then
            l_value_0 = v1.None;
        end;
        return v1.Dictionary.join(v20, {
            Changed = v1.Dictionary.join(v20.Changed, {
                [v21.setting] = l_value_0
            }), 
            Errors = v1.Dictionary.join(v20.Errors, {
                [v21.setting] = v1.None
            })
        });
    end, 
    AddErrors = function(v25, v26)
        return v1.Dictionary.join(v25, {
            Errors = v1.Dictionary.join(v25.Errors, v26.errors)
        });
    end, 
    DiscardError = function(v27, v28)
        return v1.Dictionary.join(v27, {
            Errors = v1.Dictionary.join(v27.Errors, {
                [v28.error] = v1.None
            })
        });
    end, 
    DiscardChanges = function(v29, _)
        return v1.Dictionary.join(v29, {
            Changed = {}
        });
    end, 
    DiscardErrors = function(v31, _)
        return v1.Dictionary.join(v31, {
            Errors = {}, 
            Warnings = {}
        });
    end, 
    SetCurrentSettings = function(v33, v34)
        return v1.Dictionary.join(v33, {
            Current = v34.settings
        });
    end, 
    AppendSettings = function(v35, v36)
        return v1.Dictionary.join(v35, {
            Current = v1.Dictionary.join(v35.Current, v36.settings)
        });
    end, 
    AddWarning = function(v37, v38)
        if v1.List.find(v37.Warnings, v38.key) then
            return v37;
        else
            return v1.Dictionary.join(v37, {
                Warnings = v1.List.join(v37.Warnings, {
                    v38.key
                })
            });
        end;
    end, 
    DiscardWarning = function(v39, v40)
        return v1.Dictionary.join(v39, {
            Warnings = v1.List.removeValue(v39.Warnings, v40.key)
        });
    end
});
