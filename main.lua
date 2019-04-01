-----------------------------------------------------------------------------------------
--
-- main.lua
--
--------------------------------------------------------------------------------------
-----background
------------------------------------------------------------------------------------
local background = display.newImageRect( "assets/purple.png", 338, 600 )
background.x = display.contentCenterX
background.y = display.contentCenterY
background.id = "purple"
------------------------------------------------------------------------------
-------------Buttons (size of pizza)
-----------------------------------------------------------------------------
local largeButton = display.newImageRect( "assets/large.png", 200, 100 )
largeButton.x = display.contentCenterX
largeButton.y = 385
largeButton.id = "large button"

local extraLargeButton = display.newImageRect( "assets/extralarge.png", 200, 100 )
extraLargeButton.x = display.contentCenterX
extraLargeButton.y = 475
extraLargeButton.id = "extra large button"
----------------------------------------------------------------------
-------Text Field (number of toppings)
--------------------------------------------------------------
local toppingsTextField = native.newTextField( display.contentCenterX, display.contentCenterY + 50, 250, 50 )
toppingsTextField.id = "toppings textField"
----------------------------------------------------------------------
--------------toppings text (please enter the amount of toppings)
---------------------------------------------------------------------------
local toppingsText = display.newText( "Toppings (1-4)" , 160, 240, native.systemFont, 25)
toppingsText.id = "toppings text"
toppingsText:setFillColor( 1, 1, 1)
------------------------------------------------
------------total texts
------------------------------------------------------------
local pizzaText = display.newText( "Pizza" , 160, 25, native.systemFont, 18)
pizzaText.id = "pizza text"
pizzaText:setFillColor( 0, 0, 0) 

local subtotalText = display.newText( "Subtotal" , 160, 50, native.systemFont, 18)
subtotalText.id = "subtotal text"
subtotalText:setFillColor( 0, 0, 0)

local taxText = display.newText( "Tax" , 160, 75, native.systemFont, 18)
taxText.id = "tax text"
taxText:setFillColor( 0, 0, 0)

local totalText = display.newText( "Total" , 160, 100, native.systemFont, 18)
totalText.id = "total text"
totalText:setFillColor( 0, 0, 0)
------------------------------------
------round
-----------------------------------
function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end
----------------------------------------------------
----------------------variables and stuff
-----------------------------------------------------
local subtotal

local toppings
------------------------
-----------calculator function
-------------------------------------------

local function calculateCost( event )
	-- this is gonna calculate hst, total and display the three costs 

	local hst = subtotal*0.13
	hst = round(hst,2)

	local total = subtotal+hst
	total = round(total,2)


	--------display text
	subtotalText.text = "Subtotal: $" ..subtotal
	taxText.text = "13% HST: $" ..hst
	totalText.text = "Total: $" ..total

end

-------------------------------------------------
--------------large pizza subtotal
-----------------------------------------
local function largeButtonTouch( event )
    -- this function calculates the area of a square given the length of one of its sides
    toppings = tonumber( toppingsTextField.text )

   	pizzaText.text = "Large"


    if toppings == 1 then
    	subtotal = (6 + 1)
    	calculateCost()
           
    elseif toppings == 2 then
    	subtotal = (6 + 1.75)
    	calculateCost()    	        
    elseif toppings == 3 then
    	subtotal = (6 + 2.50)	
    	calculateCost()    
    elseif toppings == 4 then
    	subtotal = (6 + 3.35)
    	calculateCost()
    else 
    	subtotalText.text = " "
    	taxText.text = "Invalid number of Toppings!"
    	totalText.text = " "
    	pizzaText.text = " "
   end
 
    return true
end
-------------------------------------------------
--------------extra large pizza subtotal
-----------------------------------------
local function extraLargeButtonTouch( event )
    -- extra large pizza
    toppings = tonumber( toppingsTextField.text )

    pizzaText.text = "Extra Large"

    if toppings == 1 then
    	subtotal = (10 + 1)
    	calculateCost()    
    elseif toppings == 2 then
    	subtotal = (10 + 1.75)
    	calculateCost()
    elseif toppings == 3 then
    	subtotal = (10 + 2.50)
    	calculateCost()
    elseif toppings == 4 then
    	subtotal = (10 + 3.35)
    	calculateCost()    
    else 	
		subtotalText.text = " "
    	taxText.text = "Invalid number of Toppings!"
    	totalText.text = " "
    	pizzaText.text = " "

    end
    return true
end

largeButton:addEventListener( 'touch' , largeButtonTouch)
extraLargeButton:addEventListener( 'touch' , extraLargeButtonTouch)
--








