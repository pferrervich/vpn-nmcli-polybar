# vpn-nmcli-polybar

This polybar plugin uses the network manager command line interface (nmcli) to get and display information about your virtual private network (VPN).

The plugin provides the option to enable and disable the VPN network from polybar.

### Configuration

1. Clone the repository and copy the script to your polybar script folder.
   
   ```sh
   # Clone the repository
   git clone https://github.com/gcharalampous/vpn-nmcli-polybar
   cd vpn-nmcli-polybar
   # Copy the script to /your/polybar/scripts/folder
   cp vpn-nmcli-polybar.sh /your/polybar/scripts/folder
   ```

2. Don't forget to make the script executable.
   
   ```sh
   #Make the polybar script executable
   chmod +x /your/polybar/scripts/folder/vpn-nmcli-polybar.sh
   ```

3. You need to setup your VPN connction. If you have one but you don't remember its name, run the following command to list the available VPN connections of your system.
   
   ```sh
   nmcli --mode tabular --terse connection show | grep vpn | cut -d ":" -f1
   ```

4. Then, change the variable name of the `vpn-nmcli-polybar.sh` script, `VPN_ENTRY` with your favourite vpn network.

5. Finally, add the following code to your polybar `config.ini` file, and don't forget to add the module on the polybar panel.
   
   ```shell
   [module/vpn]
   type = custom/script
   interval = 3
   exec = ~/.your-polybar-script-folder/vpn-nmcli-polybar.sh 
   exec = ~/.your-polybar-script-folder/vpn-nmcli-polybar.sh --toggle-connection &
   format-prefix = "VPN"
   ```
