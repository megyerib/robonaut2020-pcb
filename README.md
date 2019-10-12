# Robonaut 2020 PCBs - Override

[Original template files](https://github.com/bmeaut/RobonAUT-AltiumTemplate)

## Guidelines
* To **create a new project** copy the template folder and rename it by your choice. Rename the *.PrjPcb* file then open it and rename the remaining files in the Altium designer.
* Work on a **personal branch**, then rebase.
* **Avoid conflicts on binary files**! (one editor at a time)
* _**hallglib**.PcbLib_ & _hallglib.SchLib_ are located in the common folder. The template project links to them. Please don't modify them, create new libraries instead either to the common or the project folder.
* Other auxiliary (eg. OutJob) files are not made common, they are located in the separate project folders to make them individually configurable.
* The binary files are tracked with **Git LFS** (Large File Support) to avoid large repository size. If you want to commit a new binary file type see the *Version control of binary files* chapter.

## How to Altium?
* [Download](https://www.altium.com/products/downloads)
* Install
* Sign in (on the Altium welcome screen)
* Right click on the license ->Use

## Version control of binary files

`git lfs install` command must be executed after every git install.

Text based file types
* .pas
* .OutJob

Binary file types
* .SchDot
* .PcbLib
* .SchLib
* .xlsx
* .PcbDoc
* .PrjPcb

> **Add these files to Git LFS!**
> ```
> git lfs track *.SchDot
> git lfs track *.PcbLib
> git lfs track *.SchLib
> git lfs track *.xlsx
> git lfs track *.PcbDoc
> git lfs track *.PrjPcb
> ```
> These are already added to the .gitattributes file so you don't have anything to do with them.
> To list files tracked by LFS run `git lfs ls-files` in Git bash.
