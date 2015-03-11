#!/bin/bash

if [ $1 != "--all" ] && [ $1 != "--basic" ]
then
        echo "Please provide an argument"
        echo "Supported arguments are:"
        echo "--all     -  runs all scripts"
        echo "--basic   -  runs basic scripts, no C# nor Omnisharp"
        exit 0
else
        ./common/setup.sh
        ./colors/setup.sh
        if [ $1 == "--all" ]; then

                ./bundle/omnisharp/setup.sh
                ./bundle/vim-csharp/setup.sh
                ./bundle/dispatch/setup.sh
        fi
        
        ./bundle/ctrlp/setup.sh
        ./bundle/gundo/setup.sh
        ./bundle/nerdtree/setup.sh
        ./bundle/airline/setup.sh
fi




