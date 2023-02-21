function halfwidth()
    local ar = mp.get_property_native('video-params/aspect')
    ar = tostring(tonumber(ar) / 2)
    mp.set_property("video-aspect-override", ar)
end

function reset()
    mp.set_property("video-aspect-override", -1)
end

mp.add_key_binding("a", "toggle_stretch", halfwidth)
mp.register_event("file-loaded", reset)

