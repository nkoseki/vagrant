echo "# vagrant" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/nkoseki/vagrant.git
git push -u origin main

---
◆許可されているNWアドレスの変更する場合
/etc/vbox/networks.conf
* 172.16.0.0/24
* 192.168.0.0/16 
---
◆virtual boxのデフォルトNWアドレスの割り当て
192.168.56.0/24 


