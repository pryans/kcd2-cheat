--[[
ItemManager
    GetItemOwner
    GetItemUIName
    AddOnEquipBuff
    GetItemName
    RemoveItem
    GetItem
    IsItemOversized
]]

-- ============================================================================
-- helpers
-- ============================================================================
Cheat.g_lockpick_id = "8d76f58e-a521-4205-a7e8-9ac077eee5f0"
Cheat.g_item_database = {}
Cheat.g_item_category_map = {
    MiscItem = 0,
    MeleeWeapon = 1,
    MissileWeapon = 2,
    Ammo = 3,
    Armor = 4,
    Food = 5,
    Money = 6,
    DiceBadge = 7,
    Document = 8,
    CraftingMaterial = 9,
    Herb = 10,
    AlchemyBase = 11,
    NPCTool = 12,
    Ointment = 13,
    Poison = 14,
    Die = 15,
    Helmet = 16,
    Key = 17,
    KeyRing = 18,
    QuickSlotContainer = 19,
    item = 21,
    PickableItem = 22,
    divisible_item = 23,
    weapon_equip = 24,
    player_item = 25,
    equippable_item = 26,
    weapon = 27,
    consumable_item = 28,
    Hood = 29,
    ItemAlias = 99
}
Cheat.g_player_data_m = "userdata: 0500000000000A53"
Cheat.g_player_data_f = "userdata: 05000000000000F5"
Cheat.g_damageall_cat_ids = Cheat:createLookupTable(1, 2, 4, 16, 27)
Cheat.g_removestolen_cat_ids = Cheat:createLookupTable(0, 1, 2, 3, 4, 5, 8, 9, 10, 13, 14, 15, 16, 27)
Cheat.g_ownstolen_cat_ids = Cheat:createLookupTable(0, 1, 2, 3, 4, 5, 8, 9, 10, 13, 14, 15, 16, 27)
Cheat.g_repairall_cat_ids = Cheat:createLookupTable(0, 1, 2, 4, 5, 9, 13, 14, 16, 27)

function Cheat:initItemDatabase()
    Cheat:xmlLoadDatabase("libs/tables/item/item.xml",
        function (tag, attributes)
            local attr_string = Cheat:serializeTable(attributes)
            if attributes["Id"] and attributes["Name"] and attributes["UIName"] then
                Cheat:logDebug("Adding item: %s:: %s", tag, attr_string)
                -- Xml DB uses init caps, lowercase all the keys
                local item = Cheat:lowercaseTableKeys(attributes)
                item["item_category_name"] = tag
                item["item_category_id"] = Cheat.g_item_category_map[tag]
                table.insert(Cheat.g_item_database, item)
            else
                Cheat:logWarn("Skipping item: %s:: %s", tag, attr_string)
            end
        end
    )
end

function Cheat:hasItem(id)
    return player.inventory:GetCountOfClass(id) > 0
end

function Cheat:addItem(id, amount, health, notify)
    amount = amount or 1
    player.inventory:CreateItem(id, health, amount)
    amount = player.inventory:CreateItemOfClass(id, amount)
    if notify then
        Game.ShowItemsTransfer(id, -amount)
    end
end

function Cheat:removeItem(id, amount, notify)
    amount = amount or 1
    local amount_removed = player.inventory:DeleteItemOfClass(id, amount)
    if notify then
        Game.ShowItemsTransfer(id, -amount_removed)
    end
    return amount_removed
end

function Cheat:findItems(searchKey)
    return Cheat:findRows(Cheat.g_item_database, searchKey, "id", "name")
end

function Cheat:findItem(searchKey)
    return Cheat:findRow(Cheat.g_item_database, searchKey, "id", "name")
end

function Cheat:getItemCategoryId(item_id)
    local item = Cheat:findItem(item_id)
    if item and item.item_id == item_id then
        return item.data["item_category_id"]
    end
    return nil
end

