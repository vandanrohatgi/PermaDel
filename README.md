# PermaDel
A powershell wrapper for Sdelete

So for this challenge I used the SDelete application from Microsoft. This is what it does:

    Securely delete existing files.
    Erase file space of previously deleted files.

It ciphers the data of the file and then deletes it. This technique is also used when you want to hand over your old mobile phone to someone. You encrpyt the phone storage and then perform a device reset. The data which may be accessed by malicious actor using recovery tools will be encrypted.

In this script I try to delete not only the content of the files but also overwrite their meta data before doing so such as name, last modified data, file size, file type etc. So that not even a trace is left.
