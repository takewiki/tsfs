#' 下载rstudio server文件
#'
#' @param os 操作系统名称
#' @param repo 下载目录
#' @param version 版本号
#'
#' @return 返回值
#' @include file.R
#' @export
#'
#' @examples
#' rstudio_server()
#' library(tsfs)
#' tsfs::rstudio_server('ubuntu16')
#' tsfs::rstudio_server('ubuntu18')
#'tsfs::rstudio_server('centos7')

rstudio_server <- function(os='ubuntu18',repo='./data-raw',version='lastest') {
  res <- pull(appName = 'rstudioserver',appVersion = version,osName = os,repo = repo)
  return(res)

}

