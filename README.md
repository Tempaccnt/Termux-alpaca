# Termux-alpaca
This is a simple shell script to install the alpaca llama 7B model on termux for Android phones. 
All credits goes to the original developers of alpaca.cpp and the ggml-model-q4_1.bin model. 

there are two files:
* install-alpaca-Android.sh this one uses the default huggingface.co website to download the model

* install-alpaca-mega.sh this one uses mega to download the model(faster but with limited downloads)

how to use:
* the easiest way is to clone the repository then make the script executable and run it. to do that write the following:

```
pkg update && pkg upgrade -y
pkg install git -y
cd
git clone https://github.com/Tempaccnt/Termux-alpaca
cd Termux-alpaca
chmod +x install-alpaca-Android.sh
./install-alpaca-Android.sh

```
<code style="color : red"> note: change install-alpaca-Android.sh to install-alpaca-mega.sh if you wish to use mega to download the model.</code>

after the installation is complete, you can start alpaca at any time by writing
```
chat

```