function Cheat:buildUserItem(userdata)
    local userdata_item = ItemManager.GetItem(userdata)
    local uid = userdata_item.id
    local item_id = tostring(userdata_item.class)
    local item = {
        uid = uid,
        id = item_id,
        amount = userdata_item.amount,
        health = userdata_item.health,
        category_id = Cheat:getItemCategoryId(item_id),
        ui_name = ItemManager.GetItemUIName(item_id),
        name = ItemManager.GetItemName(item_id),
        owner = tostring(ItemManager.GetItemOwner(uid))
    }
    Cheat:logDebug(Cheat:serializeTable(item))
    return item
end

function Cheat:recreateItems(mode, health)
    for _, userdata in pairs(player.inventory:GetInventoryTable()) do
        local item = Cheat:buildUserItem(userdata)
        local shouldDelete = false
        local shouldRecreate = false

        if mode == "damageall" then
            if item.health > health and Cheat.g_damageall_cat_ids[item.category_id] then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        if mode == "removestolen" then
            if Cheat.g_removestolen_cat_ids[item.category_id] and item.owner ~= Cheat.g_player_data_m and item.owner ~= Cheat.g_player_data_f then
                shouldDelete = true
                shouldRecreate = false
            end
        end

        if mode == "ownstolen" then
            if Cheat.g_ownstolen_cat_ids[item.category_id] and item.owner ~= Cheat.g_player_data_m and item.owner ~= Cheat.g_player_data_f then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        if mode == "repairall" then
            if item.health < health and Cheat.g_repairall_cat_ids[item.category_id] then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        if shouldDelete then
            Cheat:logDebug("recreateitem delete [%s] [%s]", item.ui_name, tostring(item.id))
            Cheat:removeItem(item.id, item.amount, false)
        end

        if shouldRecreate then
            Cheat:logDebug("recreateitem create [%s] [%s] [%s]", item.ui_name, tostring(item.class), tostring(health))
            Cheat:addItem(item.id, item.amount, health, false)
        end
    end
end

-- ============================================================================
-- cheat_find_items
-- ============================================================================
Cheat.cheat_find_items_args = {
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of a the item's name. Leave empty to list all items.") end
}
Cheat:createCommand("cheat_find_items", "Cheat:cheat_find_items(%line)", Cheat.cheat_find_items_args,
    "Finds all of the items that match the given token.",
    "Show all items", "cheat_find_items token:",
    "Show all items with 'arrow' in their name", "cheat_find_items token:arrow")
function Cheat:cheat_find_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_items_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    if tokenErr then
        return false
    end

    local items = Cheat:findItems(token)
    if #items == 0 then
        return false
    end

    for _, item in ipairs(items) do
        Cheat:logInfo("Item: name=%s id=%s %s", item.item_id, item.item_name, Cheat:serializeTable(item.data))
    end
    return true
end

-- ============================================================================
-- cheat_add_item
-- ============================================================================
Cheat.cheat_add_item_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The item ID or all or part of a the item's name. Uses last match from cheat_find_items.") end,
    amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The number of items to add. Default 1.") end,
    health = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The condition of the item added. Default 1.") end
}
Cheat:createCommand("cheat_add_item", "Cheat:cheat_add_item(%line)", Cheat.cheat_add_item_args,
    "Adds an item to the player's inventory.",
    "Adds the last item with 'bow' in its name", "cheat_add_item id:bow",
    "Adds the item ui_nm_arrow_hunter by ID", "cheat_add_item id:802507e9-d620-47b5-ae66-08fcc314e26a",
    "Adds 10 items ui_nm_arrow_hunter by fullname with 50 condition", "cheat_add_item id:ui_nm_arrow_hunter amount:10 health:0.5")
