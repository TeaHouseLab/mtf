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