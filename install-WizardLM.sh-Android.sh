cd
termux-setup-storage
pkg update && pkg upgrade -y
pkg install wget git cmake clang megatools -y
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make
cd models
wget https://huggingface.co/TheBloke/wizardLM-7B-GGML/resolve/main/wizardLM-7B.ggml.q5_1.bin 
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
