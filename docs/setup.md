# Initial Setup for using Vagrant

### 1. Install Source Tree ([www.sourcetreeapp.com](http://www.sourcetreeapp.com))

Go to the downloads, download the version for you (windows or mac) and install. On Windows it may need to install .NET framework, let it. 

Once installed run it and depending on your OS it might ask about installing git and mercurial. For git click the top option for an embedded version. For mercurial you do not want it. 

It should then prompt you for name and email. For work purposes use your real name and work email and click "Next". If prompted about an SSH client accept the recommended default of Putty and click “No” if then prompted about an SSH key. You may then be prompted about logins for various websites, click “Skip Setup”. 

### 2. Install VirtualBox ([www.virtualbox.org](http://www.virtualbox.org))

You need to download the version of VirtualBox for your OS and also the extensions pack. 

Once downloaded install VirtualBox and accept all the network drivers it wishes to install. Once completed double click on the extension you downloaded and that should install into VirtualBox. 

### 3. Installing Vagrant ([www.vagrantup.com](http://www.vagrantup.com))

Again download for your OS. Run the installer. Change the install path if you wish. 

After you've installed everything then reboot your machine. 

### 4. Getting the Vagrant config files

The files are stored in a github repository (<https://github.com/DigitalWindow/vagrant>). You can browse them using your Web browser. 

To clone the repository open source tree. Click on the clone button and where promoted for a Source Url enter this for the repository location:

`https://github.com/DigitalWindow/vagrant.git`

Pick a destination directory where you wish these files to be kept on your own computer and then choose an appropriate bookmark name. 

Once done you should now find the same files you see in the Web browser in the folder you picked. 

### 5. VagrantFile Configuration changes

You'll need to make one change to the PHP training VagrantFile. This is to point it to your php files stored on your computer. 

In the directory where you are keeping the Vagrant config files, open `vagrantfiles/php-training/VagrantFile` in a text editor. 

Go to this line:

`#config.vm.synced_folder "YOUR PHP CODE PATH", "/vagrant_data" #, type: "nfs"`

Uncomment the line (remove the first #) and change the path to the place you will be keeping your php. For example:

`config.vm.synced_folder “/Users/Alex/Dev/php-training", "/vagrant_data" #, type: “nfs"`

Note for Windows machine you need to put double slash in the path, for example:

`config.vm.synced_folder “C:\\Users\\Alex\\Dev\\php-training", "/vagrant_data" #, type: “nfs"`

Save the file. 

### 6. Using Vagrant

Here are the important command line arguments for vagrant.

* vagrant **up** – will create a new instance of a virtual machine if none exists and then provision (install required software) it. If you already have an existing machine that you have halted or suspended this command will just start it again but it will no provision it again

* vagrant **halt** – this will shut down the machine just like shutting down a computer, it’s not destroyed and can be started again using vagrant up

* vagrant **suspend** – this will suspend your machine, just like shutting a laptop lid, this is quicker than halt and when you next run vagrant up the machine will start in exactly the same state as it was before. The machine will also start quicker from this state than it will if it’s been halted

* vagrant **destroy** – this will delete the virtual machine completely, useful when you’ve done something on the VM that’s hard to fix and you just want to start again

* vagrant **provision** – this will tell vagrant to provision the machine again, if no changes have been made to the configuration or to the chef recipes then it won’t do anything. If changes have been made it (new software or configuration) then it will make the required changes on your machine. This will come in useful later down the line when we start adding required PHP extensions to the config

* vagrant **ssh** – this will open an ssh session with the virtual machine. Allowing you to access it’s command line easily. For now you won’t need to use this other than to test everything is working.

All of these are run from a directory that contains a VagrantFile. For the PHP Training it will be `<path to vagrant config>/vagrantfiles/php-training`

### 7. Starting your Vagrant instance

Open a console (command line in Windows, terminal in linux/mac). 

Change directory to `<path to vagrant config>/vagrantfiles/php-training`

Run: `vagrant up`

The first time you run it it will need to get the base box (a minimal linux installation) from amazon S3. This is about 900mb so speed will depend on your internet connection. It should only need to do this once as it’s then stored on your computer and it will use the local copy in future.

Once it has done that it will configure the virtual machine (based on settings in the VagrantFile) and start it. Once the machine has started it will then provision it (install required software). How quickly it can do this depends on the speed of your computer and your internet. On some machines it may be ready in a few minutes. Remember that once it’s done all this the first time then just halting/suspending and restarting the machine should be quite quick.

Once it’s all done you can test the machine by running: `vagrant ssh`

You should find yourself on the command line of the virtual machine. To quit just press `CTRL+d`.

### 8. Testing your PHP

Once the machine is up you can test some PHP. I’ve attached a file called phpinfo.php. Save this to the directory where you wish to keep your php code (the one you set in step 5).

Then in your browser go to <http://localhost:8080/phpinfo.php> this should display a page of the PHP version info and current configuration. If that worked then everything is ready.

You can close down your VM by running: `vagrant halt` or `vagrant suspend`