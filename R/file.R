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


#' 形成本地的文件
#'
#' @param appName 文件名
#' @param appVersion 文件版本
#' @param osName 操作系统
#' @param repo 下载路径
#'
#' @return 返回值
#' @import tsdo
#'
#' @examples
#' repo_fileName()
repo_fileName <- function(appName='shinyserver',appVersion='lastest',osName='ubuntu',repo='./'){

  fullName <- paste(appName,osName,appVersion,sep = "_");
  suffix <- file_format_guess(osName);
  fullName2 <- paste(fullName,suffix,sep="")
  if (right(repo,1) != '/'){
    repo <- paste(repo,"/",sep="")
  }
  res <-paste(repo,fullName2,sep = '')


  return(res)


}


#' 提取数据
#'
#' @param appName 文件名称
#' @param appVersion 文件版本
#' @param osName  操作系统名称
#' @param repo 下载路径
#'
#' @return 下载成功返回TRUE否则返回FALSE
#' @export
#'
#' @examples
#' library(tsfs)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2.5033',osName = 'centos6',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2',osName = 'centos6',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = 'lastest',osName = 'centos6',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2.5033',osName = 'centos7',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2',osName = 'centos7',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = 'lastest',osName = 'centos7',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2.5033',osName = 'centos8',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2',osName = 'centos8',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = 'lastest',osName = 'centos8',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2.5033',osName = 'ubuntu14',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2',osName = 'ubuntu14',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = 'lastest',osName = 'ubuntu14',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2.5033',osName = 'ubuntu16',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2',osName = 'ubuntu16',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = 'lastest',osName = 'ubuntu16',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2.5033',osName = 'ubuntu18',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = '1.2',osName = 'ubuntu18',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'rstudioserver',appVersion = 'lastest',osName = 'ubuntu18',repo = './data-raw')
#' print(bb)
#' bb <- pull(appName = 'shinyserver',appVersion = '1.5.13.944',osName = 'centos')
#' bb <- pull(appName = 'shinyserver',appVersion = '1.5',osName = 'centos')
#' bb <- pull(appName = 'shinyserver',appVersion = 'lastest',osName = 'centos')
#' bb <- pull(appName = 'shinyserver',appVersion = '1.5.13.944',osName = 'ubuntu')
#' bb <- pull(appName = 'shinyserver',appVersion = '1.5',osName = 'ubuntu')
#' bb <- pull(appName = 'shinyserver',appVersion = 'lastest',osName = 'ubuntu')

pull <- function(appName='shinyserver',appVersion='lastest',osName='ubuntu',repo="./data-raw"){
  file_dl <- fileName(appName,appVersion,osName)
  file_repo <- repo_fileName(appName,appVersion,osName,repo)
  r <- download.file(file_dl,file_repo,quiet = TRUE)
  if(r == 0){
    res <-TRUE
  }else{
    res <- FALSE
  }
  return(res)

}
