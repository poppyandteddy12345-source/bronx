-- ============================================
-- BRONX KEY SYSTEM - 60 UNIQUE KEYS
-- ============================================

local KeySystem = {}
local Verified = false

-- CONFIGURATION
local Config = {
    DISCORD_SERVER = "https://discord.gg/wVssV4VdE3",
    KEY_STORAGE_FILE = "BronxKeyData.json",
}

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 60 UNIQUE KEYS DATABASE
-- 30 x 24-HOUR KEYS (will expire after 24 hours of redemption)
-- 30 x LIFETIME KEYS (never expire)
local KeyDatabase = {
    -- ========== 24-HOUR KEYS (30 TOTAL) ==========
    ["a7c3f891-2b1d-4e6a-9f2c-d8e5b7a1c3f8"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["b2f9e4c1-7a3d-4b9e-8f6c-a1d9e7f3b5c2"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["c5d8a2f1-9c6e-4a7b-b3e9-f7c1a8d2e4f9"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["d1e7b4c9-3f2a-4d8e-c6b1-a9f3e2d7c5b8"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["e8f2c3a5-6b9d-4e1c-f4a7-b2e8d1c9f6a3"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["f3a9e1b7-4c2f-4d6b-a8e2-c5f1b3d9e7a4"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["a6d2f8e4-1b5c-4a9f-d7c2-e9a3f1b8c6e2"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["b4e9c1a3-7f6d-4b2e-c8a5-f2d6e1a9b3c7"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["c7f3a2e8-2d4b-4c6f-a1e9-b5f2c8d3a6e1"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["d2a5f1c9-8e3a-4d7b-f6c1-a4e2b9d7f3c8"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["e9b8c4a1-5f2d-4a6e-c3f7-d8a1e5b2c9f4"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["f1c7d3a9-3b8f-4e2c-a6d1-e4f9c2b5d7a3"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["a4e1f6b2-9d7c-4a3f-b8e2-c1f3a9d5e8b6"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["b8f2e5a1-4c9d-4d6b-e9f3-a2c7b1d4f8e5"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["c3a9f7e2-6b1d-4a8c-d5a1-f2e6c4b9d7a2"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["d6e4b1a8-2f5c-4d9e-c2f7-a9b3e1d8c5f2"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["e2f8c3a5-7a4d-4b6f-a3e1-d7f2b5c9e4a8"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["f5a1d9e7-3c8b-4e2a-f6d1-c4a9b2e7f3d5"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["a9c5e2f1-8d6b-4a3c-b7f4-d1a8e3c9f2b6"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["b3d7f4a2-1e9c-4d5b-c8a2-f5e1b9d4c7a3"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["c8e1a4f9-6f3d-4a2b-d9e4-a7c2f1b5d8e6"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["d4f2b8e5-2a7c-4d1f-a6c3-e9f4b1d7c2a5"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["e1a9c6f3-9b4e-4a7d-f2c8-d5a1e4b9f6c3"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["f7d3a5e2-5c8b-4d6f-c1a9-b4f2e7d1c8a6"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["a2e8f4c1-3d9a-4b5e-a8f6-c2d7e1b9a4f5"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["b6f1a9d4-7e2c-4a8f-d3b1-e8c5f2a9d6e4"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["c1d6e8a3-4f5b-4a9c-f7d2-b5a1e6c4f8d3"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["d9e2c5f7-8a3d-4b6e-c4a8-f1d3b9e5c2a7"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["e5f9a1d3-2b7c-4d8f-a9e2-c6f4b3d1e8a5"] = {expiryTime = nil, isPremium = false, duration = "24H"},
    ["f8a4c2e6-6d1b-4a9f-e3c7-a2d9f5b4e1c6"] = {expiryTime = nil, isPremium = false, duration = "24H"},

    -- ========== LIFETIME KEYS (30 TOTAL) ==========
    ["a3f7e1b9-5c2d-4a8f-d6a1-e9f3b7c5d2a4"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["b7e2f4a1-9d8c-4b3e-c2f6-a8d1e5b9c4f7"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["c4a9d3f2-1b6e-4c8a-f9d4-c1a7e2b8f5d3"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["d2f5e8a1-7c4b-4d9f-a3e6-f1c8b2d4e9a5"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["e6b1a4f9-3d7c-4a2e-c8f2-d5a9e3b6f1c4"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["f1d9c5a8-8e2b-4f6d-b3a7-e4c1f9d2b5e6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["a5e3f2c1-4a9d-4b6f-d8e1-c7f4a2b9d5e3"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["b9f4a1d7-6c3e-4d8b-a9f5-e2c6b4d1f8a3"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["c3a8d1f6-2e5b-4a7c-f3d9-a1e8c5b2f4d7"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["d7f2e5a4-9b8c-4d1f-c6a2-e9f1b3d8c5a6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["e1c9a2f8-5d4b-4a6e-a7c3-f2d5e1b9c4f6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["f4a6d3e1-7f2c-4b8a-d1f5-c4a9e2b6f3d8"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["a8e5f1c7-3a9d-4c2b-e6f4-d2a1c8b5f9e3"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["b2d8c4a9-8e1f-4d5b-c3a7-f1e6b9d4c2a5"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["c6f9a3e2-4b7d-4a1c-a8d5-e3f2c1b7f4d9"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["d1a7f5e8-9c2d-4b6a-f2c4-a9d1e5b3c8f6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["e9f3b1a6-5d8c-4a2e-c7f1-d4a8e2b9f5c3"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["f5c2d9a1-1e6b-4f3d-a5e9-b4c8f2d6e1a7"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["a4d1f8e5-6a3c-4b9f-d3a7-c5f1e2b9a4d6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["b8e9c2f1-2d7a-4a5c-f8d4-a1e6c3b5f9e2"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["c3f7a5d9-7e1b-4d8c-a2f4-e9c6b1d3f7a5"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["d6a2e8f4-4c9d-4b1f-c8a3-f2d7e1b9c4a6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["e2b4f1c8-9a3e-4d6b-a7f5-c1d9e4b2f6d3"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["f9d3a1e5-5f8c-4a2b-d6c1-a8e3f2b7d5a4"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["a7c8f2d1-3b6e-4a9f-e2f7-c4d1a5b8e3f6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["b1e6a9c5-8d2f-4b7a-c3f1-e9a4d2b5f8c6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["c5f4d8a2-4e9b-4a1c-a6d3-f1c7e2b9f4d5"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["d8a1f3e6-1c5d-4b8f-f2d7-a9c4e1b3f9d2"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["e4c9b2f7-6a3d-4e1b-c5f8-d2a6e3b1f7c4"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
    ["f2d7c1a8-2f6b-4a9e-d4a1-c8f3e5b2d9a6"] = {expiryTime = math.huge, isPremium = true, duration = "LIFETIME"},
}

-- Load saved keys from local storage
local function LoadKeys()
    if readfile and isfile then
        if isfile(Config.KEY_STORAGE_FILE) then
            pcall(function()
                local data = HttpService:JSONDecode(readfile(Config.KEY_STORAGE_FILE))
                KeyDatabase = data
            end)
        end
    end
end

-- Save keys to local storage
local function SaveKeys()
    if writefile then
        pcall(function()
            writefile(Config.KEY_STORAGE_FILE, HttpService:JSONEncode(KeyDatabase))
        end)
    end
end

-- Check if key is valid
local function ValidateKey(key)
    if not KeyDatabase[key] then
        return false, "Invalid key"
    end
    
    local keyData = KeyDatabase[key]
    local currentTime = os.time()
    
    -- Check if 24H key has expired
    if keyData.expiryTime and keyData.expiryTime ~= math.huge then
        if currentTime > keyData.expiryTime then
            return false, "Key expired - Please get a new key or upgrade to lifetime"
        end
    end
    
    return true, keyData.duration
end

-- Create Main Key System GUI
function KeySystem:CreateKeyUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = HttpService:GenerateGUID(false)
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999999
    
    if syn then
        syn.protect_gui(ScreenGui)
    elseif gethui then
        ScreenGui.Parent = gethui()
    else
        ScreenGui.Parent = playerGui
    end
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "KeyFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = MainFrame
    
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(0, 170, 255)
    Stroke.Thickness = 2
    Stroke.Parent = MainFrame
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundTransparency = 1
    Title.Text = "🔒 BRONX KEY SYSTEM"
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.TextSize = 28
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame
    
    -- Key Input Box
    local InputBox = Instance.new("TextBox")
    InputBox.Name = "KeyInput"
    InputBox.Size = UDim2.new(1, -40, 0, 50)
    InputBox.Position = UDim2.new(0, 20, 0, 70)
    InputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    InputBox.BorderSizePixel = 0
    InputBox.Text = ""
    InputBox.PlaceholderText = "Paste your key here..."
    InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
    InputBox.TextSize = 13
    InputBox.Font = Enum.Font.Gotham
    InputBox.ClearTextOnFocus = false
    InputBox.Parent = MainFrame
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = InputBox
    
    -- Status Label
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Size = UDim2.new(1, -40, 0, 25)
    Status.Position = UDim2.new(0, 20, 0, 130)
    Status.BackgroundTransparency = 1
    Status.Text = "Enter your key to continue"
    Status.TextColor3 = Color3.fromRGB(170, 170, 170)
    Status.TextSize = 11
    Status.Font = Enum.Font.Gotham
    Status.Parent = MainFrame
    
    -- Submit Button
    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Name = "Submit"
    SubmitBtn.Size = UDim2.new(0.5, -15, 0, 50)
    SubmitBtn.Position = UDim2.new(0, 20, 0, 165)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    SubmitBtn.BorderSizePixel = 0
    SubmitBtn.Text = "SUBMIT KEY"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.TextSize = 14
    SubmitBtn.Font = Enum.Font.GothamBold
    SubmitBtn.Parent = MainFrame
    
    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 6)
    SubmitCorner.Parent = SubmitBtn
    
    -- Discord Button
    local DiscordBtn = Instance.new("TextButton")
    DiscordBtn.Name = "Discord"
    DiscordBtn.Size = UDim2.new(0.5, -15, 0, 50)
    DiscordBtn.Position = UDim2.new(0.5, 10, 0, 165)
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    DiscordBtn.BorderSizePixel = 0
    DiscordBtn.Text = "JOIN DISCORD"
    DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DiscordBtn.TextSize = 14
    DiscordBtn.Font = Enum.Font.GothamBold
    DiscordBtn.Parent = MainFrame
    
    local DiscordCorner = Instance.new("UICorner")
    DiscordCorner.CornerRadius = UDim.new(0, 6)
    DiscordCorner.Parent = DiscordBtn
    
    -- Info Label
    local InfoLabel = Instance.new("TextLabel")
    InfoLabel.Size = UDim2.new(1, -40, 0, 60)
    InfoLabel.Position = UDim2.new(0, 20, 0, 225)
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.Text = "📌 24-HOUR KEYS: Free but expire after 24 hours\n⭐ LIFETIME KEYS: Work forever\n🔗 Join Discord for more keys!"
    InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    InfoLabel.TextSize = 10
    InfoLabel.Font = Enum.Font.Gotham
    InfoLabel.TextWrapped = true
    InfoLabel.Parent = MainFrame
    
    -- Animations
    MainFrame.BackgroundTransparency = 1
    Title.TextTransparency = 1
    InputBox.BackgroundTransparency = 1
    InputBox.TextTransparency = 1
    SubmitBtn.BackgroundTransparency = 1
    SubmitBtn.TextTransparency = 1
    DiscordBtn.BackgroundTransparency = 1
    DiscordBtn.TextTransparency = 1
    
    -- Fade In
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Title, TweenInfo.new(0.3, nil, nil, 0, 0.1), {TextTransparency = 0}):Play()
    TweenService:Create(InputBox, TweenInfo.new(0.3, nil, nil, 0, 0.2), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(SubmitBtn, TweenInfo.new(0.3, nil, nil, 0, 0.25), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.3, nil, nil, 0, 0.3), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    
    -- Button Hover Effects
    local function addHoverEffect(button, originalColor)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(math.min(originalColor.R + 40, 255), math.min(originalColor.G + 40, 255), math.min(originalColor.B + 40, 255))}):Play()
        end)
        
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
        end)
    end
    
    addHoverEffect(SubmitBtn, Color3.fromRGB(0, 170, 255))
    addHoverEffect(DiscordBtn, Color3.fromRGB(88, 101, 242))
    
    -- Submit Handler
    local function SubmitKey()
        local key = InputBox.Text:gsub("%s+", "")
        
        if key == "" then
            Status.Text = "⚠️ Please enter a key"
            Status.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        
        Status.Text = "⏳ Validating key..."
        Status.TextColor3 = Color3.fromRGB(255, 255, 100)
        
        wait(0.5)
        
        local isValid, durationOrError = ValidateKey(key)
        
        if isValid then
            -- Mark key as used and set expiry if 24H
            if KeyDatabase[key].duration == "24H" and not KeyDatabase[key].expiryTime then
                KeyDatabase[key].expiryTime = os.time() + (24 * 3600)
            end
            SaveKeys()
            
            Status.Text = "✅ Key valid! (" .. durationOrError .. ")"
            Status.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(30, 60, 30)}):Play()
            TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(100, 255, 100)}):Play()
            
            wait(1)
            
            -- Fade out
            for _, child in pairs(MainFrame:GetDescendants()) do
                if child:IsA("GuiObject") then
                    TweenService:Create(child, TweenInfo.new(0.2), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
                end
            end
            
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TweenService:Create(Stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            
            wait(0.4)
            ScreenGui:Destroy()
            Verified = true
            print("[Key System] ✅ Authentication successful! Type: " .. durationOrError)
        else
            Status.Text = "❌ " .. durationOrError
            Status.TextColor3 = Color3.fromRGB(255, 100, 100)
            
            -- Shake
            local originalPos = MainFrame.Position
            for i = 1, 5 do
                MainFrame.Position = originalPos + UDim2.new(0, math.random(-5, 5), 0, 0)
                wait(0.02)
            end
            MainFrame.Position = originalPos
            InputBox.Text = ""
        end
    end
    
    SubmitBtn.MouseButton1Click:Connect(SubmitKey)
    
    DiscordBtn.MouseButton1Click:Connect(function()
        Status.Text = "🔗 Discord link copied to clipboard!"
        Status.TextColor3 = Color3.fromRGB(100, 200, 255)
        
        if setclipboard then
            setclipboard(Config.DISCORD_SERVER)
        end
    end)
    
    -- Allow Enter key to submit
    InputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            SubmitKey()
        end
    end)
    
    return ScreenGui
end

-- Wait for verification
function KeySystem:WaitForVerification()
    LoadKeys()
    
    if Verified then return true end
    
    KeySystem:CreateKeyUI()
    
    while not Verified do
        game:GetService("RunService").Heartbeat:Wait()
    end
    
    SaveKeys()
    return true
end

-- ============================================
-- START KEY SYSTEM
-- ============================================

KeySystem:WaitForVerification()

-- ============================================
-- YOUR MAIN SCRIPT GOES BELOW THIS LINE
-- ============================================

print("✅ Script loaded successfully! You are now authenticated.")
print("⏱️ If you used a 24-hour key, it will expire in 24 hours.")
print("⭐ If you used a lifetime key, you're set forever!")

-- PASTE YOUR EXPLOIT CODE HERE
-- The main GUI and all features will load below once authenticated
