# Cheat-Keys

This mod sets up the F1-F12 keys in a generic way so that Cheat mod recieve the signals and execute programmed actions.

### Default Keybinds
By default (as of 2.18) Cheat mod will setup the following keybinds.
- F1 cheat_phys_sprint (toggle)
- F2 cheat_phys_hover (toggle, low force, jump to take off)
- F3 cheat_add_buff_immortal
- F3 cheat_remove_buff_immortal (hold)
- F4 cheat_add_buff_invisible
- F4 cheat_remove_buff_invisible (hold)
- F5 cheat_save
- F9 cheat_kill
- F10 cheat_mass_kill

### Reprogram Keybinds

```lua
-- if you want to redo all default keybindings run cheat_action_reset_all first:
-- ex:
cheat_action_reset_all
```

```lua
-- if you want to remove specific default bindings use cheat_action_reset:
-- ex: reset F2 key press action
cheat_action_reset slot:2 type:press
```

```lua
-- Custom F9 bindings.

-- Start binding for the F9 key. NOTE: You can only bind 1 action at a time.
cheat_action_begin_binding slot:9 type:press

-- You can bind any number of lua code fragments.
cheat_action_bind_lua_code System.LogAlways("MY LOC IS:")

-- You can bind any number of console commands.
cheat_action_bind_console_command cheat_loc

-- When done with command/lua bindings call cheat_action_end_binding 
-- which will register all of anonymous functions to the action/keybinding.
cheat_action_end_binding

-- Test it via command or F9.
cheat_action slot:9 type:press
```

```lua
-- F5 Quick Save
cheat_action_begin_binding slot:5 type:press
cheat_action_bind_console_command cheat_save
cheat_action_end_binding

-- Test it via command or F5.
cheat_action slot:5 type:press
```

```lua
-- F2 Sprint
cheat_action_begin_binding slot:2 type:press
cheat_action_bind_console_command cheat_phys_sprint
cheat_action_end_binding

-- Test it via command or F2.
cheat_action slot:2 type:press
```
