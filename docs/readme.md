---
output:
    html_document:
        keep_md: true
---

[repository](https://github.com/williamcioffi/monitorgonio) | [sattagutils](https://williamcioffi.github.io/sattagutils) | [io home](https://williamcioffi.github.io)

### monitorgonio
a quick hack to display [Argos Goniometer](https://www.clsamerica.com/argos-goniometer) output in a user friendly display using `shiny`. 

**WARNING:** still very rough. use at own risk.

### quick guide
install the package:


```r
devtools::install_github("monitorgonio")
```

you can run monitorgonio from an interactive r session:


```r
library(monitorgonio)
run_monitorgonio()
```

or you can automatically generate monitorgonio.bat which will run the shiny app for you.


```r
monitorgonio::make_bat_file("~/Desktop/monitorgonio.bat")
```

be careful for some reason on windows ~ is interpreted as the onedrive... You'll also have to create a ptt key file (CSV) so monitor gonio knows what to listen for. you can get an example template and save it for editing in your favorite editor.


```r
pttkey <- monitorgonio::get_pttkey_example()
write.table(pttkey, file = "~/Desktop/pttkey.csv", sep = ",", row.names = FALSE)
```

you can also construct one easily in R and save it as a csv as above.

```r
pttkey <- data.frame(
	PTT = c("111111", "222222"),
 	HEX = c("0A1FB2", "D7914E1"), 
	DEPLOYID = c("test1", "test2")
)
```

note: you don't really need the PTT column which is for the decimal PTT, unless you just want to keep track of it.

one word of **caution** if you are opening these csv files in excel. if your hex has an E somewhere in the middle and all the other digits are numbers (not letters) then excel will interpret it as scientific notation. For example 12345E2 will be converted into 12345  x 10^2 by excel. this is quite annoying and will happen every time you open the file. it'll look something like this:

|PTT|HEX|DEPLOYID|
|----|----|----|
|171171|1.23E+06|test1|

the best solution is don't use excel because it is a terrible csv editor. but many folks are most confortable with editing csvs in excel so in the past i've added a notes column that starts with text so the real hex can be recovered if someone accidentally edits it in excel and saves the result.

|PTT|HEX|DEPLOYID|notes|
|----|----|----|----|
171171|1.23E+06|test1|hex is 12345E2|

### testing 
you can test monitorgonio a bit even if you don't have a goniometer connected or a platform handy. to do this you'll need two instances of R open. either start monitor gonio with the .bat script, or start it with ```run_monitorgonio()``` and then open a new instance of R.

in this new instance of R first you'll need to save the pttkey from ```get_pttkey_example()``` as above. save it anywhere you like just remember the path. Next we'll need a simulated log file. we'll use a function in a moment to append to the log file as if hits were comming in one by one on the goniometer. but for now you can just create an empty file:


```r
cat("", file = "~/testlog")
```

now make sure monitorgonio is running and go to the shiny window and select both the log file and the pttkey using the buttons and navigating to where you saved them.

finally run the test with: 


```r
monitorgonio::simulate_gonio("~/testlog")
```

and you should see hits appearing in the monitorgonio shiny window.
