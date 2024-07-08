local _ = script:FindFirstAncestor("TextureGenerator");
return {
    CAMERA_DISTANCE_SCALE = 0.8, 
    INITIAL_FOCUS_DIRECTION = Vector3.new(0, 0, -1), 
    MAX_GENERATIONS_MESSAGE = "You have reached the maximum concurrent jobs, please try again later.", 
    INVENTORY_URL = "https://create.roblox.com/dashboard/creations?activeTab=Image", 
    STATUS = {
        CANCELED = "Canceled", 
        PENDING = "Pending", 
        COMPLETED = "Completed", 
        FAILED = "Failed"
    }, 
    DROPDOWN_ACTIONS = {
        INSERT = "Insert", 
        INVENTORY = "Inventory", 
        EXPORT = "Export", 
        REMOVE = "Remove"
    }, 
    GENERATION_ACTIONS = {
        ADD = "ADD", 
        UPDATE = "UPDATE", 
        REMOVE = "REMOVE"
    }, 
    COMPLETED_GENERATIONS_INDEX = 3, 
    MAX_SEED_VALUE = 2147483647, 
    TEXTURE_GENERATOR_LEGAL_ACCEPT = "TextureGeneratorLegalAccept", 
    TERMS_OF_SERVICE_URL = "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer"
};
