#! /bin/zsh

PORT=12345
killall -s 9 qemu-arm 2> /dev/null

echo "Starting compiling for debug this/those files: $*\n"
arm-linux-gnueabihf-gcc -static -ggdb3 -o debug.out $*
if [[ $? -eq 1 ]] then; echo "\nErrore durante la compilazione"; exit 1; fi

echo "Starting to run debug.out in background\n"
qemu-arm -g $PORT debug.out &
pidquemu=$!
sleep 1
if ! ps -p $pidquemu > /dev/null; then; echo "\nErrore durante l'avvio dell'eseguibile"; exit 1; fi

echo "Starting gdb\n"
gdb-multiarch -q --nh -ex "set architecture arm" -ex "file debug.out" -ex " target remote localhost:$PORT"
if [[ $? -eq 1 ]] then; echo "\nErrore durante l'avvio del debugger"; killall -s 9 qemu-arm; exit 1; fi