function Cheat:cheat_add_item(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_item_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local amount, amountErr = Cheat:argsGet(args, "amount")
    local health, healthErr = Cheat:argsGet(args, "health")

    if idErr or amountErr or healthErr then
        return
    end

    local item_id, item_name = Cheat:findDatabaseRow("item", id)
    if not item_id then
        Cheat:logError("Item [%s] not found.", tostring(id))
        return false
    end

    if amount < 0 then
        amount = 1
        Cheat:logWarn("Setting amount to 1.")
    end

    if health < 0 then
        health = 1
        Cheat:logWarn("Setting health to 1.")
    end

    Cheat:addItem(item_id, amount, health, true)
    Cheat:logInfo("Added [%s] item [%s] to player's inventory (health [%s]).", tostring(amount), tostring(item_name), tostring(health))
    return true
end

-- cheat_add_all_items
-- ============================================================================
Cheat:createCommand("cheat_add_all_items", "Cheat:cheat_add_all_items()", nil,
    "Adds all items the player's inventory. This is probably a bad idea because of your limmited carry weight...",
    "Add all items", "cheat_add_all_items")
function Cheat:cheat_add_all_items()
    local items = Cheat:findDatabaseRows("item", nil)
    if not items or #items == 0 then
        Cheat:logError("No items found in item database.")
        return false
    end

    for _, item in pairs(items) do
        Cheat:addItem(item.id, 1, 1, false)
    end
    Cheat:logInfo("All items added.")
    return true
end

-- ============================================================================
-- cheat_remove_item
-- ============================================================================
Cheat.cheat_remove_item_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The item ID or all or part of a the item's name. Uses last match from cheat_find_items.") end,
    amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The number of items to remove. Default 1.") end,
}
Cheat:createCommand("cheat_remove_item", "Cheat:cheat_remove_item(%line)", Cheat.cheat_remove_item_args,
    "Removes an item to the player's inventory.",
    "Removes the last item with 'bow' in its name", "cheat_remove_item id:bow",
    "Removes the item ui_nm_arrow_hunter by ID", "cheat_remove_item id:802507e9-d620-47b5-ae66-08fcc314e26a",
    "Removes 10 items ui_nm_arrow_hunter by fullname", "cheat_remove_item id:ui_nm_arrow_hunter amount:10")
function Cheat:cheat_remove_item(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_remove_item_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local amount, amountErr = Cheat:argsGet(args, "amount")
    if idErr or amountErr then
        return false
    end

    local item_id, item_name = Cheat:findDatabaseRow("item", id)
    if not item_id then
        Cheat:logError("No item matching [%s] found in item database.", tostring(id))
        return false
    end

    if not Cheat:hasItem(item_id) then
        Cheat:logError("Item [%s] not found in player's inventory.", tostring(item_name))
        return false
    end

    if amount < 0 then
        amount = 1
        Cheat:logWarn("Setting amount to 1.")
    end

    local amount_removed = Cheat:removeItem(item_id, amount, true)
    Cheat:logInfo("Removed [%s] of item [%s] from player's inventory.", tostring(amount_removed), tostring(item_name))
    return true
end

-- ============================================================================
-- cheat_remove_all_items
-- ============================================================================
Cheat:createCommand("cheat_remove_all_items", "Cheat:cheat_remove_all_items()", nil,
    "Removes all items in the player's inventory.\n$4THIS DELETES YOUR INVENTORY! Move items you want to a stash first.",
    "Delete your inventory.", "cheat_remove_all_items")
function Cheat:cheat_remove_all_items()
    player.inventory:RemoveAllItems()
    Cheat:logInfo("All inventory items deleted.")
    return true
end

-- ============================================================================
-- cheat_remove_all_stolen_items
-- ============================================================================
Cheat:createCommand("cheat_remove_all_stolen_items", "Cheat:cheat_remove_all_stolen_items()", nil,
    "Removes all stolen items from your inventory.",
    "Remove stolen items.", "cheat_remove_all_stolen_items")
function Cheat:cheat_remove_all_stolen_items()
    Cheat:recreateItems("removestolen")
    Cheat:logInfo("All stolen items removed.")
    return true
end

-- ============================================================================
-- cheat_own_all_stolen_items
-- ============================================================================
Cheat:createCommand("cheat_own_all_stolen_items", "Cheat:cheat_own_all_stolen_items()", nil,
    "Makes you the owner of all stolen items in your inventory.\n$8This removes the stolen flag from the item.",
    "Take ownership of stolen items", "cheat_own_all_stolen_items")
function Cheat:cheat_own_all_stolen_items()
    Cheat:recreateItems("ownstolen")
    Cheat:logInfo("All stolen items are now owned by the player.")
    return true
end

-- ============================================================================
-- cheat_repair_all_items
-- ============================================================================
Cheat.cheat_repair_all_items_args = {
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 50, showHelp, "The item condition to apply between 0 and 100. Default 50.") end
}
Cheat:createCommand("cheat_repair_all_items", "Cheat:cheat_repair_all_items(%line)", Cheat.cheat_repair_all_items_args,
    "Repairs all damaged items in your inventory to at least the given condition.\n$4This can uneqip items so don't do this in combat.",
    "Repair all items to 75%.", "cheat_repair_all_items condition:75")
