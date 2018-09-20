# Zantix masternode setup
Shell script to install a Zantix Masternode on a Linux server running Ubuntu 16.04.
Use at your own risk.
***

## VPS installation
```
wget -N https://raw.githubusercontent.com/ZantixCoin/Zantix/node_install/master/zantix_install.sh
bash zantix_install.sh
```
***

## Desktop wallet setup

After the Masternode is up and running, you need to configure the desktop wallet accordingly. Here are the steps:
1. Open the Zantix Desktop Wallet.
2. Go to RECEIVE and create a New Address: **MN1**
3. Send **10000** ZNTX to **MN1**. You need to send all 10000 coins in one single transaction.
4. Wait for 20 confirmations.
5. Go to **Help -> "Debug Window - Console"**
6. Type the following command: **masternode outputs**
7. Go to  **Tools -> "Open Masternode Configuration File"**
8. Add the following entry:
```
Alias Address Privkey TxHash TxIndex
```
* Alias: **MN1**
* Address: **VPS_IP:PORT**
* Privkey: **Masternode Private Key**
* TxHash: **First value from Step 6**
* TxIndex:  **Second value from Step 6**
9. Save and close the file.
10. Go to **Masternode Tab**. If you tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
11. Click **Update status** to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is unlocked.
12. Select your MN and click **Start Alias** to start it.
13. Alternatively, open **Debug Console** and type:
```
startmasternode alias 0 MN1
```
14. Login to your VPS and check your masternode status by running the following command to confirm your MN is running:
```
zantix-cli masternode status
```
***

## Usage:
```
zantix-cli masternode status #To check your MN status
zantix-cli getinfo #To get general info such as Zantix version and current block number
zantix-cli mnsync status #To check if your MN is synced.
```
Also, if you want to check/start/stop **Zantix**, run one of the following commands as **root**:

```
systemctl status zantix #To check if the Zantix service is running
systemctl start zantix #To start the Zantix service
systemctl stop zantix #To stop zantix service
systemctl is-enabled zantix #To check if Zantix service is enabled on boot
```
***
