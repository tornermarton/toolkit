# Bash Toolkit

## Install system requirements
```bash
curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/shell/requirements/system.txt | grep -vE '^#' | xargs sudo apt install -yq
```

## Install toolkit

```bash
bash <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/bash/install.sh) > ~/.toolkitrc
```

```bash
echo ". ~/.toolkitrc" >> ~/.bashrc
# OR
echo ". ~/.toolkitrc" >> ~/.bash_profile
```

## Configure git
```bash
bash <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/bash/configure/git.sh | grep -vE '^#')
```

## Install Powerline

```bash
curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/bash/requirements/powerline.txt | grep -vE '^#' | xargs pip3 install
bash <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/bash/configure/powerline.sh | grep -vE '^#')
```
