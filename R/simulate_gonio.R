#' simulate some gonio hits
#' 
#' simulate some gonio hits by spitting lines to a file a couple of seconds apart
#' @name simulate_gonio
#' @param logfile a file to output
#' @export
#' @examples 
#' \dontrun{
#' # in one instance of r start the shiny app
#' # run_monitorgonio()
#' 
#' # start a new isntance of R
#' # write the example pttkey
#' write.csv(pttkey, file = "pttkey.csv", row.names = FALSE, sep = ',')
#' # make an empty log file
#' cat("", file = "log")
#' # load the log file and pttkey into the shiny app
#' # fill the log file
#' simualate_gonio("log")
#' }

simulate_gonio <- function(logfile) {
  logsrc <- c(
    "2017-04-25 15:14:39 : USB Connection to RXG134",
    "2017-04-25 15:38:27 Sent : $*2A",
    "2017-04-25 15:38:27 Received : $ACK,*2A,0*0A",
    "",
    "2017-04-27 13:34:20 : USB Connection to RXG134",
    "",
    "2017-05-02 15:51:56 : USB Connection to RXG134",
   " 2017-05-02 15:52:06 Background : $NPRF,0,17,5,2,15,52,5,D7914E1,401677691,6,150,150,-120,-120,-4538624,2153850,25,32,E1B40000*3A",
   " 2017-05-02 15:52:34 Background : $NPRF,0,17,5,2,15,52,33,D7914E1,401677515,7,165,159,-121,-121,-4538625,2153853,25,32,E1B57FC1*7C",
    "2017-05-02 15:52:44 Background : $NPRF,0,17,5,2,15,52,43,D7914E1,401677661,7,342,166,-121,-121,-4538624,2153853,25,32,E1B67FBC*72",
    "2017-05-02 15:57:26 Received : $NPRF,9,17,5,2,15,57,24,0A1FBF2,401677596,6,191,191,-126,-126,-4538626,2153851,25,32,F27E0000*0D",
    "2017-05-02 15:57:40 Sent : $*2A",
    "2017-05-02 15:57:40 Received : $ACK,*2A,0*0A",
    "2017-05-02 15:59:44 Background : $NPRF,9,17,5,2,15,59,43,0A1FBF2,401677557,7,261,201,-118,-118,-4538625,2153852,27,32,F27F7FCE*78",
    "2017-05-02 16:00:22 Received : $NPRF,9,17,5,2,16,0,22,0A1FBF2,401677546,7,185,197,-113,-113,-4538626,2153852,27,32,F2807ECF*3C"
  )
  
  for(i in 1:length(logsrc)) {
    cat(paste0(logsrc[i], "\n"), file = logfile, append = TRUE)
    Sys.sleep(1.5)
  }
}

