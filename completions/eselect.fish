function __fish_complete_eselect_modules
    set -l sedregexp 's/^  ([a-zA-Z1-9_-]*)[ ]*/\1\t/g'
    eselect modules list | grep '^  ' | sed -r $sedregexp
end

complete -c eselect -n "test (__fish_number_of_cmd_args_wo_opts) = 1" \
    -xa '(__fish_complete_eselect_modules)'
