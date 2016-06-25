# bioc2016Addendum

So, to make things easier for our [https://github.com/HCBravoLab/workshopBioc2016](workshop) at [http://bioconductor.org/help/course-materials/2016/BioC2016/](Bioc2016) we made a few
changes to epivizr (last night...) so that the standalone
version runs within the Rstudio Viewer pane (yay!).

Since we made these changes after course AMI was setup, we need a couple of things before we get going. Follow these instructions and we should be good to go:

```r
# update epivizr
biocLite("epiviz/epivizr", build_vignettes=TRUE)

# install epivizrStandalone
biocLite("epiviz/epivizrStandalone", build_vignettes=TRUE)

# install this package
biocLite("hcbravolab/bioc2016addendum", build_vignettes=TRUE, dependencies=TRUE)
```

From there we can follow the vignette in this package to setup the epiviz workspaces we will use throughout the workshop (my preffered way is to use

```r
file.edit(system.file("doc","Bioc2016Addendum.Rmd", package="bioc2016Addendum"))
```
