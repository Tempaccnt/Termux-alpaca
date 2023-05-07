# Termux-alpaca
This is a simple shell script to install the alpaca llama 7B model and other 7B LLaMA models on termux for Android phones. 
All credits goes to the original developers of alpaca.cpp and llama.cpp as well as to the creators of each model.
 

how to use:
* the easiest way is to clone the repository then make the script executable and run it. to do that write the following:

```
pkg update && pkg upgrade -y
pkg install git -y
cd
git clone https://github.com/Tempaccnt/Termux-alpaca
cd Termux-alpaca
chmod +x install*
./install-alpaca-Android.sh     # replace this with script of the model you desire e.g ./install-vicuna-Android.sh

```
note: change install-alpaca-Android.sh to install-vicuna-Android.sh if you wish to install llama.cpp and the 7B vicuna model

after the installation is complete, you can start each model using the following:

```
chat  # for Alpaca
chat-vic    # for vicuna
chat-wiz   # for wizardLM

```
