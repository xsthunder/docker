alias jnb2py='jupyter-nbconvert --to=script'
alias gpu="nvidia-smi"
alias gpul="nvidia-smi -l 3"
alias ..="cd .."
home=`ls /home`
alias cdws="cd /home/$home/jupyter-ws"
alias cdt="cd /home/$home/jupyter-ws/try"
export PS1='\[\e]0;\u@\h: \w\a\]${XS_DOCKER_HOST_NAME}:$(date +"%Yy_%mm_%dd_%Hh_%Mm"):${debian_chroot:+($debian_chroot)}\u@\h:\w\$'
source ~/map.bashrc
