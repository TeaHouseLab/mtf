#!/usr/bin/env fish

function mtf_center
    set mtf_center_text "$argv"
    set mtf_center_text_count (printf "$mtf_center_text" | wc -m)
    mtf_reset
    set mtf_center_raw (printf ' %.0s' (seq 1 (math "($mtf_cols-$mtf_center_text_count)/2")))
    echo "$mtf_center_raw$mtf_center_text$mtf_center_raw"
end
function mtf_spinner
    tput sc
    for spinner in '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏'
        tput rc
        set_color white
        echo -ne "\b$spinner  $argv"
        set_color normal
        sleep 0.1
    end
end

function mtf_stage
    mtf_reset
    set stage $argv[1]
    if test -z $stage
        set_color red
        echo "$prefix x Unknown stage, abort"
        set_color normal
        exit 128
    end
    set mtf_stage_front (printf '=%.0s' (seq 0 (math "($mtf_cols-25)*$stage")))
    set mtf_stage_precent (math -s0 "$stage*100")%
    set mtf_stage_back (printf ' %.0s' (seq 0 (math "($mtf_cols-25)-(($mtf_cols-25)*$stage)-1")))
    echo "[$mtf_stage_front>$mtf_stage_back] Current Stage: $mtf_stage_precent"
end
function mtf_reset
    set mtf_cols (tput cols)
    set mtf_lines (tput lines)
end

function mtf_top
    tput cup 0 0
    echo -n "$mtf_bottom_text"
end
function mtf_bottom
    set mtf_bottom_text "$argv"
    mtf_reset
    tput sc
    tput cup (math "$mtf_lines-2") 0
    echo "$mtf_bottom_text"
end
set -lx prefix ''
set -x mtf_cols
set -x mtf_lines
switch $argv[1]
case center
    mtf_center $argv[2..-1]
case top
    mtf_top $argv[2..-1]
case bottom
    mtf_bottom $argv[2..-1]
case stage
    mtf_stage $argv[2..-1]
case spinner
    mtf_spinner $argv[2..-1]
end
