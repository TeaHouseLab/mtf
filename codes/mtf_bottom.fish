function mtf_bottom
    set mtf_bottom_text "$argv"
    mtf_reset
    tput sc
    tput cup (math "$mtf_lines-2") 0
    echo "$mtf_bottom_text"
end