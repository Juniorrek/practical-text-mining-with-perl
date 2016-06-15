this_computer="$(uname)"
if [ "x$this_computer" = "xDarwin" ];then
    dev_folder=~/Programming
elif [ "x$this_computer" = "xLinux" ];then
    dev_folder=~/dev
fi

export POE_PATH="$PWD/data/poe-68-stories"
export ENRONMAIL_PATH="$dev_folder/data/enronmail"
