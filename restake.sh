#!/bin/bash
for (( ;; )); do
        echo -e "\033[0;32mCollecting rewards!\033[0m"
	uptickd tx distribution withdraw-rewards uptickvaloper1z5hnta9st50gkftu05xkmcl66eeuczu5gktlk0 --from=Zaragossa --commission --chain-id=$UPTICK_CHAIN_ID --fees=250auptick --yes
	echo -e "\033[0;32mWaiting 30 seconds before requesting balance\033[0m"
	sleep 30
	AMOUNT=$(uptickd query bank balances uptick1z5hnta9st50gkftu05xkmcl66eeuczu5mw7t6r | grep amount | awk '{split($0,a,"\""); print a[2]}')
	AMOUNT=$(($AMOUNT - 500))
	AMOUNT_STRING=$AMOUNT"auptick"
	echo -e "Your total balance: \033[0;32m$AMOUNT_STRING\033[0m"
	 uptickd tx staking delegate uptickvaloper1z5hnta9st50gkftu05xkmcl66eeuczu5gktlk0 $AMOUNT_STRING --from Zaragossa --chain-id $UPTICK_CHAIN_ID --fees=250auptick --yes
	echo -e "\033[0;32m$AMOUNT_STRING staked! Restarting in 3600 sec!\033[0m"
	sleep 3600
done
