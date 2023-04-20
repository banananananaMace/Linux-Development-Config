# 一 vim使用技巧

#### 1.1 quickfix操作

| quick fix |                                                    |
| --------- | -------------------------------------------------- |
| `:cc`     | `显示详细错误信息 ( :help :cc )`                   |
| `:cp`     | `跳到上一个错误 ( :help :cp )`                     |
| `:cn`     | `跳到下一个错误 ( :help :cn )`                     |
| `:cl`     | `列出所有错误 ( :help :cl )`                       |
| `:cw`     | `如果有错误列表，则打开quickfix窗口 ( :help :cw )` |
| `:col`    | `到前一个旧的错误列表 ( :help :col )`              |
| `:cnew`   | `到后一个较新的错误列表 ( :help :cnew )`           |

#### 1.2 buffer操作

| buffer                      |                        |
| --------------------------- | ---------------------- |
| `:ls, buffers , files`      | `显示buffers`          |
| `:bn,  bnext`               | `显示下一个buffer`     |
| `:bp, bprev`                | `显示上一个buffer`     |
| `<C-^>`                     | `buffer切换`           |
| `<C-o>`                     | `切换到上一个buffer`   |
| `<C-i>`                     | `切换到下一个buffer`   |
| `:b + num; b + filename;`   | `跳转到指定buffer`     |
| `:e + filename`             | `新建buffer`           |
| `:e  +filename \| read !ls` | `新建并从外部命令获取` |
| `:bd, bdelete filename`     | 删除buffer             |

#### 1.3 window操作

| window                            |                            |
| --------------------------------- | -------------------------- |
| `:sp + filename, spilt, <C-w>S`   | `打开一个水平显示的新窗口` |
| `:vsp + filename, vspilt, <C-w>v` | `打开垂直线是窗口`         |
| `<C+w>h/j/k/l`                    | `切换窗口`                 |
| `<C+w>H/J/K/L`                    | `调整窗口位置`             |

#### 1.4 tab操作

| tab                 |                                     |
| ------------------- | ----------------------------------- |
| `:tabnew filename`  | `打开一个tab`                       |
| `:tabedit filename` | `在当前window创建tab`               |
| `<C-w>T`            | `将当前window从tab分离,创建新tab`   |
| `<C-w>o`            | `将当前window从tab分离,不创建新tab` |
| `windo bd`          | `关闭当前tab所有缓冲区`             |

# 二 oh-my-zsh安装

### 1 联网安装法一

1.1 下载oh-my-zsh

```
git clone git@github.com:ohmyzsh/ohmyzsh.git
```

1.2 执行安装脚本

```
chmod 777 tools/install.sh
sh -x tools/install.sh
```

### ~~2 联网安装法二~~

```
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh -c "$(wget -O- https://gitee.com/pocmon/mirrors/raw/master/tools/install.sh)"
```

### 3 离线安装

下载完Linux-Development-Config后,修改.oh-my-zsh/tools/install.sh脚本, 删除与 setup_ohmyzsh 有关的函数定义及调用及if [ -d "$ZSH" ]; then判断,如图所示
![image](https://user-images.githubusercontent.com/82626291/233510700-dbeb2d72-f874-44e6-b42e-01fa486612b0.png)

# 附 参考指南

[`https://blog.51cto.com/u_15301988/3081024`]()

[`https://www.dreamxu.com/books/vim/plugin/ctrlp.html`]()

[`https://www.cnblogs.com/ma6174/archive/2011/12/10/2283393.html`]()

