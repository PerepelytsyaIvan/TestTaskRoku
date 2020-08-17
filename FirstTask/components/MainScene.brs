' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()
    configurationButton()
    configurationLabel()
    configurationTimer()

    m.addingSeconds = 0
    m.subtractionOfSeconds = 0

    m.top.SetFocus(true)
End sub

sub configurationButton()
    m.buttonGrup = m.top.findNode("buttonGroup")
    m.buttonGrup.buttons = ["Reset", "Start", "Stop"]
    m.buttonGrup.layoutDirection = "horiz"
    m.buttonGrup.translation = [ 500, 800 ]
    m.buttonGrup.observeField("buttonSelected", "changetext")
end sub

sub configurationLabel()
    m.textLabel = m.top.findNode("textLabel")
    m.textLabel.translation = [900, 100]
    m.textLabel.text = "Hello"
end sub

sub configurationTimer()
    m.timer = m.top.findNode("timer")
    m.timer.duration = "1"
    m.timer.observeField("fire", "changeLabel")
    m.timer.repeat = true
end sub

sub changeLabel()   
if m.addingSeconds=100    
    m.textLabel.text = m.subtractionOfSeconds
    m.subtractionOfSeconds--
    if m.subtractionOfSeconds = 0 
        m.addingSeconds = m.subtractionOfSeconds
    end if
else 
        m.textLabel.text = m.addingSeconds
        m.addingSeconds++
        m.subtractionOfSeconds = m.addingSeconds
end if
    
end sub

sub changetext()
    if m.buttonGrup.buttonSelected = 0
        m.timer.control = "stop"
        m.addingSeconds = 0
        m.textLabel.text = "Hello Word"
        
    end if
    if m.buttonGrup.buttonSelected = 1
       m.timer.control = "start"
    end if

    if m.buttonGrup.buttonSelected = 2
        m.timer.control = "stop"
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press 
    if key = "right"
        print key
        m.buttonGrup.focusButton = m.buttonGrup.buttonFocused + 1
        result = true
    end if


    if key = "left"
        m.buttonGrup.focusButton = m.buttonGrup.buttonFocused - 1
    end if
end if
    result = false
    return result 
end function
