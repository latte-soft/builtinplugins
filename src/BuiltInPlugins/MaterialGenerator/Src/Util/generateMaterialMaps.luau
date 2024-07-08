local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Promise);
local v3 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local function _(v4)
    local l_Textures_0 = v4.Textures;
    local v6 = false;
    if l_Textures_0.MetalnessMap ~= nil then
        v6 = false;
        if l_Textures_0.NormalMap ~= nil then
            v6 = l_Textures_0.RoughnessMap ~= nil;
        end;
    end;
    return v6;
end;
return function(v8, v9)
    local l_Textures_1 = v9.Textures;
    local v11 = false;
    if l_Textures_1.MetalnessMap ~= nil then
        v11 = false;
        if l_Textures_1.NormalMap ~= nil then
            v11 = l_Textures_1.RoughnessMap ~= nil;
        end;
    end;
    if not v11 then
        return v2.new(function(v12, v13)
            task.spawn(function()
                local v14 = nil;
                local l_status_0, l_result_0 = pcall(function()
                    v14 = v8:GenerateMaterialMapsAsync(v9.Id);
                end);
                if l_status_0 then
                    if v14 then
                        v12({
                            ColorMap = v14.ColorMap, 
                            MetalnessMap = v14.MetalnessMap, 
                            NormalMap = v14.NormalMap, 
                            RoughnessMap = v14.RoughnessMap
                        });
                        return ;
                    else
                        v13({
                            ErrorType = v3.FailedToGenerate
                        });
                        return ;
                    end;
                else
                    if not l_result_0 then
                        v13({
                            ErrorType = v3.Unknown
                        });
                    else
                        v13({
                            ErrorType = v3.CustomMessage, 
                            ErrorMessage = l_result_0
                        });
                    end;
                    return ;
                end;
            end);
        end);
    else
        return v2.resolve(v9.Textures);
    end;
end;
