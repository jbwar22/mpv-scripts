local downmix_on = false

function setup_downmix()
    local channels = mp.get_property('audio-params/hr-channels', 'nothing')
    if channels == "5.1" or channels == "5.1(side)" then
        if not downmix_on then
            mp.command('no-osd af add @downmix:lavfi=[pan=stereo|FL=0.5*FC+0.707*FL+0.707*BL+0.5*LFE|FR=0.5*FC+0.707*FR+0.707*BR+0.5*LFE]')
            mp.command('no-osd af add @volboost:lavfi=[volume=1.660156]')
            mp.commandv('show-text', 'Enabling 5.1 downmixer', 2000)
            mp.commandv('print-text', 'Enabling 5.1 downmixer')
            downmix_on = true
        end
    else
        if downmix_on then
            mp.command('no-osd af remove @downmix')
            mp.command('no-osd af remove @volboost')
            mp.commandv('show-text', 'Disabling 5.1 downmixer', 2000)
            mp.commandv('print-text', 'Disabling 5.1 downmixer')
            downmix_on = false
        end
    end
        
end

mp.register_event('audio-reconfig', setup_downmix)
