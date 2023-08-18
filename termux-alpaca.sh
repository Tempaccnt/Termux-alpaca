cd
echo "Welcome please choose what you want to do:"
echo "1-install a model"
echo "2-uninstall a model"
echo "h-help"
echo "enter anything else to exit"
read choice

if [[ $choice -eq "1" ]]
	 then
        echo "please select a model to install:"
        echo "1-Alpaca-7B"
        echo "2-Vicuna-7B"
        echo "3-wizardLM"
        read choice
        if [[ $choice -eq "1" ]] 
	  then
           cd
           termux-setup-storage
           # update packages
           pkg update && pkg upgrade -y                                                                                 
           # install necessary packages
           pkg install clang wget git megatools cmake -y
           #cloning the github repository of alpaca.cpp                                                                                                       
           git clone  https://github.com/antimatter15/alpaca.cpp
           #enter alpaca.cpp folder
           cd alpaca.cpp                                                                                                                                      
           #start building alpaca.cpp (if you get an error try replqcing make with cmake and see if that works)
           make
           echo -e  "\e[32m select whether to use hugginface or mega(recommended) to download the model?"
           echo -e "enter 1 for huggingface or 2 for mega\e[39m"
           read website
           #downloading the 7B alpaca model
           if [ $website -eq "1" ] 
		then
                wget https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/resolve/main/ggml-alpaca-7b-q4.bin
           else
                megadl https://mega.nz/file/3ZI2lA5Y#bAPt0tKWexZMf0GhoI_RMQ0OH4vXWFyfFbykXrIKZAY
           fi
           # making a shortcut script to launch alpaca easily with the word chat
           cd /$PREFIX/bin
           echo 'clear' > chat
           echo 'cd' >> chat
           echo 'cd alpaca.cpp' >> chat
           echo './chat' >> chat
           chmod +x chat
           cd
        elif [[ $choice -eq "2" ]]
	 then
          cd
          termux-setup-storage
          pkg update && pkg upgrade -y
          pkg install wget git cmake clang megatools -y
          git clone https://github.com/ggerganov/llama.cpp
          cd llama.cpp
          make
          cd models
          wget https://huggingface.co/eachadea/ggml-vicuna-7b-1.1/resolve/main/ggml-vic7b-uncensored-q5_0.bin 
          cd ..
          cd examples
          megadl https://mega.nz/file/jBAwXQqR#6DYF9pchM6H69RNzVO8PWSDBQDieMkXIKDwJxPjCShU
          chmod +x chat-vic7B.sh
          cd /$PREFIX/bin
          echo 'clear' > chat-vic
          echo 'cd' >> chat-vic
          echo 'cd llama.cpp' >> chat-vic
          echo 'cd examples' >> chat-vic
          echo './chat-vic7B.sh' >> chat-vic
          chmod +x /$PREFIX/bin/chat-vic
        elif [[ $choice -eq "3" ]]
	 then
           cd
           termux-setup-storage
           pkg update && pkg upgrade -y
           pkg install wget git cmake clang megatools -y
           git clone https://github.com/ggerganov/llama.cpp
           cd llama.cpp
           make
           cd models
           wget https://huggingface.co/TheBloke/wizardLM-7B-GGML/resolve/main/wizardLM-7B.ggmlv3.q5_1.bin
           cd ..
           cd examples
           megadl https://mega.nz/file/6YgiyYCK#fSr3NjZYMkSbocNf29xAnoWKdZRAbAlXiYwk-KU3XRQ
           chmod +x chat-wiz.sh
           cd /$PREFIX/bin
           echo 'clear' > chat-wiz
           echo 'cd' >> chat-wiz
           echo 'cd llama.cpp' >> chat-wiz
           echo 'cd examples' >> chat-wiz
           echo './chat-wiz.sh' >> chat-wiz
           chmod +x /$PREFIX/bin/chat-wiz
        else    
           echo "wrong input exiting"
        fi

elif [[ $choice -eq "2" ]]
       then
        echo "please select a model to uninstall:"
        echo "1-Alpaca-7B"
        echo "2-Vicuna-7B"
        echo "3-wizardLM"
        read choice 
        if [[ $choice -eq "1" ]]
         then
           # return to home directory
           cd
           # remove the alpaca.cpp folder
           rm -rf alpaca.cpp
           # remove the shortcut file
           cd /$PREFIX/bin
           rm chat
           # return to home directory
           cd
           elif [[ $choice -eq "2" ]]
            then
             # return to home directory
             cd
             # remove llama.cpp folder
             cd llama.cpp/models
             rm ggml-vic7b-uncensored-q5_0.bin
             # remove shortcut file
             cd /$PREFIX/bin
             rm chat-vic
             # return to home directory
             cd
            elif [[ $choice -eq "3" ]]
             then
             cd
             # remove wizardLM
             cd llama.cpp/models
	     rm wizardLM-7B.ggmlv3.q5_1.bin
             # remove shortcut file
             cd /$PREFIX/bin
             rm chat-wiz
             # return to home directory
             cd
            else
             echo "wrong input exiting"
        fi 
        
elif [[ $choice -eq "h" ]]
  then
    cd
    cd Termux-alpaca
    nano  help.txt
else    
  echo "wrong input exiting"
fi
