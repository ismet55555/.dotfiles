
###############################################################################
#
# NOTES: 
#
#    Run with administrative privelages
#    Run:
#       > .\windows_10_install.ps1
#    
###############################################################################


echo ""
echo "================================================================"
echo "|            _   _   _       _   ___ _____   _   _ ____    _   |"
echo "|   ___  ___| |_| |_(_)_ __ ( ) |_ _|_   _| | | | |  _ \  | |  |"
echo "|  / __|/ _ \ __| __| | '_ \|/   | |  | |   | | | | |_) | | |  |"
echo "|  \__ \  __/ |_| |_| | | | |    | |  | |   | |_| |  __/  |_|  |"
echo "|  |___/\___|\__|\__|_|_| |_|   |___| |_|    \___/|_|     (_)  |"
echo "|                                                              |"
echo "================================================================"


# Installing Chocolatey Package manager for windows
echo ""
echo "========= Installing: chocolatey package manager ==============="
Set-ExecutionPolicy Bypass -Scope Process
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Powershell core
echo ""
echo "============= Installing: Powershell Core ======================"
choco install powershell-core -y

# git
echo ""
echo "================== Installing: git ============================="
choco install git.install -y

# posh-git (pretty git terminal interface)
echo ""
echo "================== Installing: posh-git ========================"
choco install poshgit -y

# oh-my-posh (theme for powershell)
echo ""
echo "================== Installing: oh-my-posh ======================"
choco install oh-my-posh -y

# Windows terminal
echo ""
echo "================ Installing: Windows Terminal =================="
choco install microsoft-windows-terminal -y

# Vim
echo ""
echo "====================== Installing: VIM ========================="
choco install vim -y

# bat (cool version of cat)
echo ""
echo "====================== Installing: bat ========================="
choco install bat -y

# VS Code
echo ""
echo "=============== Installing: Visual Studio Code ================="
choco install vscode -y

# Python
echo ""
echo "=================== Installing: Python ========================="
choco install python -y

# pip python package manager
echo ""
echo "=============== Installing: PIP package manager ================"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# Node JS
echo ""
echo "==================== Installing: Node JS ======================="
choco install nodejs -y



echo ""
echo " ______   _______  _        _______    _ ";
echo "(  __  \ (  ___  )( (    /|(  ____ \  ( )";
echo "| (  \  )| (   ) ||  \  ( || (    \/  | |";
echo "| |   ) || |   | ||   \ | || (__      | |";
echo "| |   | || |   | || (\ \) ||  __)     | |";
echo "| |   ) || |   | || | \   || (        (_)";
echo "| (__/  )| (___) || )  \  || (____/\   _ ";
echo "(______/ (_______)|/    )_)(_______/  (_)";
echo "                                         ";
echo ""
