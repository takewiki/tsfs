% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rstudio.R
\name{shiny_server}
\alias{shiny_server}
\title{下载shiny server}
\usage{
shiny_server(os = "ubuntu", repo = "./data-raw", version = "lastest")
}
\arguments{
\item{os}{操作系统}

\item{repo}{下载目录}

\item{version}{版本}
}
\value{
返回值
}
\description{
下载shiny server
}
\examples{
shiny_server()
shiny_server()
shiny_server('centos')
}
