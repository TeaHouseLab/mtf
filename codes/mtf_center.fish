function mtf_center
    set mtf_center_text "$argv"
    set mtf_center_text_count (printf "$mtf_center_text" | wc -m)
    mtf_reset
    set mtf_center_raw (printf ' %.0s' (seq 1 (math "($mtf_cols-$mtf_center_text_count)/2")))
    echo "$mtf_center_raw$mtf_center_text$mtf_center_raw"
end