cat("THis is the Program,\n for showing Soccer trainning course \n from CGM")

path.csv="exam.csv"
cat("\npath.csv=",path.csv,"\n")

csv=read.csv(path.csv)
cat("\nthe csv object is a ",class(csv),"\n")
cat("having ",ncol(csv)," columns and ",nrow(csv),"rows...\n")
cat("The column names of csv are below:\n")
cat(colnames(csv),sep="\n")

