local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(script.Parent.UserAndGroupFilter);
local v3 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
return {
    name = "UserAndGroupFilter", 
    summary = "A live Search Bar for users and groups", 
    stories = {
        {
            story = function()
                return v1.createElement(v3, {}, {
                    UserAndGroupFilter = v1.createElement(v2, {
                        OnDeleteCreatorPill = function()
                            print("onDeleteCreatorPill");
                        end, 
                        OnSearchUpdate = function()
                            print("onDeleteCreatorPill");
                        end, 
                        OnSelectCreator = function()
                            print("onDeleteCreatorPill");
                        end, 
                        SelectedUsers = {
                            {
                                Name = "Selected Username", 
                                Id = 123, 
                                Type = Enum.CreatorType.User
                            }
                        }, 
                        SelectedGroups = {
                            {
                                Name = "Selected Group name", 
                                Id = 123, 
                                Type = Enum.CreatorType.Group
                            }
                        }
                    })
                });
            end
        }
    }
};
