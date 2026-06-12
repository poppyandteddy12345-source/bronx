-- ============================================
-- KEY SYSTEM MODULE - Add this at the TOP of your script
-- ============================================

local KeySystem = {}
local Verified = false
local CorrectKey = "YOUR-KEY-HERE" -- Change this to your desired key
-- Or use multiple keys: local ValidKeys = {["KEY1"] = true, ["KEY2"] = true}

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Key System GUI
function KeySystem:CreateKeyUI()
    -- ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = HttpService:GenerateGUID(false)
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999999
    
    -- Protect GUI (optional, for some executors)
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
    MainFrame.Size = UDim2.new(0, 350, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Corner
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = MainFrame
    
    -- Stroke
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(0, 170, 255)
    Stroke.Thickness = 2
    Stroke.Parent = MainFrame
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundTransparency = 1
    Title.Text = "🔒 Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 24
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame
    
    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Size = UDim2.new(1, -20, 0, 20)
    Subtitle.Position = UDim2.new(0, 10, 0, 40)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "Please enter your key to continue"
    Subtitle.TextColor3 = Color3.fromRGB(170, 170, 170)
    Subtitle.TextSize = 14
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Parent = MainFrame
    
    -- Key Input Box
    local InputBox = Instance.new("TextBox")
    InputBox.Name = "KeyInput"
    InputBox.Size = UDim2.new(1, -40, 0, 40)
    InputBox.Position = UDim2.new(0, 20, 0, 75)
    InputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    InputBox.BorderSizePixel = 0
    InputBox.Text = ""
    InputBox.PlaceholderText = "Insert key..."
    InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
    InputBox.TextSize = 16
    InputBox.Font = Enum.Font.Gotham
    InputBox.ClearTextOnFocus = false
    InputBox.Parent = MainFrame
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = InputBox
    
    -- Status Label
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Size = UDim2.new(1, -20, 0, 20)
    Status.Position = UDim2.new(0, 10, 0, 120)
    Status.BackgroundTransparency = 1
    Status.Text = ""
    Status.TextColor3 = Color3.fromRGB(255, 85, 85)
    Status.TextSize = 12
    Status.Font = Enum.Font.Gotham
    Status.Parent = MainFrame
    
    -- Submit Button
    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Name = "Submit"
    SubmitBtn.Size = UDim2.new(1, -40, 0, 40)
    SubmitBtn.Position = UDim2.new(0, 20, 0, 145)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    SubmitBtn.BorderSizePixel = 0
    SubmitBtn.Text = "Submit Key"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.TextSize = 16
    SubmitBtn.Font = Enum.Font.GothamBold
    SubmitBtn.AutoButtonColor = true
    SubmitBtn.Parent = MainFrame
    
    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 6)
    SubmitCorner.Parent = SubmitBtn
    
    -- Get Key Button (optional - links to Discord/Pastebin)
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Name = "GetKey"
    GetKeyBtn.Size = UDim2.new(0, 80, 0, 25)
    GetKeyBtn.Position = UDim2.new(1, -90, 0, 10)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    GetKeyBtn.BorderSizePixel = 0
    GetKeyBtn.Text = "Get Key"
    GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyBtn.TextSize = 12
    GetKeyBtn.Font = Enum.Font.Gotham
    GetKeyBtn.Parent = MainFrame
    
    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 4)
    GetKeyCorner.Parent = GetKeyBtn
    
    -- Animations
    MainFrame.BackgroundTransparency = 1
    Title.TextTransparency = 1
    Subtitle.TextTransparency = 1
    InputBox.BackgroundTransparency = 1
    InputBox.TextTransparency = 1
    SubmitBtn.BackgroundTransparency = 1
    SubmitBtn.TextTransparency = 1
    GetKeyBtn.BackgroundTransparency = 1
    GetKeyBtn.TextTransparency = 1
    
    -- Fade In
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Title, TweenInfo.new(0.3, nil, nil, 0, 0.1), {TextTransparency = 0}):Play()
    TweenService:Create(Subtitle, TweenInfo.new(0.3, nil, nil, 0, 0.15), {TextTransparency = 0}):Play()
    TweenService:Create(InputBox, TweenInfo.new(0.3, nil, nil, 0, 0.2), {BackgroundTransparency = 0}):Play()
    TweenService:Create(InputBox, TweenInfo.new(0.3, nil, nil, 0, 0.2), {TextTransparency = 0}):Play()
    TweenService:Create(SubmitBtn, TweenInfo.new(0.3, nil, nil, 0, 0.25), {BackgroundTransparency = 0}):Play()
    TweenService:Create(SubmitBtn, TweenInfo.new(0.3, nil, nil, 0, 0.25), {TextTransparency = 0}):Play()
    TweenService:Create(GetKeyBtn, TweenInfo.new(0.3, nil, nil, 0, 0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(GetKeyBtn, TweenInfo.new(0.3, nil, nil, 0, 0.3), {TextTransparency = 0}):Play()
    
    -- Button Hover Effects
    SubmitBtn.MouseEnter:Connect(function()
        TweenService:Create(SubmitBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 140, 220)}):Play()
    end)
    
    SubmitBtn.MouseLeave:Connect(function()
        TweenService:Create(SubmitBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
    end)
    
    GetKeyBtn.MouseEnter:Connect(function()
        TweenService:Create(GetKeyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
    end)
    
    GetKeyBtn.MouseLeave:Connect(function()
        TweenService:Create(GetKeyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
    end)
    
    -- Key Validation Function
    local function ValidateKey(key)
        -- Method 1: Simple hardcoded key
        if key == CorrectKey then
            return true
        end
        
        -- Method 2: Multiple valid keys (uncomment to use)
        -- if ValidKeys[key] then return true end
        
        -- Method 3: Online validation (replace URL with your API)
        --[[
        local success, result = pcall(function()
            local response = game:HttpGet("https://your-api.com/validate?key=" .. key)
            return response == "valid"
        end)
        return success and result
        --]]
        
        -- Method 4: Time-based key (key expires after certain date)
        --[[
        local keyFormat = key:match("^KEY%-(%d+)%-(%w+)$")
        if keyFormat then
            local timestamp = tonumber(keyFormat)
            if timestamp and timestamp > os.time() then
                return true
            end
        end
        --]]
        
        return false
    end
    
    -- Submit Handler
    local function SubmitKey()
        local key = InputBox.Text:gsub("%s+", "") -- Remove spaces
        
        if key == "" then
            Status.Text = "⚠️ Please enter a key"
            TweenService:Create(InputBox, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(80, 40, 40)}):Play()
            wait(0.2)
            TweenService:Create(InputBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
            return
        end
        
        Status.Text = "⏳ Checking key..."
        Status.TextColor3 = Color3.fromRGB(255, 255, 100)
        
        wait(0.5) -- Small delay for effect
        
        if ValidateKey(key) then
            Status.Text = "✅ Key valid! Loading..."
            Status.TextColor3 = Color3.fromRGB(85, 255, 85)
            
            -- Success animation
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(20, 60, 30)}):Play()
            TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(85, 255, 85)}):Play()
            
            wait(0.5)
            
            -- Fade out and destroy
            for _, child in pairs(MainFrame:GetDescendants()) do
                if child:IsA("GuiObject") then
                    TweenService:Create(child, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
                    TweenService:Create(child, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                end
            end
            
            TweenService:Create(MainFrame, TweenInfo.new(0.3, nil, nil, 0, 0.1), {BackgroundTransparency = 1}):Play()
            TweenService:Create(Stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            
            wait(0.4)
            ScreenGui:Destroy()
            
            Verified = true
            print("[Key System] Authentication successful!")
        else
            Status.Text = "❌ Invalid key! Try again."
            Status.TextColor3 = Color3.fromRGB(255, 85, 85)
            
            -- Shake animation
            local originalPos = MainFrame.Position
            for i = 1, 5 do
                MainFrame.Position = originalPos + UDim2.new(0, math.random(-5, 5), 0, 0)
                wait(0.02)
            end
            MainFrame.Position = originalPos
            
            TweenService:Create(InputBox, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(80, 40, 40)}):Play()
            wait(0.2)
            TweenService:Create(InputBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
            
            InputBox.Text = ""
        end
    end
    
    SubmitBtn.MouseButton1Click:Connect(SubmitKey)
    
    GetKeyBtn.MouseButton1Click:Connect(function()
        -- Open your key distribution link
        -- setclipboard("https://discord.gg/yourserver") -- Copies to clipboard
        Status.Text = "🔗 Link copied to clipboard!"
        Status.TextColor3 = Color3.fromRGB(100, 200, 255)
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
    if Verified then return true end
    
    KeySystem:CreateKeyUI()
    
    -- Block execution until verified
    while not Verified do
        game:GetService("RunService").Heartbeat:Wait()
    end
    
    return true
end

-- ============================================
-- INTEGRATION - Wrap your main script below
-- ============================================

-- Start key system
KeySystem:WaitForVerification()

-- ============================================
-- YOUR MAIN SCRIPT GOES BELOW THIS LINE
-- ============================================

print("Script loaded successfully!")
-- Paste your exploit script code here...

