list=(
    "vim_binding/vim_binding"
    "execute_time/ExecuteTime"
    "collapsible_headings/main"
    "varInspector/main"
    "toc2/main"
    "toggle_all_line_numbers/main"
    "codefolding/main"
    "freeze/main"
    "limit_output/main"
)
# echo $list
set -e
set -x
for ex in ${list[@]}
do
    # echo $ex
    jupyter nbextension enable $ex
done
# jupyter nbextension enable 
