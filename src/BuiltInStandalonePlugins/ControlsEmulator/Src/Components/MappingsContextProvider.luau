local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local l_FAKE_CONNECTED_GAMEPAD_ID_0 = v4.FAKE_CONNECTED_GAMEPAD_ID;
local function v10(v8, v9)
    if v9.type == "SetCurrentSelection" then
        return v2.Dictionary.join(v8, {
            CurrentSelection = v9.payload.CurrentSelection, 
            Mappings = v8.Mappings
        });
    elseif v9.type == "SetMappings" then
        return v2.Dictionary.join(v8, {
            Mappings = v2.Dictionary.join(v8.Mappings, v9.payload.mappings), 
            gamepadId = v9.payload.gamepadId
        });
    elseif v9.type == "SetGamepadId" then
        return v2.Dictionary.join(v8, {
            gamepadId = v9.payload.gamepadId
        });
    else
        return ;
    end;
end;
local function v21(v11, v12)
    return {
        SetCurrentSelection = function(v13)
            v11({
                type = "SetCurrentSelection", 
                payload = {
                    CurrentSelection = v13
                }
            });
        end, 
        SetMappings = function(v14)
            v11({
                type = "SetMappings", 
                payload = {
                    mappings = v14
                }
            });
        end, 
        LoadMappingsForGamepad = function(v15)
            if v12.gamepadId == v15 then
                return ;
            else
                pcall(function()
                    l_StudioDeviceEmulator_0:ConnectGamepad(v15, Enum.GamepadType.XboxOne);
                end);
                local v16 = {};
                for _, v18 in ipairs(v4.AVAILABLE_MAPPINGS) do
                    local l_status_0, l_result_0 = pcall(function()
                        return l_StudioDeviceEmulator_0:GetKeyboardShortcut(v15, v18, v4.VECTOR_PRESSED);
                    end);
                    if l_status_0 then
                        v16[v18] = l_result_0;
                    end;
                end;
                v11({
                    type = "SetMappings", 
                    payload = {
                        mappings = v16, 
                        gamepadId = v15
                    }
                });
                return ;
            end;
        end
    };
end;
MappingsContextProvider = function(v22)
    local v23, v24 = v1.useReducer(v10, {
        CurrentSelection = nil, 
        Mappings = {}, 
        gamepadId = 0
    });
    local v25 = v1.useMemo(function()
        return (v21(v24, v23));
    end, {
        v24, 
        v23
    });
    v1.useEffect(function()
        if v23.gamepadId == 0 then
            v25.LoadMappingsForGamepad(l_FAKE_CONNECTED_GAMEPAD_ID_0);
        end;
    end, {
        v23.gamepadId, 
        v25
    });
    return v1.createElement(v6.Provider, {
        value = v25
    }, {
        v1.createElement(v5.Provider, {
            value = v23
        }, v22.children)
    });
end;
return MappingsContextProvider;
