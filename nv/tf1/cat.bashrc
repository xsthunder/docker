alias jnb2py='jupyter-nbconvert --to=script'
export PS1='\[\e]0;\u@\h: \w\a\]nv-tf1:$(date +"%Yy_%mm_%dd_%Hh_%Mm"):${debian_chroot:+($debian_chroot)}\u@\h:\w\$'
alias gpu="nvidia-smi"
alias gpul="nvidia-smi -l 3"
alias ..="cd .."
HOME=`ls /home`
alias cdws="cd /home/$home/jupyter-ws"
alias cdt="cd /home/$home/jupyter-ws/try"
