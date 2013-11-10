function __fish_complete_eselect_modules
    set -l sedregexp 's/^  ([a-zA-Z0-9_-]*)[ ]*/\1\t/g'
    eselect modules list | grep '^  ' | sed -r $sedregexp
end

function __fish_complete_eselect_actions
    set -l sedregexp 's/^  ([a-zA-Z0-9_-]*)[ ]*/\1\t/g'
    eval (commandline -poc) help | grep '^  [^ -]' | sed -r $sedregexp
end

function __fish_complete_eselect_action_options
    set -l parseregexp 's/^    ([a-zA-Z0-9_-]*)[ ]*/\1\t/g'
    set -l cmdl (commandline -poc)
    set -l findregexp '/^  '$cmdl[3]'/,/^  [^ ]/p'
    set cmdl[3] help
    eval $cmdl | sed -n -re $findregexp | grep '^    --' | sed -re $parseregexp
end

function __fish_complete_eselect_targets
    set -l sedregexp 's/^  \[([0-9]+)\][ ]*/\1\t/g'
    set -l cmdl (commandline -poc)
    set cmdl[3] list
    eval $cmdl | grep '^  [^ -]' | sed -r $sedregexp
end

complete -c eselect -n "test (__fish_number_of_cmd_args_wo_opts) = 1" \
    -xa '(__fish_complete_eselect_modules)'

complete -c eselect -n "test (__fish_number_of_cmd_args_wo_opts) = 1" \
    -l brief -d 'Make output shorter'

complete -c eselect -n "test (__fish_number_of_cmd_args_wo_opts) = 1" \
    -l colour \
    -d "=<yes|no|auto> Enable or disable colour output (default 'auto')"

complete -c eselect -n "test (__fish_number_of_cmd_args_wo_opts) = 2" \
    -xa '(__fish_complete_eselect_actions)'

complete -c eselect -n "test (__fish_number_of_cmd_args_wo_opts) = 3" \
    -xa '(__fish_complete_eselect_targets)'

complete -c eselect -n "test (__fish_number_of_cmd_args_wo_opts) = 3" \
    -xa '(__fish_complete_eselect_action_options)'

