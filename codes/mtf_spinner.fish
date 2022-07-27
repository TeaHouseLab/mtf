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
