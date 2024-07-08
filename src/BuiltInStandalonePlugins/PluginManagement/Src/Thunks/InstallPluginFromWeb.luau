local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
local v2 = require(l_Parent_0.Src.Actions.SetPluginInstallStatus);
local v3 = require(l_Parent_0.Src.Actions.SetPluginId);
local v4 = require(l_Parent_0.Src.Actions.SetPluginMetadata);
local v5 = require(l_Parent_0.Src.Actions.ClearPluginData);
return function(v6, v7, v8, v9)
    return function(v10)
        v10:dispatch(v5(v9));
        v10:dispatch(v3(v9));
        v10:flush();
        v8:report("TryInstallPluginFromWeb", v9);
        local function _(v11, v12)
            if v11 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                v8:report("InstallPluginFromWebSuccess", v9);
            else
                v8:report("InstallPluginFromWebFailure", v9, v11);
            end;
            v10:dispatch(v2(v9, v11, v12));
        end;
        v7.Inventory.v1.Users.Items.IsOwned(v6:GetUserId(), Enum.AvatarItemType.Asset, v9):andThen(function(v14)
            if not (tostring(v14.responseBody) == "true") then
                local l_PLUGIN_NOT_OWNED_0 = v1.PLUGIN_NOT_OWNED;
                if l_PLUGIN_NOT_OWNED_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                    v8:report("InstallPluginFromWebSuccess", v9);
                else
                    v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_NOT_OWNED_0);
                end;
                v10:dispatch(v2(v9, l_PLUGIN_NOT_OWNED_0, ""));
                return ;
            else
                return v7.Develop.v1.Plugins({
                    v9
                }):andThen(function(v16)
                    if not v16.responseBody or not v16.responseBody.data then
                        local l_PLUGIN_DETAILS_UNAVAILABLE_0 = v1.PLUGIN_DETAILS_UNAVAILABLE;
                        local v18 = tostring(v16.responseBody);
                        if l_PLUGIN_DETAILS_UNAVAILABLE_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                            v8:report("InstallPluginFromWebSuccess", v9);
                        else
                            v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_DETAILS_UNAVAILABLE_0);
                        end;
                        v10:dispatch(v2(v9, l_PLUGIN_DETAILS_UNAVAILABLE_0, v18));
                        return ;
                    else
                        local v19 = v16.responseBody.data[1];
                        if not v19 or not v19.versionId then
                            local l_PLUGIN_DETAILS_UNAVAILABLE_1 = v1.PLUGIN_DETAILS_UNAVAILABLE;
                            local v21 = tostring(v16.responseBody);
                            if l_PLUGIN_DETAILS_UNAVAILABLE_1 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                                v8:report("InstallPluginFromWebSuccess", v9);
                            else
                                v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_DETAILS_UNAVAILABLE_1);
                            end;
                            v10:dispatch(v2(v9, l_PLUGIN_DETAILS_UNAVAILABLE_1, v21));
                            return ;
                        else
                            v10:dispatch(v4(v9, v19.name, v19.description or "", tostring(v19.versionId) or "", v19.created or "", v19.updated or ""));
                            local l_versionId_0 = v19.versionId;
                            local l_status_0, l_result_0 = pcall(function()
                                v6:TryInstallPlugin(v9, l_versionId_0);
                            end);
                            if not l_status_0 then
                                local l_PLUGIN_NOT_INSTALLED_0 = v1.PLUGIN_NOT_INSTALLED;
                                local v26 = l_result_0 or "";
                                if l_PLUGIN_NOT_INSTALLED_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                                    v8:report("InstallPluginFromWebSuccess", v9);
                                else
                                    v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_NOT_INSTALLED_0);
                                end;
                                v10:dispatch(v2(v9, l_PLUGIN_NOT_INSTALLED_0, v26));
                                return ;
                            else
                                local l_PLUGIN_INSTALLED_SUCCESSFULLY_0 = v1.PLUGIN_INSTALLED_SUCCESSFULLY;
                                if l_PLUGIN_INSTALLED_SUCCESSFULLY_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                                    v8:report("InstallPluginFromWebSuccess", v9);
                                else
                                    v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_INSTALLED_SUCCESSFULLY_0);
                                end;
                                v10:dispatch(v2(v9, l_PLUGIN_INSTALLED_SUCCESSFULLY_0, ""));
                                return ;
                            end;
                        end;
                    end;
                end, function(v28)
                    local l_HTTP_ERROR_0 = v1.HTTP_ERROR;
                    if l_HTTP_ERROR_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                        v8:report("InstallPluginFromWebSuccess", v9);
                    else
                        v8:report("InstallPluginFromWebFailure", v9, l_HTTP_ERROR_0);
                    end;
                    v10:dispatch(v2(v9, l_HTTP_ERROR_0, v28));
                end);
            end;
        end, function(v30)
            local l_HTTP_ERROR_1 = v1.HTTP_ERROR;
            if l_HTTP_ERROR_1 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                v8:report("InstallPluginFromWebSuccess", v9);
            else
                v8:report("InstallPluginFromWebFailure", v9, l_HTTP_ERROR_1);
            end;
            v10:dispatch(v2(v9, l_HTTP_ERROR_1, v30));
        end);
    end;
end;
