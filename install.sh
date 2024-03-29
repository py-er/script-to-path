cd ~

wget "https://raw.githubusercontent.com/py-er/script-to-path/main/script-to-path" 2> /dev/null

if ! [[ $(ls) == *"script-to-path"* ]]
then
    echo "Script-to-path could not be installed. Check internet connection."
    exit 1
fi

chmod +x script-to-path
./script-to-path script-to-path
rm script-to-path
cd - > /dev/null

user=$(whoami)
if ! [[ $PATH == *"/$user/.scripts"* ]]
then
    if ! [[ $user == "root" ]]
    then
        export PATH=/home/$user/.scripts:$PATH
        cd ~
        echo "export PATH=/home/$user/.scripts:$PATH" >> .bashrc
        echo "export PATH=/home/$user/.scripts:$PATH" >> .zshrc
        cd - > /dev/null
    else
        export PATH=/$user/.scripts:$PATH
        cd ~
        echo "export PATH=/$user/.scripts:$PATH" >> .bashrc
        echo "export PATH=/$user/.scripts:$PATH" >> .zshrc
        cd - > /dev/null
    fi
fi
