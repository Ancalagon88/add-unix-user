# add-unix-user
A simple bash script for creating a new unix user in the CLI

I made this for an assignment in a Linux/Unix Adminstration course I took. There are probably better ways to do this, but this is what I came up with.

If this is used in conjunction with PAM rules, you can force users to create strong passwords on your unix systems.

An example of some PAM rules that could be helpful:

Password Policy In /etc/pam.d/common-password<br />
password&nbsp;&nbsp;&nbsp;&nbsp;requisite&nbsp;&nbsp;&nbsp;&nbsp;pam_cracklib.so retry=3 minlen=10 difok=3 ucredit=-1|credit=-1 dcredit=-1 ocredit=-1<br />
password&nbsp;&nbsp;&nbsp;&nbsp;[success=2 default=ignore]&nbsp;&nbsp;&nbsp;&nbsp;pam_unix.so obscure use_authtok try_first_pass sha512<br />
password&nbsp;&nbsp;&nbsp;&nbsp;[success=1 user_unknown=ignore default=die]&nbsp;&nbsp;&nbsp;&nbsp;pam_ldap.so use_authtok try_first_pass<br />
