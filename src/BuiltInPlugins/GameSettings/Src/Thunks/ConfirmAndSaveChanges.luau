local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.SaveChanges);
local v2 = require(l_Parent_0.Src.Components.Dialog.WarningDialog);
local v3 = require(l_Parent_0.Src.Components.Dialog.SimpleDialog);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
return function(v5, v6)
    return function(v7)
        local v8 = v7:getState();
        local l_v5_0 = v5;
        local v10 = {
            isActive = {
                Title = l_v5_0:getText("General", "PrivateDialogHeader"), 
                Header = l_v5_0:getText("General", "PrivateDialogPrompt"), 
                Description = l_v5_0:getText("General", "PrivateDialogBody"), 
                Buttons = {
                    l_v5_0:getText("General", "ButtonCancel"), 
                    l_v5_0:getText("General", "ButtonSave")
                }
            }, 
            universeAvatarType = {
                Title = l_v5_0:getText("General", "AvatarDialogHeader"), 
                Header = l_v5_0:getText("General", "AvatarDialogPrompt"), 
                Description = l_v5_0:getText("General", "AvatarDialogBody"), 
                Buttons = {
                    l_v5_0:getText("General", "ReplyNo"), 
                    l_v5_0:getText("General", "ReplyYes")
                }
            }
        };
        local v11 = {
            Size = Vector2.new(343, 145), 
            Title = l_v5_0:getText("General", "ErrorsOnSaveHeader"), 
            Header = l_v5_0:getText("General", "ErrorsOnSaveBody"), 
            Buttons = {
                l_v5_0:getText("General", "ReplyOK")
            }
        };
        return l_Promise_0.new(function(v12, v13)
            spawn(function()
                for _, v15 in pairs(v8.Settings.Warnings) do
                    if not v6.showDialog(v2, v10[v15]):await() then
                        v13();
                    end;
                end;
                v12();
            end);
        end):andThen(function()
            return v7:dispatch(v1()):catch(function(_)
                v6.showDialog(v3, v11):catch(function()
                end);
            end);
        end):andThen(function(v17)
            return v17;
        end);
    end;
end;
