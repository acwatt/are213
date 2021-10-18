# Create interactions
vars3 = names(select(df1b, -dbrwt))
for (i in 1:length(vars3)) {
  v1 = vars3[i]
  varlist = vars3[(i+1):length(vars3)]
  for (v2 in varlist) {
    df1b[, paste0(v1,'_',v2)] = df1b[,v1]*df1b[,v2]
  }
}