function Cheat:cheat_repair_all_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_repair_all_items_args)
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    if conditionErr then
        return false
    end
    condition = Cheat:clamp(condition / 100, 0, 1)
    Cheat:recreateItems("repairall", condition)
    Cheat:logInfo("All items repaired to at least [%d] condition.", condition * 100)
    return true
end

-- ============================================================================
-- cheat_damage_all_items
-- ============================================================================
Cheat.cheat_damage_all_items_args = {
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 50, showHelp, "The item condition to apply between 0 and 100. Default 50.") end
}
Cheat:createCommand("cheat_damage_all_items", "Cheat:cheat_damage_all_items(%line)", Cheat.cheat_damage_all_items_args,
    "Damages all weapons and armor in your inventory to at most given condition.\n$4This can uneqip items so don't do this in combat.",
    "Damage all weapons and armor to 25%", "cheat_damage_all_items condition:25")
function Cheat:cheat_damage_all_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_damage_all_items_args)
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    if conditionErr then
        return false
    end
    condition = Cheat:clamp(condition / 100, 0, 1)
    Cheat:recreateItems("damageall", condition)
    Cheat:logInfo("All items damaged to at most [%d] condition.", condition * 100)
    return true
end

-- Used by cheat_save_all_items and cheat_load_all_items
Cheat.g_global_items_size = 1
Cheat.g_global_items_classes = {}
Cheat.g_global_items_amounts = {}

-- ============================================================================
-- cheat_save_all_items (To save all items you have at the end of 'a womans lot dlc')
-- ============================================================================
Cheat:createCommand("cheat_save_all_items", "Cheat:cheat_save_all_items()", nil,
    "Saves inventory to temporary game memory.\n" ..
    "Intended for situations where the contents of your inventory will be lost due to game mechanics.\n" ..
    "i.e. A Woman's Lot (DLC). See cheat_load_all_items.",
    "Saves all items", "cheat_save_all_items")
function Cheat:cheat_save_all_items()
    Cheat.g_global_items_size = 1

    for _, userdata in pairs(player.inventory:GetInventoryTable()) do
        Cheat:logInfo("Saved Item")
        local item = ItemManager.GetItem(userdata)
        Cheat.g_global_items_classes[Cheat.g_global_items_size] = item.class
        Cheat.g_global_items_amounts[Cheat.g_global_items_size] = item.amount
        Cheat.g_global_items_size = Cheat.g_global_items_size + 1
    end

    return true
end

-- ============================================================================
-- cheat_load_all_items (To load all items you had at the end of 'a womans lot dlc')
-- ============================================================================
Cheat:createCommand("cheat_load_all_items", "Cheat:cheat_load_all_items()", nil,
    "Loads all items stored by cheat_save_all_items in this game session.",
    "Load all items", "cheat_load_all_items")
function Cheat:cheat_load_all_items()
    if Cheat.g_global_items_size == 1 then
        Cheat:logInfo("Have to run cheat_save_all_items first!")
        return false
    end

    local new_item_health = 1

    for item_num = 1, Cheat.g_global_items_size do
        Cheat:logInfo("Loaded Item")
        local item_class = Cheat.g_global_items_classes[item_num]
        local item_amount = Cheat.g_global_items_amounts[item_num]

        local new_item = ItemManager.CreateItem(item_class, new_item_health, item_amount)
        player.inventory:AddItem(new_item);

        Cheat:logInfo("Added [%s] item [%s] to player's inventory (health [%s]).", tostring(item_amount),
            tostring(item_class), tostring(new_item_health))
        Game.ShowItemsTransfer(item_class, item_amount)
    end

    return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_items.lua loaded")
