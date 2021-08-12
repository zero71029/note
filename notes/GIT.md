git add xxx.text

get commit -m "xxxxxx"

git clone

git log 看歷史

git branch 查看分支 
git branch git branch -D 強制刪除 
git checkout 切換當前行動分支 
git checkout -b 創建分支 
git checkout -m 分支改名

git clone https://github.com/zero71029/recipe 克隆

git remote 查看遠端
git remote -v 查看遠端網址
git remote add origin 網址 添加遠端昌庫
git remote remove origin

git push -u origin master

///////////////////////////////////////////////////////////////////////
echo "# ddddwdw" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/zero71029/ddddwdw.git
git push -u origin main


git remote add origin https://github.com/zero71029/ddddwdw.git
git branch -M main
git push -u origin main
///////////////////////////////////////////////////////////////////////


//版本回退
git reset --hard a0fvf8
git push -f

第二種方法：放棄本地的修改，直接覆蓋

git reset --hard
git pull

第一種方法，stash：
那怎麼stash本地的更新呢？直接執行：

git stash
git pull
git stash pop
接下來diff一下此文件看看自動合併的情況，並作出相應的修改。
git stash：備份當前的工作區，從最近一次提交中讀取相關內容，讓工作區保持和上一次提交的內容一致。同時，將工作區的內容保存到git棧中。

git stash pop：從git棧中讀取最近一次保存的內容，恢復工作區的相關內容。由於可能存在多個stash的內容，所以用棧來管理，pop會從最近一個stash中讀取內容並恢復到工作區。

git stash list：顯示git棧內的所有備份，可以利用這個列表來決定從那個地方恢復。

git stash clear：情況git棧。
————————————————
版权声明：本文为CSDN博主「liuchunming033」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/liuchunming033/article/details/45368237