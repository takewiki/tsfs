#' 根据操作系统参数猜后缀名
#'
#' @param osName 操作系统名单
#'
#' @return 返回后缀名
#'
#' @examples
#' file_format_guess('ubuntu')
file_format_guess <-function(osName='ubuntu'){
  if(osName=='ubuntu'||osName=='ubuntu14'||osName=='ubuntu16'||osName=='ubuntu18'){
    res <- '.deb'
  }else if(osName =='centos'||osName=='centos6'||osName=='centos7'||osName=='centos8'){
    res <- '.rpm'
  }else if (osName =='win'||osName =='win32'||osName=='win64'){
    res <- '.exe'
  }else{
    res <-'.unknown'
  }
  return(res)

}

#' 形成文件名
#'
#' @param appName 主文件名称
#' @param appVersion 主文件版本
#' @param osName 操作系统名称
#'
#' @return 返回值
#'
#' @examples
#' fileName('shinyserver','lastest','ubuntu')
#'
fileName <- function(appName='shinyserver',appVersion='lastest',osName='ubuntu'){
  base_url ='http://www.reshapedata.com/rdfiles'
  file_url = paste(base_url,appName,sep="/")
  fullName <- paste(appName,osName,appVersion,sep = "_");
  suffix <- file_format_guess(osName);
  fullName2 <- paste(fullName,suffix,sep="")
  res <-paste(file_url,fullName2,sep = '/')


  return(res)


}


pull <- function(appName='shinyserver',appVersion='lastest',osName='ubuntu',repo="./"){
  file_dl <- fileName(appName,appVersion,osName)
  res <- download.file(file_dl,repo)
  return(res)

}