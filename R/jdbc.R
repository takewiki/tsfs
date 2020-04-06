#' 设置数据库jdbc文件名
#'
#' @param dbName 数据库名称
#' @param dbVersion 版本
#'
#' @return 返回值
#'
#' @examples
#' jdbc_fileName()
jdbc_fileName <- function(dbName='sqlserver',dbVersion='lastest'){
  full <- paste(dbName,dbVersion,sep="_")
  res <-paste(full,'jar',sep=".")
  return(res)
}


#' 设置下载链接
#'
#' @param dbName 数据库名称
#' @param dbVersion 数据库版本
#'
#' @return 返回值
#'
#' @examples
#' jdbc_url()
jdbc_url <-function(dbName='sqlserver',dbVersion='lastest'){
  base_url <-"http://www.reshapedata.com/rdfiles/jdbc"
  full_url <-paste(base_url,dbName,sep="/")
  full_name <- jdbc_fileName(dbName,dbVersion)
  res <-paste(full_url,full_name,sep='/')
  return(res)
}


#' 创建下载的的目录
#'
#' @param repo 目录
#' @param dbName 数据库名称
#' @param dbVersion 版本
#'
#' @return 返回值
#'
#' @examples
#' jdbc_repo()
jdbc_repo <- function(dbName='sqlserver',dbVersion='lastest',repo='./data-raw') {
  repo <- tsdo::str_suffix_complete(repo)
  file_name <- jdbc_fileName(dbName,dbVersion)
  res <- paste0(repo,file_name)
  return(res)

}

#' 下载jdbc驱动
#'
#' @param dbName 数据库名称
#' @param dbVersion 数据库版本
#' @param repo 下载存放目录
#'
#' @return 返回值
#' @export
#'
#' @examples
#' jdbc()
#' library(tsfs)
#' jdbc()
#' jdbc('sqlserver','7.2.2')
#' jdbc('oracle')
jdbc <- function(dbName='sqlserver',dbVersion='lastest',repo='./data-raw') {
   src <- jdbc_url(dbName,dbVersion)
   dest <- jdbc_repo(dbName,dbVersion,repo)
   res <- tsdo::download(src,dest)
   return(res)
}
