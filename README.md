# PrivilegeEscalation 
### This program is a very short batch file which allows you torun anything with admin rights without prompting user.
### This script is already commented and ready to use but please read this to understand how it actually works !!
# The fault :
This program is based on an easy break in windows. There are some services that are considered as trusted, so windows executes them with admin rights without warning you, because it could become a mess on your computer to have so many UAC prompts...
Fodhelper.exe is one of these trusted services. Located in system32, you often execute it without even thinking about it. This program is responsible of the following menus : Screen Resolution, general programs etc...
Why do we talk about it ? Pretty simple. When you launch  this program, windows go to the registry folder "HKCU\Software\Classes\ms-settings\shell\open\command" and check if there's any registry key named "DelegateExecute". If this key is present, it will look at the value of the default key in this folder, and instead of executing what he was going to do, windows executed what is entered in the default value. With admin rights. Please note that this folder doesn't exist in regedit if you haven't done this manipulation before. That's how the fault works. Also please remember that I didn't discovered it and that many people use it for privilege escalation. And also note that I'm not responsible of what you're doing with this stuff.

# What does this batch do ?
This batch will first check wether or not it's executed with admin rights. If yes, it will just tell you that it has the admin rights. If not, it will firstly add the two keys to the registry library. The first one is the default one, to tell what windows will have to do. Here, the batch just tell windows to launch itself. But with admin rights. Then it creates the "DelegateExecute" key, to tell windows "Notice me Senpai (and execute what I told you with admin rights)" (actual text may vary from a machine to another). And then it launches itself by using "fodhelper.exe" which will execute the code we put in the default key. When it relaunches itself, using the fodhelper fault, it checks again if it has the admin rights, and if yes, it deletes the two keys, to make things back to normal, but keeps it's rights.

# Perfect for :
- Automating stuffs to do in background (with vbs script to make the script invisible) with admin rights
- Virus (haha i saw you. Don't lie. You lied... Oh sigh!)
- Launch rocket with admin rights... Because why not ?
- I don't know what you can do with it but enjoy !
