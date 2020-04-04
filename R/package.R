#' pypkgs文件名
#'
#' @param pkg_name 包名称
#' @param version 版本
#' @param os 操作系统
#' @param py_ver  python版本
#'
#' @return 返回链接
#'
#' @examples
#' pypkg_fileName()
pypkg_fileName <- function(pkg_name='pandas',version='1.0.3',os='linux64',py_ver='py37') {
  url_base <- 'http://www.reshapedata.com/rdfiles/pypkgs'
  url_full <- paste(url_base,pkg_name,sep="/")
  file_name <-paste(pkg_name,os,py_ver,version,sep="_")
  file_full <-paste(file_name,'whl',sep='.')
  res <-paste(url_full,file_full,sep="/")
  return(res)

}

#' 形成基地路径
#'
#' @param pkg_name 包名
#' @param version 版本
#' @param os 操作系统
#' @param py_ver python版本
#' @param repo  存储路径
#'
#' @return 返回完整路径
#' @import tsdo
#'
#' @examples
#' pypkg_repo()
pypkg_repo <- function(pkg_name='pandas',version='1.0.3',os='linux64',py_ver='py37',repo='./data-raw') {
  file_name <-paste(pkg_name,os,py_ver,version,sep="_")
  file_full <-paste(file_name,'whl',sep='.')
  if (right(repo,1) != '/'){
    repo <- paste(repo,"/",sep="")
  }
  res <-paste(repo,file_full,sep = '')


  return(res)

}

#' 安装python包
#'
#' @param pkg_name 包名称
#' @param version 包版本
#' @param os 操作系统
#' @param py_ver python版本
#' @param repo 存放目录
#'
#' @return 返回值
#' @export
#'
#' @examples
#' py_pkgs()
#' library(tsfs)
#' tsfs::py_pkgs()
#' tsfs::py_pkgs(os='linux32')
#' tsfs::py_pkgs(pkg_name = 'numpy',version = '1.18.2',os = 'linux64',py_ver = 'py37')
py_pkgs <- function(pkg_name='pandas',version='1.0.3',os='linux64',py_ver='py37',repo='./data-raw') {
    src <- pypkg_fileName(pkg_name,version,os,py_ver)
    dest <- pypkg_repo(pkg_name,version,os,py_ver,repo)
    r <- download.file(src,dest,quiet = TRUE)
    if(r == 0){
      res <-TRUE
    }else{
      res <- FALSE
    }
    return(res)

}
