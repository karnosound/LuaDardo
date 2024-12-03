x = true

function empty_return()
    if true then
        return
    end

    -- Should not get here.
    x = false
end
