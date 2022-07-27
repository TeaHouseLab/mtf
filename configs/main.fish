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
