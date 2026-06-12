[...]
15301|                 local PlayerList = PlayerListSection:list({flag = "SelectPlayer_SouthBronx", options = {}, callback = function(state)
15302|                     Config.South_Bronx.PlayerUtilities.SelectedPlayer = tostring(state)
15303|                 end})
[...]
15329|                 PlayerOptionsSection:toggle({type = "toggle", name = "Spectate Player", flag = "SpectatePlayer_SouthBronx", default = false, callback = function(state)
15330|                     Config.South_Bronx.PlayerUtilities.SpectatePlayer = state
15331|                 end})
15332| 
15333|                 PlayerOptionsSection:toggle({type = "toggle", name = "Bring Player", flag = "BringPlayer_SouthBronx", default = false, callback = function(state)
15334|                     Config.South_Bronx.PlayerUtilities.BringingPlayer = state
15335|                 end})
[...]
15371|                 PlayerOptionsSection:button({name = "Get Into Players Car", callback = function()
15372|                     pcall(SitInPlayersVehicle, Players[Config.South_Bronx.PlayerUtilities.SelectedPlayer])
15373|                 end})
[...]
15389|             FarmingSection:dropdown({name = "Mope Type", flag = "MopType_BlockSpin", width = 120, items = {"Default", "Silver", "Gold", "Diamond"}, seperator = false, multi = false, default = '[...]
15390|                 Config.BlockSpin.AutoFarming.MopType = state
15391|             end})
[...]
15417|         GeneralSection:toggle({type = "toggle", name = "Enabled", flag = "SilentAim_Enabled", default = false, callback = function(state)
15418|             Config.Silent.Enabled = state
15419|         end})
15420|             
15421|         GeneralSection:keybind({name = "Keybind", flag = "SilentAim_Bind", mode = "Always", callback = function(state)
15422|             Config.Silent.Targetting = state
15423|         end})
[...]
15427|         SettingsSection:toggle({name = "Visible Check", flag = "SilentAim_Wallcheck", type = "toggle", default = false, callback = function(state)
15428|             Config.Silent.WallCheck = state
15429|         end})
[...]
15474|         SettingsSection:slider({name = "Max Distance", flag = "MaxDistance_Silent", min = 0, max = (Game_Name == "South Bronx") and 300 or 3000, default = (Game_Name == "South Bronx") and 300 o[...]
15475|             Config.Silent.MaxDistance = state
15476|         end})
15477| 
15478|         SettingsSection:slider({name = "Hit Chance", flag = "SilentAim_HitChance", min = 0, max = 100, default = 100, suffix = "%", callback = function(state)
15479|             Config.Silent.HitChance = state
15480|         end})
[...]
15484|         BulletSettingsSection:toggle({type = "toggle", name = "Bullet Penetration", flag = "SilentAim_WallBang", default = false, callback = function(state)
15485|             Config.Silent.WallBang = state
15486|         end})
[...]
15492|         FieldOfViewSection:toggle({type = "toggle", name = "Enabled", flag = "SilentAim_Usefov", default = false, callback = function(state)
15493|             Config.Silent.UseFieldOfView = state
15494|         end})
15495| 
15496|         FieldOfViewSection:toggle({type = "toggle", name = "Draw Circle", flag = "SilentAim_DrawCircle", default = false, callback = function(state)
15497|             Config.Silent.DrawFieldOfView = state
15498|         end}):colorpicker({flag = "SilentAim_FOVColor", default = Color3.new(1,1,1), alpha = 0.25, callback = function(state, alpha)
15499|             Config.Silent.FieldOfViewColor = state
15500|             Config.Silent.FieldOfViewTransparency = 1 - alpha
15501|         end})
[...]
15505|         FieldOfViewSettingsSection:slider({name = "Radius", flag = "SilentAim_Radius", min = 0, max = 1000, default = 100, suffix = "°", callback = function(state)
15506|             Config.Silent.Radius = state
15507|         end})
15508| 
15509|         FieldOfViewSettingsSection:slider({name = "Sides", flag = "SilentAim_Sides", min = 3, max = 100, default = 25, suffix = "°", callback = function(state)
15510|             Config.Silent.Sides = state
15511|         end})
[...]
15515|         SnaplineSection:toggle({type = "toggle", name = "Enabled", flag = "SilentAim_Snapline", default = false, callback = function(state)
15516|             Config.Silent.Snapline = state
15517|         end}):colorpicker({flag = "SilentAim_SnaplineColor", default = Color3.new(1,1,1), alpha = 1, callback = function(state, alpha)
15518|             Config.Silent.SnaplineColor = state
15519|         end})
15520| 
15521|         SnaplineSection:slider({name = "Snapline Thickness", flag = "SilentAim_SnaplineThickness", min = 1, max = 5, default = 1, callback = function(state)
15522|             Config.Silent.SnaplineThickness = state
15523|         end})
[...]
15531|         GeneralSection:toggle({type = "toggle", name = "Enabled", flag = "AimlockAim_Enabled", default = false, callback = function(state)
15532|             Config.Aimlock.Enabled = state
15533|         end})
15534|             
15535|         GeneralSection:keybind({name = "Keybind", flag = "AimlockAim_Bind", mode = "Toggle", callback = function(state)
15536|             Config.Aimlock.Aiming = state
15537|             TargetTable[1] = nil
15538|         end})
[...]
15542|         SettingsSection:toggle({name = "Visible Check", flag = "AimlockAim_Wallcheck", type = "toggle", default = false, callback = function(state)
15543|             Config.Aimlock.WallCheck = state
15544|         end})
[...]
15581|         SettingsSection:dropdown({name = "Aimlock Type", flag = "Aimlock_AimType", width = 110, items = {'Camera', 'Mouse'}, seperator = false, multi = false, default = 'Mouse', callback = func[...]
15582|             Config.Aimlock.Type = state
15583|         end})
15584| 
15585|         SettingsSection:dropdown({name = "Target Parts", flag = "Aimlock_TargetPart", width = 110, items = BodyParts, seperator = false, multi = false, default = 'Head', callback = function(sta[...]
15586|             Config.Aimlock.TargetPart = state
15587|         end})
15588| 
15589|         SettingsSection:slider({name = "Max Distance", flag = "MaxDistance_Aimlock", min = 0, max = 3000, default = ((Game_Name == "South Bronx") and 300 or 1000), suffix = "st", callback = fun[...]
15590|             Config.Aimlock.MaxDistance = state
15591|         end})
15592| 
15593|         SettingsSection:slider({name = "Smoothness", flag = "MaxDistance_Smoothness", min = 0, max = 100, default = 10, suffix = "%", callback = function(state)
15594|             Config.Aimlock.Smoothness = state/10
15595|         end})
[...]
15601|         FieldOfViewSection:toggle({type = "toggle", name = "Enabled", flag = "AimlockAim_Usefov", default = false, callback = function(state)
15602|             Config.Aimlock.UseFieldOfView = state
15603|         end})
15604| 
15605|         FieldOfViewSection:toggle({type = "toggle", name = "Draw Circle", flag = "AimlockAim_DrawCircle", default = false, callback = function(state)
15606|             Config.Aimlock.DrawFieldOfView = state
15607|         end}):colorpicker({flag = "AimlockAim_FOVColor", default = Color3.new(1,1,1), alpha = 0.25, callback = function(state, alpha)
15608|             Config.Aimlock.FieldOfViewColor = state
15609|             Config.Aimlock.FieldOfViewTransparency = 1 - alpha
15610|         end})
[...]
15614|         FieldOfViewSettingsSection:slider({name = "Radius", flag = "AimlockAim_Radius", min = 0, max = 1000, default = 100, suffix = "°", callback = function(state)
15615|             Config.Aimlock.Radius = state
15616|         end})
15617| 
15618|         FieldOfViewSettingsSection:slider({name = "Sides", flag = "AimlockAim_Sides", min = 3, max = 100, default = 25, suffix = "°", callback = function(state)
15619|             Config.Aimlock.Sides = state
15620|         end})
[...]
15624|         SnaplineSection:toggle({type = "toggle", name = "Enabled", flag = "AimlockAim_Snapline", default = false, callback = function(state)
15625|             Config.Aimlock.Snapline = state
15626|         end}):colorpicker({flag = "AimlockAim_SnaplineColor", default = Color3.new(1,1,1), alpha = 1, callback = function(state, alpha)
15627|             Config.Aimlock.SnaplineColor = state
15628|         end})
15629| 
15630|         SnaplineSection:slider({name = "Snapline Thickness", flag = "AimlockAim_SnaplineThickness", min = 1, max = 5, default = 1, callback = function(state)
15631|             Config.Aimlock.SnaplineThickness = state
15632|         end})
[...]
15654|                     GeneralSection:toggle({name = Index, flag = Index.."_TB3", type = "toggle", default = false, callback = function(state)
15655|                         if Index == "Fully Automatic" then Index = "Automatic" end
15656|                         Config.TheBronx.Modifications[Index:gsub(" ", "")] = state
15657|                     end})
[...]
15662|                 GeneralSection:slider({name = "Recoil Percentage", flag = "RecoilValue_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15663|                     Config.TheBronx.Modifications.RecoilPercentage = state
15664|                 end})
15665| 
15666|                 GeneralSection:slider({name = "Spread Percentage", flag = "SpreadValue_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15667|                     Config.TheBronx.Modifications.SpreadPercentage = state
15668|                 end})
15669| 
15670|                 GeneralSection:slider({name = "Fire Rate Percentage", flag = "FireRateSpeed_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15671|                     Config.TheBronx.Modifications.FireRateSpeed = state
15672|                 end})
15673| 
15674|                 GeneralSection:slider({name = "Reload Speed Percentage", flag = "ReloadSpeed_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15675|                     Config.TheBronx.Modifications.ReloadSpeed = state
15676|                 end})
15677| 
15678|                 GeneralSection:slider({name = "Equip Speed Percentage", flag = "EquipSpeed_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15679|                     Config.TheBronx.Modifications.EquipSpeed = state
15680|                 end})
[...]
15686|                 GeneralSection:toggle({name = 'Enabled', flag = 'HitboxesEnabled', type = 'toggle', default = false, callback = function(state)
15687|                     Config.MiscSettings.Hitbox_Expander.Enabled = state
15688|                 end}):colorpicker({flag = 'HitboxesColor', color = Color3.new(1,1,1), alpha = 1, callback = function(state, alpha)
[...]
15693|                 GeneralSection:slider({name = "Hitbox Multiplier", flag = "HitBox_Multiplier", min = 1, max = 20, default = 10, callback = function(state)
15694|                     Config.MiscSettings.Hitbox_Expander.Multiplier = state
15695|                 end})
15696| 
15697|                 GeneralSection:dropdown({name = "Hitbox Part", flag = "HitBoxPart", items = {"Head", "Torso"}, default = "Torso", multi = false, callback = function(value)
15698|                     Config.MiscSettings.Hitbox_Expander.Part = (value == "Head") and "Head" or "HumanoidRootPart"
15699|                 end})
15700| 
15701|                 GeneralSection:dropdown({name = "Hitbox Material", flag = "HitBoxMaterial", items = {
[...]
15708|                 end})
[...]
15731|                     GeneralSection:toggle({name = Index, flag = Index.."_TB3", type = "toggle", default = false, callback = function(state)
15732|                         if Index == "Fully Automatic" then Index = "Automatic" end
15733|                         Config.South_Bronx.Modifications[Index:gsub(" ", "")] = state
15734|                     end})
[...]
15739|                 GeneralSection:slider({name = "Recoil Percentage", flag = "RecoilValue_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15740|                     Config.South_Bronx.Modifications.RecoilPercentage = state
15741|                 end})
15742| 
15743|                 GeneralSection:slider({name = "Spread Percentage", flag = "SpreadValue_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15744|                     Config.South_Bronx.Modifications.SpreadPercentage = state
15745|                 end})
15746| 
15747|                 GeneralSection:slider({name = "Fire Rate Percentage", flag = "FireRateSpeed_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15748|                     Config.South_Bronx.Modifications.FireRateSpeed = state
15749|                 end})
15750| 
15751|                 GeneralSection:slider({name = "Reload Speed Percentage", flag = "ReloadSpeed_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15752|                     Config.South_Bronx.Modifications.ReloadSpeed = state
15753|                 end})
15754| 
15755|                 GeneralSection:slider({name = "Equip Speed Percentage", flag = "EquipSpeed_TB3", default = 50, min = 0, max = 100, suffix = "%", callback = function(state)
15756|                     Config.South_Bronx.Modifications.EquipSpeed = state
15757|                 end})
[...]
15924|     PlayerVisualsSettingsSection:slider({name = "Max Render Distance", flag = "MaxRenderDistance_Visuals", min = 10, max = 5000, default = 1000, suffix = "st", callback = function(state)
15925|         Config.ESP.MaxDistance = state
15926|     end})
[...]
15936|         DuplicationSection:textbox({name = "Selected Player's Name", callback = function(text)
[...]
15949|         end})
15950| 
15951|         DuplicationSection:textbox({name = "Amount To Send (Max Is $20000)", callback = function(text)
15952|             writefile("SouthBronxAmountRealGame.txt", text)
15953|         end})
[...]

