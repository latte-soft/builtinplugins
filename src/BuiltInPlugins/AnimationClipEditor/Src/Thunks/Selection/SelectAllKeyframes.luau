local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
return function()
    return function(v6)
        local l_AnimationData_0 = v6:getState().AnimationData;
        if l_AnimationData_0 then
            local v8 = {};
            for v9, v10 in pairs(l_AnimationData_0.Instances) do
                v8[v9] = {};
                for v11, v12 in pairs(v10.Tracks) do
                    v8[v9][v11] = {};
                    local function v13(v14, v15)
                        local l_Type_0 = v15.Type;
                        local v17 = {};
                        local v18 = nil;
                        if not (not v15.Components or not v2.COMPONENT_TRACK_TYPES[l_Type_0]) then
                            v18 = {};
                            for _, v20 in pairs(v2.COMPONENT_TRACK_TYPES[v15.Type]._Order) do
                                v18[v20] = {};
                                v17 = v1.Dictionary.join(v17, v13(v18[v20], v15.Components[v20]));
                            end;
                        end;
                        if v15.Data then
                            for v21, _ in pairs(v15.Data) do
                                v17[v21] = true;
                            end;
                        end;
                        v14.Selection = v17;
                        v14.Components = v18;
                        return v17;
                    end;
                    v13(v8[v9][v11], v12);
                end;
            end;
            v6:dispatch(v5(v8));
            return ;
        else
            return ;
        end;
    end;
end;
