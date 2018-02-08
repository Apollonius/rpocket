# rpocket

The goal of rpocket is to make retriving data from [Pocket's Retrieve API](https://getpocket.com/developer/docs/v3/retrieve) easier by helping users quickly get the information into useable dataframes. 

Users need their consumer key and access tokens from pocket to get their data. More information on getting those keys can be found [here.](http://www.jamesfmackenzie.com/getting-started-with-the-pocket-developer-api/)

## Installation

You can install rpocket from github with:


``` r
# install.packages("devtools")
devtools::install_github("paylakatel/rpocket")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
# get all pocket data
pocket_data <- get_data(cosumer_key, access_token)

# get articles as a dataframe
articles_df <- get_articles(pocket_data)

# get authors as a dataframe
authors_df <- get_authors(pocket_data)
```
