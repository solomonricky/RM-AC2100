# Tutorial for Xiaomi Redmi Router AC2100 and Xiaomi Router AC2100.
Flash R3G Breed into Xiaomi Redmi Router AC2100/ Xiaomi AC2100 and flash back Official boot tutorial.

### Step One: Open **TELNET** service.
1. Control Panel --> Program --> Turn Windows features on or off --> Tick **Telnet Client**
2. Set your network adapter IP which connect to AC2100 to 192.168.31.177, Subnet 255.255.255.0, Default Gateway 192.168.31.1.
3. Disable other network adapter including Virtual Machine Adapter.
4. Disable all **Anti-virus Application** and **Firewall**.
5. Open the **RM2100** folder, Install **WinPcap_4_1_3.exe** or **npcap-0.9991.exe**
6. Open **Enable Telnet CMD** and **EZ Mod Service** (copy all the text inside **Enable Telnet CMD**)
7. Go to your router [website](miwifi.com) and make sure router IP Address as 192.168.31.1, Edit **PPPOE** Username(123) and Password(123).
8. Run **EZ Mod Service**, follow the intruction until TASK_shell windows printed out received package.
9. Copy the code below, paste at **TASK_Shell** window and enter.
> cd /tmp&&wget http://192.168.31.177:8081/busybox&&chmod a+x ./busybox&&./busybox telnetd -l /bin/sh
10. Router Telnet Service is enable.

### Step Two: Flash R3G Breed
#### From Original Firmware
1. Open CMD/Putty/XShell and paste the code below. (When PC get IP ad router have blue light mean breed success.
> telnet 192.168.31.1

> cd /tmp

> wget http://192.168.31.177:8081/breed-mt7621-xiaomi-r3g.bin&&nvram set uart_en=1&&nvram set bootdelay=5&&nvram set flag_try_sys1_failed=1&&nvram commit

> mtd -r write breed-mt7621-xiaomi-r3g.bin Bootloader

2. Change Network Adapter to DHCP, wait for router reboot.

#### From Padavan Firmware
1. Open [WinSCP](https://winscp.net/eng/download.php). Enter your AC2100 Router IP Info.
2. Upload **breed-mt7621-xiaomi-r3g.bin** to /tmp
3. Open CMD/Putty/XShell login to Padavan run the code below.
> cd /tmp
4. Backup
> cat /proc/mtd

> cat /dev/mtdblock0 > /tmp/mtd0.bak

5. Use WinSCP download /tmp/mtd0.bak to PC.

